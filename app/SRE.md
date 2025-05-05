Tade/phan.minh.trung
  Apr 21st at 17:20
@Nas/dam.phu.duong
: Nhờ product team check cái 1 và 2. review xem nó match với nhau chưa nha. :man-raising-hand:

[Vault secrets](https://vault.prod.musubu.co.in/ui/vault/dashboard)
[Common variables](https://github.com/moneyforward/k8s-service-manifests/blob/master/services/tax-adjustment/environments/prod/files/tax-adjustment.env)
Check DMS task :done2:
Confirm connectivity :inprogress:

```
# tax-adjustment.env
RAILS_MAX_THREADS=5
RAILS_LOG_TO_STDOUT=enabled
RACK_ENV=production
RAILS_ENV=production
RAILS_SERVE_STATIC_FILES=enabled
SITE_SCHEME=https
SITE_PORT=
# ENCRYPTION_KEY={injected from vault}
# SECRET_KEY_BASE={injected from vault}
# ENCRYPTION_SALT={injected from vault}
LANG=en_US.UTF-8
SITE_DOMAIN=tax-adjustment.moneyforward.com
MAIL_DOMAIN=moneyforward.com

# DB
DATABASE_HOSTNAME=prod-ta-rds-20250403062455451200000006.cluster-caexsumjbv1s.ap-northeast-1.rds.amazonaws.com
DATABASE_NAME=tax_adjustment_web_production
DATABASE_USERNAME=root
# DATABASE_PASSWORD={injected from vault}

# AZURE
AZURE_CLIENT_ID=709936b5-cb17-4c3a-8972-dfa91f91e3d8
# AZURE_CLIENT_SECRET={injected from vault}
AZURE_TENANT_ID=f879bf71-a0d5-4249-b5b7-5f8a6fb6aa77


# CIPHER_IV={injected from vault}
# CIPHER_KEY={injected from vault}
# CUSTOM_CIPHER_IV_SALT={injected from vault}
# CUSTOM_CIPHER_KEY_SALT={injected from vault}

# MFID
MFID_ISSUER_URL=https://id.moneyforward.com/
MFID_CLIENT_ID=OdII7gHa4v8Oouz6IbXSdRrVkTdbdzyISbOdEpEv070
# MFID_CLIENT_SECRET={injected from vault}

# NAVIS
NAVIS_INTERNAL_API_BASE_ENDPOINT=http://navis-web-server.prod-navis/internal_api
NAVIS_INTERNAL_API_BASIC_AUTH_USERNAME=3fc4b6cf2d5660c7c8f41202491350ae
# NAVIS_INTERNAL_API_BASIC_AUTH_PASSWORD={injected from vault}
NAVIS_URL=https://biz-admin.moneyforward.com/

# MY_NUMBER
MY_NUMBER_INTERNAL_API_BASE_ENDPOINT=http://my-web-server.prod-my-web/
MY_NUMBER_INTERNAL_API_BASIC_AUTH_USERNAME=58DKI1R8oO95S7VhqO8762nV
# MY_NUMBER_INTERNAL_API_BASIC_AUTH_PASSWORD={injected from vault}


# PA
PA_API_BASE_ENDPOINT=http://pa-web-server.prod-pa-web/api/ta
PA_CAN_INTEGRATE=fasle
# PA_PASS={injected from vault}
PA_USER=i4SwUOGtINWlUaphjKUXMA
PA_UUID=ac745b6d-9498-4bc3-871b-fb19aab6dc7e

# REDIS
REDIS_URL=redis://ta-elasticache.4dpysz.ng.0001.apne1.cache.amazonaws.com:6379
REDIS_SESSION_DB_INDEX=0
SIDEKIQ_REDIS_DB_INDEX=1
TA_CACHING_NAVIS_REDIS_DB_INDEX=2

# ROLLBAR
# ROLLBAR_ACCESS_TOKEN={injected from vault}

# TIMEOUT
FARADAY_TIMEOUT=300
MFID_CONNECT_TIMEOUT=30
FARADAY_CONNECT_TIMEOUT=30

# S3
# S3_AWS_ACCESS_KEY_ID={injected from vault}
S3_AWS_BUCKET=tax-adjustment-prod-data-bucket
S3_AWS_REGION=ap-northeast-1
# S3_AWS_SECRET_ACCESS_KEY={injected from vault}

SENDGRID_USERNAME=apikey
# SENDGRID_PASSWORD={injected from vault}


# TAX_ADJUSTMENT
# TA_BASIC_AUTH_BACK_CHANNEL_LOGOUT_PASSWORD={injected from vault}
TA_BASIC_AUTH_BACK_CHANNEL_LOGOUT_USER_NAME=lxgllfhcogjqzvdmwhmzxtykfzfybcqvd
TA_CACHING_NAVIS_TIMEOUT=172800
TA_SIDEKIQ_CONCURRENCY=7


# SIDEKIQ
SIDEKIQ_USER=mfv-tax
# SIDEKIQ_PASSWORD={injected from vault}

# ERP
ERP_URL=https://erp.moneyforward.com/
ERP_API_BASE_ENDPOINT=https://erp-internal.mnybk.com
ERP_API_BASIC_AUTH_USERNAME=oKWwpJLi-sN2B87MWH1mL7px4uANKFCY
# ERP_API_BASIC_AUTH_PASSWORD={injected from vault}

# SLACK
# SLACK_WEB_HOOK={injected from vault}
# SLACK_WEB_HOOK_JOB={injected from vault}
# SLACK_WEB_HOOK_NOTIFY_WAITING_QUEUE_JOB={injected from vault}

# GOOGLE SHEET
DAILY_REPORT_SPREADSHEET_ID=1ZDdAhn0sixYMXwOPZB_YDm81L_RccHHmqT_McJDfTHk
UNBILLABLE_REPORT_SPREADSHEET_ID=1ZDdAhn0sixYMXwOPZB_YDm81L_RccHHmqT_McJDfTHk
GOOGLE_ACCOUNT_TYPE=service_account
GOOGLE_CLIENT_ID=100814478179506014101
GOOGLE_CLIENT_EMAIL=ta-production-google-sheet-api@tax-production.iam.gserviceaccount.com
# GOOGLE_PRIVATE_KEY={injected from vault}


TA_BASIC_AUTH_API_USER=0eDrhpUwn6vpcERNswx62P6JAY4U9Xq4jxY
# TA_BASIC_AUTH_API_PASSWORD={injected from vault}
TA_MYPAGE_BASIC_AUTH_API_USER=uknsCoWPzo07NVS2h28S3037ygovNPpXSrL
# TA_MYPAGE_BASIC_AUTH_API_PASSWORD={injected from vault}
TA_TATSUJIN_API_USERNAME=moneyforward-vuHoqANZkuZ1
# TA_TATSUJIN_API_PASSWORD={injected from vault}
TA_SMARTHR_API_HOST=https://#{tenant_id}.smarthr.jp
TA_DEFAULT_USER_LOGIN_TYPE=email

# ZENDESK_KEY={injected from vault}
NEXON_URL=nexon.moneyforward.com
TIAGO_URL=tiago.prod.musubu.co.in

# SUPPORT_GROUP
TA_SUPPORT_GROUP_INTERNAL_API_BASIC_AUTH_ENDPOINT=http://support-group-api-server.prod-support-group
TA_SUPPORT_GROUP_INTERNAL_API_BASIC_AUTH_USERNAME=FjhqQ869XdmhZaDmCVCv2AIgwNUpcmNq
# TA_SUPPORT_GROUP_INTERNAL_API_BASIC_AUTH_PASSWORD={injected from vault}
TA_SUPPORT_GROUP_INTERNAL_API_SCHEME=http
TA_SETTING_EMAIL_URL=https://biz-setting.moneyforward.com/mail

# DOCUMENT DB
DOCUMENTDB_HOST=prod-ta-cluster.cluster-caexsumjbv1s.ap-northeast-1.docdb.amazonaws.com
DOCUMENTDB_USER=admin1
# DOCUMENTDB_PASS={injected from vault}
DOCUMENTDB_NAME=tax_adjustment_web_production

# ULURU
ULURU_X_API_KEY=4b4b030b-5aa4-43f2-813e-e2529446449c
# ULURU_SECRET_KEY={injected from vault}
ULURU_SPECIFICATION_ID=2
ULURU_URL=https://mf-ta.eas.work

# STAGING_ZEN_DESK_ACCOUNT_KEY={injected from vault}
# SLACK_WEB_HOOK_NOTIFY_POST_NAVIS_TENANT={injected from vault}

# SSO links
TA_CC_SSO_URL=https://contract.moneyforward.com/sso
TA_MY_SSO_URL=https://mynumber.moneyforward.com/sso
TA_SI_SSO_URL=https://social-insurance.moneyforward.com/sso
TA_ERP_SSO_URL=https://erp.moneyforward.com/sso
TA_NA_SSO_URL=https://biz-admin.moneyforward.com/sso
TA_CA_SSO_URL=https://accounting.moneyforward.com/sso
TA_EX_SSO_URL=https://expense.moneyforward.com/sso
TA_PA_SSO_URL=https://payroll.moneyforward.com/sso
TA_MY_PAGE_SSO_URL=https://mypage.moneyforward.com/sso
TA_IV_SSO_URL=https://invoice.moneyforward.com/sso
```