# MFID - Application Setup

- [MFID Staging](https://id.test.musubu.co.in)
- [MFID Developer Console](https://id.test.musubu.co.in/oauth/applications)

## Create A Client Application

1. Go to [MFID](https://id.test.musubu.co.in)
2. Sign up with Google account
3. Go to [MFID Developer Console](https://id.test.musubu.co.in/oauth/applications)
4. Click `Create an application`
5. Fill in the form
    - Select Service Name: Money Forward Cloud Tax Adjustment
    - Redirect uri: https://<local-domain>/users/auth/mfid/callback
    - Confidential: Select `Confidential`
    - Pkce requirements: Select `Optional`
    - Scopes: Select `openid email`
    - Logo uri: https://assets-biz-portal.moneyforward.com/portal/images/logo_mfc.svg
    - Check withdrawable uri: https://ta.mfvn.test/api/internal/mfid/withdrawable
    - App domain: Select `Business`
    - Tenant managed user available: Select `Not Available`
6. Click `Submit`
7. Copy the `Client ID` and `Client Secret` to the `.env` file

