Heroku S3 with BucketeerSteps to create Bucketeer: https://devcenter.heroku.com/articles/bucketeer

• check the storage usage in the current environment (optional)
• choose plan: https://elements.heroku.com/addons/bucketeer
• run the command based on the chosen plan

```
heroku addons:create bucketeer:micro --bucket-name tax-adjustment-test-testing-bucket --region ap-northeast-1
```

• setup aws cli configuration

```
$ aws configure
AWS Access Key ID [None]: <BUCKETEER_AWS_ACCESS_KEY_ID>
AWS Secret Access Key [None]: <BUCKETEER_AWS_SECRET_ACCESS_KEY>
Default region name [None]: us-east-1
Default output format [None]:
```

• update environment in tax-adjustment-web => update code
```
BUCKETEER_AWS_ACCESS_KEY_ID
BUCKETEER_AWS_SECRET_ACCESS_KEY
BUCKETEER_AWS_REGION
BUCKETEER_BUCKET_NAME
```

• enable public access for bucket:
```
aws s3api put-public-access-block --bucket tax-adjustment-test-testing-bucket --public-access-block-configuration BlockPublicAcls=TRUE,IgnorePublicAcls=TRUE,BlockPublicPolicy=FALSE,RestrictPublicBuckets=FALSE
```

• get AWS VPC ID using
```
heroku spaces:peering:info
```

• create policy.json
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:ListBucket",
                "s3:DeleteObject"
            ],
            "Resource": [
                "arn:aws:s3:::tax-adjustment-test-testing-bucket/*",
                "arn:aws:s3:::tax-adjustment-test-testing-bucket"
            ]
            "Condition": {
                "StringEquals": {
                    "aws:sourceVpc": "<AWS_VPC_ID>"
                }
            }
        }
    ]
} 
```

• upload policy
```
aws s3api put-bucket-policy --bucket tax-adjustment-test-testing-bucket --policy file://policy.json
```

• confirm changes
```
aws s3api get-bucket-policy --bucket tax-adjustment-test-testing-bucket --query Policy --output text
```
