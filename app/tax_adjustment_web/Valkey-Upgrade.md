Upgrading from Redis to Valkey on staging

---

## Steps:

At `tax-adjustment-web`
1. After TAX Released
2. Get latest code: 
   - Merge `develop` to [`TAXW-2277-upgrade-redis`](https://github.com/moneyforward/tax_adjustment_web/pull/11438)
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
