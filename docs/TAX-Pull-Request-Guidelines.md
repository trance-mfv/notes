# Pull Request Guidelines

## Environment

- Feature branch: `feat/TAXW-<ticket_id>-<description>`
    - Based on `origin/dev`
- Dev branch: 
    - Milestones: `origin/milestones/<mm-dd>`
        - Ex: `origin/milestones/mar-13`
    - Dev main: `origin/develop`
    - Dev main: `origin/diagnosis`

- Test branches: 
    1. `origin/heroku/dependabot_deployment`
    2. `origin/heroku/next_release`
    3. `origin/heroku/web_dev_deployment`

### Creating PRs For Feature

Note: Commit message should start with `TAXW-<ticket_id>: <description>`

1. Dev Review: 
    - PR Merge to **milestone** branch
        Ex: merge `TAXW-1326-export` to `origin/milestones/mar-13`
    - PR title: `TAXW-<ticket_id>: <description>`
2. QA Review: 
    - PR Merge to one of **heroku** branches (e.g. Squash Merge)
        Ex: merge `TAXW-1326-export` to `origin/heroku/dependabot_deployment`
    - PR title starts with: `TAXW-<ticket_id>`
    - Go to [heroku dashboard](https://dashboard.heroku.com/apps/tax-milestone-dependabot) to check the deployment


