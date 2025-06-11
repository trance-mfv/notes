---
author: Tade
contributors:
- Tade
published_at: '2025-06-10 10:41:42 +0700'
updated_at: '2025-06-10 10:41:42 +0700'
groups:
- mfg_all
---

# How to enable maintenance mode on TaxAdjustment

## How to Direct ALB to Maintenance Mode

**🚧 NOTE:**

**If you want to put the site under maintenance, please do some steps to archive that.**

### Patch to maintenance ingress_public files

Stag: [stg/patch_ingress_maintenance_public.yaml](https://github.com/moneyforward/k8s-service-manifests/blob/master/services/tax-adjustment/environments/stg/patch_ingress_maintenance_public.yam)

Prod: [prod/patch_ingress_maintenance_public.yaml](https://github.com/moneyforward/k8s-service-manifests/blob/master/services/tax-adjustment/environments/prod/patch_ingress_maintenance_public.yaml)

### File to edit

You need to edit the following file:

Stag: [stg/kustomization.yaml#L27-L29](https://github.com/moneyforward/k8s-service-manifests/blob/master/services/tax-adjustment/environments/stg/kustomization.yaml#L27-L29)

Prod: [prod/kustomization.yaml#L25-L27](https://github.com/moneyforward/k8s-service-manifests/blob/master/services/tax-adjustment/environments/prod/kustomization.yaml#L25-L27)

### Steps

1. Remove the comment-out for the ALB you want to direct to the maintenance page.
2. **If you have already had VPN connection via Global Protect or Office IPs, you still can access via public domain or in-house domain:**
   1. **`111.98.254.209`**
   2. **`111.98.254.197`**
   3. **`27.71.207.82`** 
3. Inhouse domains:
   1. stag: https://tax-adjustment.test.musubu.co.in/healthz
   2. prod: https://tax-adjustment.prod.musubu.co.in/healthz

### Important Note

* This operation will only put access via public ALB into maintenance mode.
* Internal communication within the cluster from other services on the ServicePlatform will only be handle via In-house domain.

### Example

If you want to enable maintenance mode for `tax-adjustment-public` (user interface) to point to the maintenance page, remove the comment-out for `patch_ingress_maintenance_public.yaml`.

Then, commit that code and make pull request to merge master like [PR](https://github.com/moneyforward/k8s-service-manifests/pull/142231).

```yaml
patchesStrategicMerge:
- configmap.yaml
- deployment.yaml
- ingress.yaml
- pre_sync_db_migrate.yaml
- service_account.yaml
- statefulset.yaml
- hpa.yaml
# NOTE: Uncomment to switch to maintenance mode.
- patch_ingress_maintenance_public.yaml
#

```

## How to Put a Service into Maintenance Mode

### File to Edit

You need to edit the following file:
[GitHub Link](https://github.com/moneyforward/k8s-service-manifests/blob/master/services/tax-adjustment/base/service.yaml)

### Steps

* If you want to direct `tax-adjustment-web` service to the maintenance page, update code like this:

### Example

To put `tax-adjustment-web` into maintenance mode, you would modify the file as follows:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: tax-adjustment-web
spec:
  type: NodePort
  selector:
    app.kubernetes.io/name: (replace tax-adjustment-web) maintenance-page-server
  ports:
  - protocol: TCP
    port: 80
    targetPort: (replace server-port) -> 3000
```

## How maintenance mode works

The files `patch_ingress_maintenance_public.yaml` are designed to override existing ingress configurations. This is achieved through the `patchesStrategicMerge:` setting in `kustomization.yaml`, which allows these files to overwrite the existing configurations.
[GitHub Link](https://github.com/moneyforward/k8s-service-manifests/blob/master/services/tax-adjustment/environments/stg/kustomization.yaml#L19C1-L29)

Normally, these settings are commented out, so they do not take effect. By removing the comments, the maintenance settings are applied, putting the service into maintenance mode.