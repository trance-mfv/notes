## Reference: 
- [ECS-To-ServicePlatform](https://moneyforward.kibe.la/folders/344832?order_by=title&group_id=925)

## MFV Infra OLD:
- staging: https://test.tax-adjustment.test.mfw.work/
- diagnosis: https://diagnosis.tax-adjustment.test.mfw.work/

## Service platform:
- staging: https://test.tax-adjustment.test.mfw.work/
- diagnosis: https://tax-adjustment-diagnosis.test.musubu.co.in/

## To Access Staging
Tade/phan.minh.trung
  Apr 2nd at 16:38
@Jeff
: setup cái này nha

```
Host tax-adjustment-bastion
    StrictHostKeyChecking no
    UserKnownHostsFile=/dev/null
    IdentityFile ~/.ssh/id_ed25519
    HostName  nlb1.bastion.test.musubu.co.in
    Port 1133
```

16:40
```
ssh nguyen.tan.binh@tax-adjustment-bastion
```

16:42 dùng mysql workbench:
```
test-ta-rds-20250219080941889600000007.cluster-cwujgsutr2sa.ap-northeast-1.rds.amazonaws.com
root
dummydummydummydummy
database name: tax_adjustment_web_staging
```

## Member access to staging
Tade/phan.minh.trung
  Apr 18th at 15:48
@Nas/dam.phu.duong
 cc 
@Hugo
: sau này member nào cần access staging thì mọi người tạo pr giống này là đc, tạo pr merge vào staging, sau đó nhờ leader review.
https://github.com/moneyforward/bastion_ansible/pull/1630/files


- Example:

```
- state: present
    uid: 2010
    name: Ha Van Nhut
    username: ha.van.nhut
    pubkeys:
      # local
```

- [Example PR](https://github.com/moneyforward/bastion_ansible/pull/1684)