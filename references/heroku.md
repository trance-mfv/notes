## heroku commands

```
$ heroku --version
```

Example:
```
$ heroku --version
heroku/10.5.0 darwin-arm64 node-v20.17.0
```

```
$ heroku login
heroku: Press any key to open up the browser to login or q to exit: 

$ heroku login
heroku: Press any key to open up the browser to login or q to exit: 
Opening browser to https://cli-auth.heroku.com/auth/cli/browser/308762c1-d8ea-4f14-aa30-ee13f1060069?requestor=SFMyNTY.g2gDbQAAAAwyNy43MS4yMDcuODJuBgDgEjLtlgFiAAFRgA.Xh6XaTZ0UpaMEDy75n10MVwk6eJB0xhlIf6_byQSeSk
Logging in... done
Logged in as tran.kinh.ly+herokutateam@moneyforward.co.jp
```

```
$ heroku apps --team moneyforwardvietnam
=== Apps in team moneyforwardvietnam
```

Example:
```
$ heroku apps --team moneyforwardvietnam | grep tax-adjustment
tax-adjustment-idev
tax-adjustment-next-release
tax-adjustment-web-beta
tax-adjustment-web-dev

$ heroku run rails c -a tax-adjustment-next-release
Running rails c on ⬢ tax-adjustment-next-release... up, run.4552
```

## Faraday

### Connection to Navis API
```
Faraday.new(conn_options) do |c|
  c.request :json
  c.request :basic_auth, Settings.navis_ruby_client.username, Settings.navis_ruby_client.password
  c.options.timeout = 30
  c.options.open_timeout = 30
end

conn = Faraday.new('https://biz-admin-internal-api.test.mfw.work') do |c|
  c.headers['Content-Type'] = 'application/json'
  c.headers['User-Agent'] = 'Navis Ruby Client v0.28.4'
  c.request :json
  c.request :basic_auth, Settings.navis_ruby_client.username, Settings.navis_ruby_client.password
  c.options.timeout = 30
  c.options.open_timeout = 30
  c.ssl.verify = false
  c.response :logger, Logger.new(STDOUT), bodies: true
  c.adapter Faraday.default_adapter
end

conn2 = Faraday.new('https://biz-admin-internal-api.test.mfw.work/internal_api') do |c|
  c.headers['Content-Type'] = 'application/json'
  c.headers['User-Agent'] = 'Navis Ruby Client v0.28.4'
  c.request :json
  c.request :basic_auth, Settings.navis_ruby_client.username, Settings.navis_ruby_client.password
  c.options.timeout = 30
  c.options.open_timeout = 30
  c.response :logger, Logger.new(STDOUT), bodies: true
  c.adapter :httpclient
end

response = conn.get('/internal_api/tenants/1234')
response = conn2.get("/tenants/#{o.tenant_uid}")

response = conn.get('/tenants/1234')
response = conn.get("/tenants/#{o.tenant_uid}")
response = conn.get("/tenants/#{o.tenant_uid}")
  c.adapter Faraday.default_adapter
  c.adapter :httpclient

#  c.request :basic_auth, Settings.navis_ruby_client.username, Settings.navis_ruby_client.password
```


#<Faraday::Connection:0x00007fe22b40ae60
 @builder=
  #<Faraday::RackBuilder:0x00007fe22d661810
   @adapter=Faraday::Adapter::NetHttp,
   @handlers=
    [FaradayMiddleware::EncodeJson,
     Faraday::Request::BasicAuthentication,
     Datadog::Tracing::Contrib::Faraday::Middleware]>,
 @default_parallel_manager=nil,
 @headers={"Content-Type" => "application/json", "User-Agent" => "Navis Ruby Client v0.28.4"},
 @manual_proxy=false,
 @options=
  #<struct Faraday::RequestOptions
   params_encoder=nil,
   proxy=nil,
   bind=nil,
   timeout=nil,
   open_timeout=nil,
   read_timeout=nil,
   write_timeout=nil,
   boundary=nil,
   oauth=nil,
   context=nil,
   on_data=nil>,
 @parallel_manager=nil,
 @params={},
 @proxy=nil,
 @ssl=
  #<struct Faraday::SSLOptions
   verify=nil,
   ca_file=nil,
   ca_path=nil,
   verify_mode=nil,
   cert_store=nil,
   client_cert=nil,
   client_key=nil,
   certificate=nil,
   private_key=nil,
   verify_depth=nil,
   version=nil,
   min_version=nil,
   max_version=nil>,
 @url_prefix=#<URI::HTTP http://navis-web-server.stg-navis/internal_api>>


 #<Faraday::Connection:0x00007fe22d65a650
 @builder=
  #<Faraday::RackBuilder:0x00007fe22b11b510
   @adapter=Faraday::Adapter::NetHttp,
   @handlers=
    [FaradayMiddleware::EncodeJson,
     Faraday::Request::BasicAuthentication,
     Datadog::Tracing::Contrib::Faraday::Middleware]>,
 @default_parallel_manager=nil,
 @headers={"Content-Type" => "application/json", "User-Agent" => "Navis Ruby Client v0.28.4"},
 @manual_proxy=false,
 @options=
  #<struct Faraday::RequestOptions
   params_encoder=nil,
   proxy=nil,
   bind=nil,
   timeout=30,
   open_timeout=30,
   read_timeout=nil,
   write_timeout=nil,
   boundary=nil,
   oauth=nil,
   context=nil,
   on_data=nil>,
 @parallel_manager=nil,
 @params={},
 @proxy=nil,
 @ssl=
  #<struct Faraday::SSLOptions
   verify=nil,
   ca_file=nil,
   ca_path=nil,
   verify_mode=nil,
   cert_store=nil,
   client_cert=nil,
   client_key=nil,
   certificate=nil,
   private_key=nil,
   verify_depth=nil,
   version=nil,
   min_version=nil,
   max_version=nil>,
 @url_prefix=#<URI::HTTPS https://biz-admin-internal-api.test.mfw.work/internal_api>>


 conn_options = {
          url: base_endpoint,
          headers: { content_type: 'application/json', user_agent: "Navis Ruby Client v#{VERSION}" }
        }.merge(heroku_ssl_options)

### Heroku H12 error

```
2025-05-20T09:26:35.412254+00:00 heroku[router]: at=error code=H12 desc="Request timeout" method=POST path="/my/year_end_tax_adjustment/steps/insurance/life_insurance/upload_auto_reading" host=tax-milestone-dependabot.herokuapp.com request_id=5fabafa0-9bf5-4261-869f-7ec0101e6b4c fwd="113.161.149.212" dyno=web.1 connect=0ms service=31920ms status=503 bytes=0 protocol=https
```