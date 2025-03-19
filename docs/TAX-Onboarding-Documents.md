# TAX Onboarding Documents

## Accounts

### SRE and Company Tools
*Notes: Request via #contact_cio_managed-tools*

- **Github**: Version control system: source code management and collaboration
    - Repo: https://github.com/moneyforward/tax_adjustment_web
- **Jira**: Project management and issue tracking 
    - Change Fullname Request Channel: #contact_mfv-corp-it-support
        - Change Fullname to `<nickname> (<real name>)`
- **Confluence**: Knowledge base and documentation platform
    - Request channel: #contact_mfv-corp-it-support
- **IDEs and Development Tools**
    - JetBrain/VSCode/Cursor
    - Cursor: [License registration link](https://cursor.com/team/accept-invite?code=084223bacfee104259a2067c1dbb0f386ab7ce533d83daeb)
- **Heroku**: Cloud platform for app deployment and scaling
    - User: `TA Team`
    - Team: `moneyforwardvietnam`
- **CircleCI**: Continuous integration and deployment platform
    - Organization `moneyforward`
- **Rollbar**: Error monitoring and tracking tool
    - Login with Google account
    - Project: `tax_adjustment`
- **Slack**: Team communication and collaboration tool ✅
    - Change display name to `<nickname>` or `<nickname> (<real/email name>)`
- **Kibela**: Knowledge base and documentation platform ✅
    - https://moneyforward.kibe.la/
    - MFV: https://moneyforward.kibe.la/groups/1454
- **Figma**: Design tool
- **Miro**: Collaboration tool
- **Google Accounts**: Docs, spreadsheets, presentations, Drive, Calendar, etc.
    - Change display name to `<nickname> MFV`
- **Zoom**: Video conferencing
    - Change display name to `<nickname> MFV`
- **SonarQube**: Code quality and security tool
    - Link: https://sonar.mfvn.dev/projects
    - Login with Github account
    - Project: `tax_adjustment_web`
- **Datadog**: Monitoring platform
    - Organization: `Money Forward, Inc.`
    - Board: Tax Adjustment (All in One)
- **GlobalProtect**: VPN tool
    - Enable to connect to the company resources
- **Kollabe**: Agile Planning Poker

### Communication
    - Frequent used Slack channels
        - #contact_cio_managed-tools
        - #contact_mfv-corp-it-support: IT support
        - #mfv_ta_onboard: TA VN Onboarding Team
        - #mfv_ta_random: TA VN Team - Random talks
        - #mfv_ta_vn: TA VN Team 
        - #mfv_ta_dev_vn: TA Dev VN Team (including former TA Devs)        
        - #ta_dev_all: クラウド年末調整の開発チームのチャンネル/ Cloud Tax Adjustment development team channel
        - #ta_design: TA Design Team (JP + VN)
        - #ta_core: TA Core Team
        - #ta_random            
        - #ae-ta-dev (private channel): TA Dev VN Team

## Team and Product

### Team structure

![TAX Team structure](../assets/images/tax-team-structure.png)

Manager: Nas
QA: Phoenix, Sasa, Higuma (outsourcing)
Accelerator: Luna, Gwen
Dev: Reacher, Hugo, Jeff, Key, Pat, Edgar, Asher, Vinnie, Scarlett, Axel

## Way of work

### Daily Init (Chorei)
- Initiator: Are you ready? 
- Others: Yes/Yo
- Initiator: Let's make it.
- Everyone: Together

### Code Convention
- [Code convention](https://moneyforwardvietnam.atlassian.net/wiki/spaces/TA/pages/1715634206/Code+convention)

### Implementation Flow:

```
implement -> self test -> báo QA -> QA confirm passed -> review -> merge
```

Example with dev branches :

```
implement (feature/TAXW-<ticket-id>-<description>) -> self test (heroku/<branch-name>) -> notify QA (JIRA ticket) -> QA confirm passed -> review -> merge PR
```

### Process Assign Reviewers for PRs:
[Details from Reacher's messages](https://moneyforward.slack.com/archives/C08DTPV33M2/p1741750961563679)

- Basically, assign all devs as reviewers

**Pull Requests**

1. PR from *Task Branch* to *Milestones Branch* OR directly from *Task Branch* to *Release Branch* (for smaller tasks)
    - Assign devs made commits to the *Task Branch* as reviewers

where, 
- Task Branch: feature/<JIRA-Ticket-ID>-<description>
- Milestones Branch: milestone/<mm-dd>
- Release Branch: develop

Refer conversation: https://moneyforward.slack.com/archives/C07D8EDBQ6S/p1741747181259769
Example PR: https://github.com/moneyforward/tax_adjustment_web/pull/10647

2. PR from *Milestones Branch* to *Release Branch*
    - Assgin all devs

Refer conversation: https://moneyforward.slack.com/archives/C07D8EDBQ6S/p1741748295200559
Example PR: https://github.com/moneyforward/tax_adjustment_web/pull/10692

### JIRA Ticket:

**Workflow**
    TO DO => IN PROGRESS => REVIEW (QA + PR) => DONE

**Structure**

    Epic
    ├── Story
    ├── Task
    │   └── Sub-task
    ├── Bug Report
    └── Internal Bug

**Backlog**

![Backlog](../assets/images/tax-backlog.png)

### Sprint: 

- 2 weeks
- Sprint Planning: 
    - Meeting on Monday
    - Tasks in Sprint
    - Releases in Sprint
- Sprint Review:
    - Meeting on Thursday
    - Review tickets/demo
- Sprint Retrospective:
    - Meeting on Friday

- Other meetings: 
    - Team Sync-up (on Friday)
    - Backlog Refinement
    - Bi-weekly TA and SRE team
    - 1:1 meeting

**Example: TAX-111**

| Sprint Information | Link |
|-------------------|------|
| Sprint Period | [TAX-111 (Mar 03 - Mar 14)](https://moneyforwardvietnam.atlassian.net/wiki/spaces/TA/pages/2561147519/TAX-111+Mar+03+-+Mar+14) |
| Tasks in Sprint | [TAX-111 tasks](https://moneyforwardvietnam.atlassian.net/wiki/spaces/TA/pages/2561147540/TAX-111+tasks) |
| Sprint Review | [TAX-Sprint 110 Review](https://moneyforwardvietnam.atlassian.net/wiki/spaces/TA/pages/2561147675/TAX-Sprint+110+Review) |

**Releases in Sprint:**
- [Release on Mar 06, 2025](https://moneyforwardvietnam.atlassian.net/wiki/spaces/TA/pages/2561147623/Release+on+Mar+06+2025)
- [Release on Mar 13, 2025](https://moneyforwardvietnam.atlassian.net/wiki/spaces/TA/pages/2561147650/Release+on+Mar+13+2025)

[**Overall Timeline**](https://moneyforward.atlassian.net/jira/software/projects/TAXW/boards/836/timeline)

### Gitflow:

| Branch Type | Format | Example |
|-------------|--------|---------|
| Milestone | `milestone/<mm-dd>` | milestone/mar-13 |
| Feature | `[feature]/<JIRA-Ticket-ID>-<description>` | feature/TAXW-1324-disable-electric-submit |
| Development | `develop` | develop |
| QA | `heroku/<branch-name>` | heroku/dependabot |

### Pull Request:

| Component | Format | Example/Details |
|-----------|--------|----------------|
| Title | `[JIRA_Ticket] Description` | [TAXW-1324] Disable "Electric Submit" |
| Description | Include evidence of self-testing | Screenshots or screencasts to provide evidence of the self-test from your side |
| Reviewer | Add team reviewer group | @ta_dev_mfv_reviewers |

### Product overview
PA: Payroll
TA: Tax Adjustment
SG: Support Group
MFID: Money Forward ID - openid connect
ERP: Employee Record Processing

### Tax Adjustment Web

| Service | Environment | Link |
|---------|-------------|------|
| MFID | Staging | [Link](https://id.test.musubu.co.in/oauth/applications/260) |
| ERP | Staging | [Link](https://erp-stg1.ebisubook.com/home) |
| Payroll | Staging | [Link](https://payroll.ebisubook.co.in/) |
| Rollbar | - | [Link](https://app.rollbar.com/a/moneyforward/fix/items?isSnoozed=false&prj=486797) |
| CI/CD Pipeline | - | [Link](https://app.circleci.com/pipelines/github/moneyforward/tax_adjustment_web) |
| Heroku | Dependabot | [Link](https://dashboard.heroku.com/apps/tax-milestone-dependabot) |
| | web-dev | [Link](https://dashboard.heroku.com/apps/tax-adjustment-web-dev) |
| | next-release | [Link](https://dashboard.heroku.com/apps/tax-adjustment-web-dev) |

Ref: [Confluence](https://moneyforwardvietnam.atlassian.net/wiki/spaces/TA/pages/1634730702/Environments)

### Technical architect:

- Architecture overview, DDD

- Integration between FE & BE

- Gitflow

- Coding standard, quality standard(Unit test coverage

## Release Plan

### Project/Release Plan

## Documentation
- [Tech documents](https://moneyforwardvietnam.atlassian.net/wiki/spaces/TA/pages/1659600905/Tech+documents)
- [TA System Guidebook](https://moneyforwardvietnam.atlassian.net/wiki/spaces/TA/pages/1668513853/TA+System+guidebook)

## Installation

### SonarQube Extension in VSCode

1. Install the SonarQube Extension for IDE
    - Open VSCode
    - Go to Extensions (Cmd + Shift + X)
    - Search for SonarQube and click Install

2. Install Node.js v18.20.7
    - SonarQube requires Node.js v18.18+, so you need to install the correct version

3. Configure Node.js Path in SonarQube Settings
    - Run this command to get the path of the newly installed Node.js: npm config list
    - Copy the Node.js path (e.g., /Users/your-username/.nvm/versions/node/v18.20.7/bin/node)
    - Paste this path into SonarQube Extension settings in VSCode

4. Generate User Token on SonarQube
    - Go to https://sonar.mfvn.dev/account/security
    - Click Generate User Token
    - Name/Expires in: Set as you wish
    - Type: Select User Token
    - Copy the generated token for the next step

5. Set Up SonarQube Connection in VSCode
    - Open VSCode, press Cmd + Shift + P
    - Select Connect SonarQube Server
    - Enter the information from Step 4 (URL, Token)
    - Save the connection

6. Configure the Project
    - After setting up the connection, SonarQube Extension will display a popup to configure the project
Select tax_adjustment when prompted

## Appendix

### Slack channels by category:
    
    - External Connections:
        - #contact_cio_managed-tools
        - #contact_ciso_security
        
    - MFV Level (`#mfv_xxx`):
        - IT support: #contact_mfv-corp-it-support
        - #mfv_ta_onboard: TA VN Onboarding Team
        - #mfv_ta_random: TA VN Team - Random talks
        - #mfv_ta_vn: TA VN Team 
        - #mfv_ta_dev_vn: TA Dev VN Team (including former TA Devs)
        - #mfv-absence-notification
        - #mfv-announcement
        - #mfv-base-timesheet-notify
        - #mfv-corporate-incident-announcement
        - #mfv-hcm-football-club
        - #mfv-random-hcmc
        - #mfv-welcome-onboard
        - #mfv_hcm-ruby
        - #mfv-forwardian-radio
        
    - Corp. Level (`#mfw_xxx`):
        - #mfw_action-required
        - #mfw_announcement
        - #mfw_events
        - #mfw_critical_incident_announcement
        - #mfg_action-required
        - #mfg_announcement
        - #mfg_events
        - #mfg_pr
        
    - TA Level (`#ta_xxx`):
        - #ta_dev_all: クラウド年末調整の開発チームのチャンネル/ Cloud Tax Adjustment development team channel
        - #ta_dev_aweb_notification_[production/staging]
        - #ta_dev_[production/staging_billings]_report
        - #ta_monitoring_[production/staging]
        - #ta_design: TA Design Team (JP + VN)
        
    - Incident & Monitoring:
        - #incident_tracking
        - #msb_info
        
    - Other:
        - #cursor-ai
        - #hcm-ruby
        - #mf_orientation_new_entry_training
        - #ae-ta-dev (private channel): TA Dev VN Team

### Onboarding Checklists:

#### Onboarding Checklist

**Account Access**
- [ ] **Github** - Repo: https://github.com/moneyforward/tax_adjustment_web
- [x] **Slack** - Change display name to `<nickname>`
- [ ] **IDEs** - JetBrain/VSCode/Cursor
- [ ] **Zoom** - Change display name to `<nickname> MFV`
- [x] **Kibela** - Access to knowledge base
- [ ] **Google Accounts** - Docs, spreadsheets, presentations, Drive, Calendar
- [ ] **Google Display Name** - Change to `<nickname> MFV`
- [ ] **JIRA** - Project management access
- [ ] **JIRA Fullname** - Change to `<nickname> (Original Fullname)`
- [ ] **Confluence** - Documentation platform access
- [ ] **Heroku** - Access to the `moneyforwardvietnam` team
- [ ] **CircleCI** - Access to organization `moneyforward`
- [ ] **Rollbar** - Access to `tax_adjustment`
- [ ] **Figma** - Design tool access
- [ ] **Miro** - Collaboration tool access
- [ ] **SonarQube** - Access to project `tax_adjustment_web`
- [ ] **Datadog** - Access to Tax Adjustment board
- [ ] **GlobalProtect** - VPN tool for company resource access
