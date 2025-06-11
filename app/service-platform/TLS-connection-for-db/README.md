# moneyforward/k8s-service-manifests 

## Pull Requests

### [[ta] Use SSL cert for Aurora staging and diagnosis env](https://github.com/moneyforward/k8s-service-manifests/pull/142299/files#diff-d6b2ace89c7fd0dad88d55a0033902564c1dbdeef38f9c3b4bde0b280835a461)

Files changed: 
1. Added: services/tax-adjustment/environments/stg/files/ssl_cert/README.md
```
# SSL Cert for DB

## RDS

These files are the root and intermediate certificate files for establishing an SSL connection to RDS.

- ap-northeast-1-bundle.pem
  - Downloaded at <https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL.html#UsingWithRDS.SSL.CertificatesAllRegions>

[Using SSL/TLS to encrypt a connection to a DB instance or cluster](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL.html)

### How to update cert

You will receive a notification from AWS, so please follow the instructions accordingly. The basic flow will be as follows:

1. Upload a certificate file that bundles the existing certificate and the new certificate, and reference it.
1. Update the certificate used on AWS Console.
```

2. services/tax-adjustment/environments/diagnosis/files/diagnosis.env
```
DATABASE_DB_SSL_CA=/ssl_cert/ap-northeast-1-bundle.pem
```

3. Added: services/tax-adjustment/environments/stg/files/ssl_cert/ap-northeast-1-bundle.pem
4. services/tax-adjustment/environments/stg/files/tax-adjustment.env
```
DATABASE_DB_SSL_CA=/ssl_cert/ap-northeast-1-bundle.pem
```

5. services/tax-adjustment/environments/stg/kustomization.yaml
```
- behavior: merge
  files:
  - files/ssl_cert/ap-northeast-1-bundle.pem
  name: database-cert
- behavior: merge
  files:
  - files/ssl_cert/ap-northeast-1-bundle.pem
  name: pre-sync-database-cert
```


### [TAXW-2302: Update tax-adjustment.env for using TLS connection on production](https://github.com/moneyforward/k8s-service-manifests/pull/142408/files)

Files changed: 
1. Added: services/tax-adjustment/environments/prod/files/ssl_cert/ap-northeast-1-bundle.pem
2. services/tax-adjustment/environments/prod/files/tax-adjustment.env
```
DATABASE_SSL_CA=/ssl_cert/ap-northeast-1-bundle.pem
```

3. services/tax-adjustment/environments/prod/kustomization.yaml
```
  envs:
  - files/tax-adjustment.env
  name: pre-sync-env-vars
- behavior: merge
  files:
  - files/ssl_cert/ap-northeast-1-bundle.pem
  name: database-cert
- behavior: merge
  files:
  - files/ssl_cert/ap-northeast-1-bundle.pem
  name: pre-sync-database-cert
```

# moneyforward/tax_adjustment_web

## Pull Requests

### [TAXW-2301: apply TLS connection for RDS on diagnosis env](https://github.com/moneyforward/tax_adjustment_web/pull/11432/files)

Files changed: 
1. Added: config/database.yml
```
staging:
  <<: *default
  database: <%= ENV.fetch('DATABASE_NAME', 'tax_adjustment_web_staging') %>
  ssl_mode: <%= ENV.fetch('DATABASE_SSLMODE', 'required') %>
  ssl_ca: <%= ENV.fetch('DATABASE_SSL_CA', '') %>
```
