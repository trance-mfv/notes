# UPGRADE VALKEY for Production:

-  Slack: https://moneyforward.slack.com/archives/C08G096E1M1/p1751604212214559?thread_ts=1751268078.565129&cid=C08G096E1M1 

## Preparation:
- Maintenance Mode: use [this PR](https://github.com/moneyforward/k8s-service-manifests/pull/147497) to enable maintenance mode for TA prod
- Changes from TA: has been merged via [this PR](https://github.com/moneyforward/tax_adjustment_web/pull/11438)
- New REDIS_URL: use [this PR](https://github.com/moneyforward/k8s-service-manifests/pull/147502) to update
- To create another PR to disable Maintenance Mode after done

## Plan:
1. Before release steps:
   1.1 [Done]  Prepare PR to enable  maintenance mode and  quite all background jobs ([committed](https://github.com/moneyforward/k8s-service-manifests/pull/147497/commits/442da8e8f8af87507121e90a3cb7cb7b3c4bfa76))
   1.2 [Done] Mute Datadog to prevent false alarms. Trance MFV
      - [Synthetic test monitor](https://app.datadoghq.com/synthetics/tests?query=type%3Abrowser%20team%3Atax-adjustment&cols=monitorStatus%2Ctype%2Cname%2Cdomain%2Ctags%2Cenvs%2Cuptime&page_index=0&refresh_mode=paused&from_ts=1751316000000&to_ts=1751319600000&live=false)

2 Valkey upgrade steps:
   2.1 [Done] Merge PR to maintenance mode ([[TA] Enable Maintenance Mode for Prod](https://github.com/moneyforward/k8s-service-manifests/pull/147497)) Trance MFV
      2.1.1 Approve step `approval_platform_production`
         - https://app.circleci.com/pipelines/github/moneyforward/tax_adjustment_web/7249/workflows/1209b00d-ed22-41a4-a019-021011823de6/jobs/28470
   
   2.2 SRE will upgrade Valkey via AWS console.
      2.2.1 [Done] Process upgrade Valkey server. Trung Phan Minh (Tade)
      2.2.2 [Done] Enable "Encrypt in transit” after upgrading.Trung Phan Minh (Tade)
      2.2.3 [Done] Merge pr to setup annotations for Trung Phan Minh (Tade) Karpenter do not disrupt ([[ta] Add annotations for Karpenter do not disrupt](https://github.com/moneyforward/k8s-service-manifests/pull/147971))
      2.2.4 [Done] Get a new Primary Endpoint.Trung Phan Minh (Tade) 
         - rediss://master.ta-elasticache.4dpysz.apne1.cache.amazonaws.com:6379

   2.3 TA to approve approval_platform_production (in CircleCI)
      2.3.1 [Done]  Update REDIS_URL with the new endpoint and push the change to PR Trance MFV
      2.3.2 [Done] PR: [Deploy tax-adjustment-web to prod](https://github.com/moneyforward/k8s-service-manifests/pull/148027/files) Trance MFV

   2.4 In K8s repo: Disable Maintenance Mode.
      2.4.1 [Done] Revert [PR](https://github.com/moneyforward/k8s-service-manifests/pull/147497/files) Trance MFV
      2.4.2 [Done] Confirm whether the site's behavior is functioning correctly Trance MFV Nas (Dam Phu Duong)
      2.4.3 [Done] Enable the Datadog browser test Nas (Dam Phu Duong)

Upgrading from Redis to Valkey on staging

* Notes:
   - AWS Elasticache's Encrypt in transit must be manually enabled
---

# How to enable maintenance mode on TaxAdjustment

https://moneyforward.kibe.la/notes/325586

## Steps:

At `tax-adjustment-web`
1. After TAX Released
2. Get latest code: 
   - Merge [`TAXW-2277-upgrade-redis`](https://github.com/moneyforward/tax_adjustment_web/pull/11438) to `develop`
   - Merge `develop` to `master`
3. Push `TAXW-2277-upgrade-redis` built image to ECR
   `TAXW-2277-upgrade-redis` branch to step `build-push-ecr-platform`:
   
   - Go to `.circleci/config.yml`, find the job `build-push-ecr-platform` in `build_deploy`:
   - To trigger the job, add `TAXW-2277-upgrade-redis` branch to the filters:
   ```
         # deploy service platform
      - build-push-ecr-platform:
          requires:
            - approval_staging
          context:
            - docker-hub-shared-creds
          name: docker-build-and-push-stg
          component: web
          target-tag: master
          filters:
            branches:
              only:
                - master
                - TAXW-2277-upgrade-redis
   ```
   - Push this change to a PR

4. Get the image hash:
   - Go to Circle CI
   - View the Workflow: `build_deploy`
   - View the Job: `docker-build-and-push-stg`
   - Open the Step: `Push image to Amazon ECR`
   - Find the image id with this pattern: `master-web-<commit-hash>` 
      For example: `master-web-2e626c4f7f84bc1da4869f8d423c40bcaea8d83b`

At `k8s-service-manifests`
1. For staging env, open file: `services/tax-adjustment/environments/stg/kustomization.yaml`
2. Update `tax-adjustment-web` new Tag with the new image id, 
   - `newTag: master-web-<commit-hash>`

   For example: 
      From: 
      ```
      images:
      - name: tax-adjustment-web
      newName: 202732020874.dkr.ecr.ap-northeast-1.amazonaws.com/tax-adjustment-web
      newTag: master-web-ba4a4bd53a4fa00c7cb55ece6ea8743e45924118
      ```

      To: 
      ```
      images:
      - name: tax-adjustment-web
      newName: 202732020874.dkr.ecr.ap-northeast-1.amazonaws.com/tax-adjustment-web
      newTag: master-web-2e626c4f7f84bc1da4869f8d423c40bcaea8d83b
      ```

3. Update the env var for REDIS_URL
   - In `services/tax-adjustment/environments/stg/files/tax-adjustment.env`
   - Update new REDIS_URL
   ```
   REDIS_URL=rediss://ta-elasticache.ltkq9w.ng.0001.apne1.cache.amazonaws.com:6379
   ```

   - Update or remove unnecessary env var, for example Redis reconnect configs:
   ```
   # Redis config
   REDIS_RECONNECT_ATTEMPTS=5
   REDIS_RECONNECT_DELAY=0.1
   REDIS_RECONNECT_DELAY_MAX=1
   ```

4. Create PR and push change to trigger the deployment

## Additional Steps:

Revert upgrade branch:
1. At `tax-adjustment-web`:
   - Remove this line from `.circleci/config.yml` and push the change
   ```
      - TAXW-2277-upgrade-redis
   ```

2. **Merge this branch to staging so the next staging build will include the upgrade**

---

### Troubleshoots:

#### 
tax-adjustment-web(staging)> rc.info
=> 
{"redis_version" => "7.2.4",
 "server_name" => "valkey",
 "valkey_version" => "7.2.6",
 "redis_git_sha1" => "0",
 "redis_git_dirty" => "0",
 "redis_build_id" => "0",
 "redis_mode" => "standalone",
 "os" => "Amazon ElastiCache",
 "arch_bits" => "64",
 "monotonic_clock" => "X86 TSC @ 2500 ticks/us",
 "multiplexing_api" => "epoll",
 "atomicvar_api" => "c11-builtin",
 "gcc_version" => "0.0.0",
 "process_id" => "1",
 "run_id" => "0b59acba53c81b617edf6a76b761b924320fc224",
 "tcp_port" => "6379",
 "server_time_usec" => "1751540821852449",
 "uptime_in_seconds" => "3076",
 "uptime_in_days" => "0",
 "hz" => "10",
 "configured_hz" => "10",
 "lru_clock" => "6710357",
 "executable" => "-",
 "config_file" => "-",
 "availability_zone" => "ap-northeast-1c",
 "connected_clients" => "413",
 "cluster_connections" => "0",
 "maxclients" => "46000",
 "client_recent_max_input_buffer" => "20539",
 "client_recent_max_output_buffer" => "64",
 "blocked_clients" => "129",
 "tracking_clients" => "0",
 "clients_in_timeout_table" => "129",
 "total_blocking_keys" => "12",
 "total_blocking_keys_on_nokey" => "0",
 "used_memory" => "170144480",
 "used_memory_human" => "162.26M",
 "used_memory_rss" => "187015168",
 "used_memory_rss_human" => "178.35M",
 "used_memory_peak" => "171165144",
 "used_memory_peak_human" => "163.24M",
Preparing full inspection value...
I, [2025-07-03T20:07:02.062072 #14]  INFO -- datadog: [datadog] DATADOG CONFIGURATION - TRACING - {"enabled":true,"agent_url":"http://10.16.23.44:8126?timeout=30","analytics_enabled":true,"sample_rate":null,"sampling_rules":null,"integrations_loaded":"http@3.4.4,active_model_serializers@0.10.15,aws@,concurrent_ruby@1.3.5,dalli@,delayed_job@,elasticsearch@,ethon@,excon@0.91.0,faraday@1.10.4,grape@,graphql@,grpc@,hanami@,httpclient@2.8.3,httprb@,kafka@,karafka@,mongo@2.21.0,mysql2@0.5.5,opensearch@,pg@,presto@,que@,racecar@,rails@7.2.2.1,rake@13.2.1,redis@5.4.0,resque@,rest_client@,roda@,sequel@,shoryuken@,sidekiq@7.3.9,sinatra@,sneakers@,stripe@,sucker_punch@,trilogy@,rack@2.2.14,action_cable@7.2.2.1,action_mailer@7.2.2.1,active_support@7.2.2.1,action_pack@7.2.2.1,action_view@7.2.2.1,active_job@7.2.2.1,active_record@7.2.2.1,lograge@0.12.0","partial_flushing_enabled":false}
=> 
{"redis_version" => "7.2.4",
 "server_name" => "valkey",
 "valkey_version" => "7.2.6",
 "redis_git_sha1" => "0",
 "redis_git_dirty" => "0",
 "redis_build_id" => "0",
 "redis_mode" => "standalone",
 "os" => "Amazon ElastiCache",
 "arch_bits" => "64",
 "monotonic_clock" => "X86 TSC @ 2500 ticks/us",
 "multiplexing_api" => "epoll",
 "atomicvar_api" => "c11-builtin",
 "gcc_version" => "0.0.0",
 "process_id" => "1",
 "run_id" => "0b59acba53c81b617edf6a76b761b924320fc224
",
 "tcp_port" => "6379",
 "server_time_usec" => "1751540821852449",
 "uptime_in_seconds" => "3076",
 "uptime_in_days" => "0",
 "hz" => "10",
 "configured_hz" => "10",
 "lru_clock" => "6710357",
 "executable" => "-",
 "config_file" => "-",
 "availability_zone" => "ap-northeast-1c",
 "connected_clients" => "413",
 "cluster_connections" => "0",
 "maxclients" => "46000",
 "client_recent_max_input_buffer" => "20539",
 "client_recent_max_output_buffer" => "64",
 "blocked_clients" => "129",
 "tracking_clients" => "0",
 "clients_in_timeout_table" => "129",
 "total_blocking_keys" => "12",
 "total_blocking_keys_on_nokey" => "0",
 "used_memory" => "170144480",
 "used_memory_human" => "162.26M",
 "used_memory_rss" => "187015168",
 "used_memory_rss_human" => "178.35M",
 "used_memory_peak" => "171165144",
 "used_memory_peak_human" => "163.24M",
 "used_memory_peak_perc" => "99.40%",
 "used_memory_overhead" => "15735681",
 "used_memory_startup" => "7908200",
 "used_memory_dataset" => "154408799",
 "used_memory_dataset_perc" => "95.18%",
 "allocator_allocated" => "186981144",
 "allocator_active" => "187953152",
 "allocator_resident" => "193916928",
 "used_memory_lua" => "36864",
 "used_memory_vm_eval" => "36864",
 "used_memory_lua_human" => "36.00K",
 "used_memory_scripts_eval" => "608",
 "number_of_cached_scripts" => "2",
 "number_of_functions" => "0",
 "number_of_libraries" => "0",
 "used_memory_vm_functions" => "32768",
 "used_memory_vm_total" => "69632",
 "used_memory_vm_total_human" => "68.00K",
 "used_memory_functions" => "184",
 "used_memory_scripts" => "792",
 "used_memory_scripts_human" => "792B",
 "maxmemory" => "2488396677",
 "maxmemory_human" => "2.32G",
 "maxmemory_policy" => "volatile-lru",
 "allocator_frag_ratio" => "1.01",
 "allocator_frag_bytes" => "972008",
 "allocator_rss_ratio" => "1.03",
 "allocator_rss_bytes" => "5963776",
 "rss_overhead_ratio" => "0.96",
 "rss_overhead_bytes" => "-6901760",
 "mem_fragmentation_ratio" => "1.10",
 "mem_fragmentation_bytes" => "16911432",
 "mem_not_counted_for_evict" => "33976",
 "mem_replication_backlog" => "1048580",
 "mem_total_replication_buffers" => "1086712",
 "mem_clients_slaves" => "38136",
 "mem_clients_normal" => "4075973",
 "mem_cluster_links" => "0",
 "mem_aof_buffer" => "0",
 "mem_allocator" => "jemalloc-5.3.0",
 "active_defrag_running" => "0",
 "lazyfree_pending_objects" => "0",
 "lazyfreed_objects" => "0",
 "loading" => "0",
 "async_loading" => "0",
 "current_cow_peak" => "0",
 "current_cow_size" => "0",
 "current_cow_size_age" => "0",
 "current_fork_perc" => "0.00",
 "current_save_keys_processed" => "0",
 "current_save_keys_total" => "0",
 "rdb_changes_since_last_save" => "9805",
 "rdb_bgsave_in_progress" => "0",
 "rdb_last_save_time" => "1751537745",
 "rdb_last_bgsave_status" => "ok",
 "rdb_last_bgsave_time_sec" => "0",
 "rdb_current_bgsave_time_sec" => "-1",
 "rdb_saves" => "0",
 "rdb_last_cow_size" => "4304896",
 "rdb_last_load_keys_expired" => "0",
 "rdb_last_load_keys_loaded" => "33212",
 "aof_enabled" => "0",
 "aof_rewrite_in_progress" => "0",
 "aof_rewrite_scheduled" => "0",
 "aof_last_rewrite_time_sec" => "-1",
 "aof_current_rewrite_time_sec" => "-1",
 "aof_last_bgrewrite_status" => "ok",
 "aof_rewrites" => "0",
 "aof_rewrites_consecutive_failures" => "0",
 "aof_last_write_status" => "ok",
 "aof_last_cow_size" => "0",
 "module_fork_in_progress" => "0",
 "module_fork_last_cow_size" => "0",
 "ssl_enabled" => "yes",
 "ssl_current_certificate_not_before_date" => "Jul  3 00:00:00 2
025 GMT",
 "ssl_current_certificate_not_after_date" => "Aug  1 23:59:59 20
26 GMT",
 "ssl_current_certificate_serial" => "0191D68CF5FA8421B4C89B3866
D21D14",
 "tls_mode_connected_tcp_clients" => "0",
 "tls_mode_connected_tls_clients" => "413",
 "total_connections_received" => "16345",
 "total_commands_processed" => "54546",
 "instantaneous_ops_per_sec" => "75",
 "total_net_input_bytes" => "33714205",
 "total_net_output_bytes" => "60583448",
 "total_net_repl_input_bytes" => "28501812",
 "total_net_repl_output_bytes" => "2125897",
 "instantaneous_input_kbps" => "5.87",
 "instantaneous_output_kbps" => "13.29",
 "instantaneous_input_repl_kbps" => "0.00",
 "instantaneous_output_repl_kbps" => "3.46",
 "rejected_connections" => "0",
 "sync_full" => "14",
 "sync_partial_ok" => "8",
 "sync_partial_err" => "4",
 "expired_keys" => "5",
 "expired_stale_perc" => "0.00",
 "expired_time_cap_reached_count" => "0",
 "expire_cycle_cpu_milliseconds" => "654",
 "evicted_keys" => "0",
 "evicted_clients" => "0",
 "evicted_scripts" => "0",
 "total_eviction_exceeded_time" => "0",
 "current_eviction_exceeded_time" => "0",
 "keyspace_hits" => "1750",
 "keyspace_misses" => "499",
 "pubsub_channels" => "1",
 "pubsub_patterns" => "0",
 "pubsubshard_channels" => "0",
 "latest_fork_usec" => "1682",
 "total_forks" => "10",
 "migrate_cached_sockets" => "0",
 "slave_expires_tracked_keys" => "0",
 "active_defrag_hits" => "0",
 "active_defrag_misses" => "0",
 "active_defrag_key_hits" => "0",
 "active_defrag_key_misses" => "0",
 "total_active_defrag_time" => "0",
 "current_active_defrag_time" => "0",
 "tracking_total_keys" => "0",
 "tracking_total_items" => "0",
 "tracking_total_prefixes" => "0",
 "unexpected_error_replies" => "0",
 "total_error_replies" => "6840",
 "dump_payload_sanitizations" => "0",
 "total_reads_processed" => "82899",
 "total_writes_processed" => "73221",
 "io_threaded_reads_processed" => "0",
 "io_threaded_writes_processed" => "0",
 "reply_buffer_shrinks" => "13877",
 "reply_buffer_expands" => "1586",
 "eventloop_cycles" => "128286",
 "eventloop_duration_sum" => "22825423",
 "eventloop_duration_cmd_sum" => "2600451",
 "instantaneous_eventloop_cycles_per_sec" => "62",
 "instantaneous_eventloop_duration_usec" => "193",
 "acl_access_denied_auth" => "0",
 "acl_access_denied_cmd" => "0",
 "acl_access_denied_key" => "0",
 "acl_access_denied_channel" => "0",
 "role" => "master",
 "connected_slaves" => "2",
 "slave0" => "ip=10.3.2.180,port=6379,state=online,offset=743262
89175,lag=1",
 "slave1" => "ip=10.3.1.114,port=6379,state=online,offset=743262
90224,lag=1",
 "master_failover_state" => "no-failover",
 "master_replid" => "f7428d873d1fbad09be0492ace2dddc899de3095
",More--
 "master_replid2" => "3cac31e759b46622c00e5458726c2cba5018745c
m",ore--
 "master_repl_offset" => "74326290277",
 "second_repl_offset" => "74325229977",
 "repl_backlog_active" => "1",
 "repl_backlog_size" => "1048576",
 "repl_backlog_first_byte_offset" => "74325226060",
 "repl_backlog_histlen" => "1064218",
 "used_cpu_sys" => "6.173547",
 "used_cpu_user" => "15.688839",
 "used_cpu_sys_children" => "0.111177",
 "used_cpu_user_children" => "0.620157",
 "used_cpu_sys_main_thread" => "5.586950",
 "used_cpu_user_main_thread" => "15.261594",
 "errorstat_ERR" => "count=6840",
 "cluster_enabled" => "0",
 "db0" => "keys=47,expires=19,avg_ttl=72571349",
 "db1" => "keys=264,expires=255,avg_ttl=112155401223"
0m,
 "db2" => "keys=32743,expires=32743,avg_ttl=114909419",
 "db9" => "keys=193,expires=182,avg_ttl=141615201225"
0m}

#### Show Certificates

app@tax-adjustment-web-console-0:/app$ openssl s_client -connect ta-elasticache.ltkq9w.ng.0001.apne1.cache.amazonaws.com:6379 -showcerts
CONNECTED(00000003)
depth=2 C = US, O = Amazon, CN = Amazon Root CA 1
verify return:1
depth=1 C = US, O = Amazon, CN = Amazon RSA 2048 M04
verify return:1
depth=0 CN = *.ta-elasticache.ltkq9w.apne1.cache.amazonaws.com
verify return:1
---

-----END CERTIFICATE-----
---
Server certificate
subject=CN = *.ta-elasticache.ltkq9w.apne1.cache.amazonaws.com

issuer=C = US, O = Amazon, CN = Amazon RSA 2048 M04

---
No client certificate CA names sent
Peer signing digest: SHA256
Peer signature type: RSA-PSS
Server Temp Key: X25519, 253 bits
---
SSL handshake has read 5230 bytes and written 411 bytes
Verification: OK
---
New, TLSv1.3, Cipher is TLS_AES_128_GCM_SHA256
Server public key is 2048 bit
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
Early data was not sent
Verify return code: 0 (ok)
---

