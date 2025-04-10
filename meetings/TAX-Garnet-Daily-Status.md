# Team Garnet

## Summary

| Ticket | Parent Ticket | Description | Assignee | Status |
|--------|--------------|-------------|----------|--------|
| TAXW-1134 | | Email address switch bug investigation | Axel | Transfered to Pat |
| TAXW-1450 | | Fix My Number issues | Trance | Released |
| TAXW-1534 | | Employees CSV import job performance improvement | Pat | ✅ Completed |
| TAXW-1555 | | Payment report total PDF mismatch with Calculation table | Trance | In Progress (80%) |
| TAXW-1575 | | Document design | Edgar | In Progress (60%) |
| TAXW-1587 | [TAXW-1477] | Tax adjustments auto-reading feature list | Edgar | ✅ Completed |
| TAXW-1590 | [TAXW-1477] | Impact Analysis | Pat | ✅ Completed |
| TAXW-1593 | [TAXW-1477] | Employees auto-reading feature list | Edgar | ✅ Completed |
| TAXW-1629 | [TAXW-1414] | Technical doc | Hugo | ✅ Completed |
| TAXW-1630 | [TAXW-1414] | Impact analysis | Hugo | ✅ Completed |
| TAXW-1651 | | Warning message for negative insurance amount | Hugo | ✅ Completed |
| TAXW-1663 | | YETA deletion modal update | Edgar | ✅ Completed |
| TAXW-1680 | | Update postcode master data up to March 31, 2025 | Hugo | ✅ Completed |
| TAXW-622 | | Employee Log insurance number bug fix | Axel | In Progress (50%) |
| TAXW-964 | | Widow checkbox still ON after syncing Gender from PA | Hugo | In Progress (50%) |
| TAXW-300 | | Blank report in side-modal when Re-Aggregation button not clicked | Trance | In Progress |
| TAXW-1700 | | 500 error when removing employee from YETA in Auto Reading Insurance | Edgar | In Progress |

## Current Focus

- Bug investigations and fixes (TAXW-622, TAXW-1134, TAXW-300, TAXW-1700)
- Auto-Reading Paid Launch (TAXW-1477) and related implementation
- Document completion and reviews
- Technical documentation and impact analysis 
- Payment report and calculation issues (TAXW-1555)
- Frontend improvements and fixes

## Daily Status

### 2025-04-10

Axel:
- Yesterday:
    - Tasks: 
        - TAXW-1486: [TA2025] Bugs
        - TAXW-1134: [CS Ticket] Email address switch between old and new after changing email due to the updated time being over 1 year
            - Asked Garnet team for help, passed ticket to team members
        - TAXW-622: [Legacy Bug] - Employee Log - It is recorded log with an incorrect insurance number on Employee Log when updating insurance which is XML or auto reading insurance with existing manual insurance
            - Was able to reproduce the issue, fixing it
    - Meetings:
        - Cursor AI
        - Welcome to MFV - Orientation
- Today:
    - Tasks: 
        - TAXW-1486: [TA2025] Bugs
        - TAXW-622: [Legacy Bug] - Employee Log - It is recorded log with an incorrect insurance number on Employee Log when updating insurance which is XML or auto reading insurance with existing manual insurance
            - Fixing issue
    - Meetings:
        - TAX: Sprint Review
        - [Sharing] FFP integration

Trance:
- Last day:
    - Meetings:
        - Sharing Cursor AI & Rules, Reliability in Sidekiq Pro
        - Local Hiring Staff
        - [TA] Weekly Dev Sync
    - Tasks:
        - TAXW-1486: [TA2025] Bugs
        - TAXW-1555: The exported Payment report total PDF file is not matching with Calculation table  
        - TAXW-29: [TA2025] Internal issues
        - TAXW-300: [YETA][payment_report_total_tables] - Blank report is displayed when opening side-modal if user do not click on Re-Aggreation button
            - Discussed with Cillian for a combined fix
        - PR reviews: followed up
        - TAXW-46: [Sonar - tech debts] Fix Sonar Tech Debts from March-Apr 2025
- Today:
    - Meetings:
        - TA Sprint Review
        - [Sharing] FFP Integration
        - [PRD Sharing] Issue 126
    - Tasks:
        - TAXW-29: [TA2025] Internal issues
        - TAXW-300: [YETA][payment_report_total_tables] - Blank report is displayed when opening side-modal if user do not click on Re-Aggreation button
        - TAXW-1486: [TA2025] Bugs
        - TAXW-1555: The exported Payment report total PDF file is not matching with Calculation table
            - To create RSpec

Edgar:
- Last day:
    - Tickets:
        - TAXW-1477: 保険料控除入力代行有償公開 / Auto-Reading Paid Launch
        - TAXW-1590: [TAXW-1477][DEV] Impact Analysis
            - Cross-reviewing with Pat
        - Auto-reading Insurance
        - TAXW-1700: [Auto Reading Insurance] 500 error is displayed when removing employee from YETA
    - Meetings:
        - Sharing Cursor AI & Rules, Reliability in Sidekiq Pro
        - [For local hiring staff] Q&A about new hybrid working policy and self claim 
- Today:
    - Tickets:
        - Auto-reading Insurance
        - TAXW-1700: [Auto Reading Insurance] 500 error is displayed when removing employee from YETA
    - Meetings:
        - Sprint review
        - Feature Flag sharing
        - Company trip 2nd kickoff

Pat:
- Last day:
    - Tickets:
        - TAXW-1486: [TA2025] Bugs
        - TAXW-1134: [CS Ticket] Email address switch between old and new after changing email due to the updated time being over 1 year
    - Meetings:
        - Sharing Cursor AI & Rules, Reliability in Sidekiq Pro
        - [For local hiring staff] Q&A about new hybrid working policy
- Today:
    - Tickets:
        - TAXW-1486: [TA2025] Bugs
        - TAXW-1134: [CS Ticket] Email address switch between old and new after changing email due to the updated time being over 1 year
        - Review Document design of Auto reading Paid launch
    - Meetings:
        - TAX: Sprint Review [Sharing]
        - FFP integration
        - [Online] Company Trip 2025 - 2nd Kick Off 🚀

Hugo:
- Last day:
    - Tasks:
        - TAXW-964: TA2024_RegressionPhase2_[Dependent PDF Next Year] - The Widow check box is still ON after syncing Gender from PA (50%)
        - Prepare demo ticket Sg linkage
    - Meeting:
        - Sharing Cursor AI & Rules, Reliability in Sidekiq Pro
        - [For local hiring staff] Q&A about new hybrid working policy and self
- Today:
    - Tasks:
        - TAXW-964: TA2024_RegressionPhase2_[Dependent PDF Next Year] - The Widow check box is still ON after syncing Gender from PA - Continue
    - Meetings:
        - Sprint review
        - [Online] Company Trip 2025 - 2nd Kick Off 

### 2025-04-09

Axel:
- Yesterday:
    - Tasks: 
        - TAXW-1486: [TA2025] Bugs
        - TAXW-1134: [CS Ticket] Email address switch between old and new after changing email due to the updated time being over 1 year
            - Asked for help, still not able to reproduce the bug
    - Meetings:
        - Bi-weekly MFG All-hands Video
- Today:
    - Tasks: 
        - TAXW-1486: [TA2025] Bugs
        - TAXW-1134: [CS Ticket] Email address switch between old and new after changing email due to the updated time being over 1 year
            - Continue checking external resources (navis client, navis frontend, navis backend) 
    - Meetings:
        - Cursor AI
        - Welcome to MFV - Orientation

Trance:
- Yesterday:
    - Meetings:
        - Bi-weekly MFG All-hands Video
        - Meeting with Reacher (tran.ngoc.hai) on DORA Capabilities
    - Tasks:
        - TAXW-1486: [TA2025] Bugs
        - TAXW-1555: The exported Payment report total PDF file is not matching with Calculation table  
        - TAXW-29: [TA2025] Internal issues
        - TAXW-300: [YETA][payment_report_total_tables] - Blank report is displayed when opening side-modal if user do not click on Re-Aggreation button
            - Reproduced and investigate the issue 
        - PR reviews: following up
            - TAXW-1680: Update postcode master data up to 31 Mar 2025 / 2025年3月31日までの郵便番号を更新する
            - TAXW-1649: [Improvement][Monthly Payment] Change the search data in Employee Group dropdown
- Today:
    - Meetings:
        - Sharing Cursor AI & Rules, Reliability in Sidekiq Pro
        - [TA] Weekly Dev Sync
    - Tasks:
        - TAXW-1486: [TA2025] Bugs
        - TAXW-1555: The exported Payment report total PDF file is not matching with Calculation table  
        - TAXW-29: [TA2025] Internal issues
        - TAXW-300: [YETA][payment_report_total_tables] - Blank report is displayed when opening side-modal if user do not click on Re-Aggreation button
            - To discuss with Cillian for a combined fix

Edgar:
- Last day:
    - Tickets:
        - TAXW-1477: 保険料控除入力代行有償公開 / Auto-Reading Paid Launch
        - TAXW-1575: [TAXW-1477][DEV] Document design 
        - Probation review: prepare & create request
    - Meetings:
        - Bi-weekly MFG All-hands Video
- Today:
    - Tickets:
        - TAXW-1477: 保険料控除入力代行有償公開 / Auto-Reading Paid Launch
        - TAXW-1590: [TAXW-1477][DEV] Impact Analysis
            - Cross-reviewing with Pat
        - Auto-reading Insurance
        - TAXW-1649: [Improvement][Monthly Payment] Change the search data in Employee Group dropdown
            - Update PR
    - Meetings:
        - Sharing Cursor AI & Rules, Reliability in Sidekiq Pro
        - [For local hiring staff] Q&A about new hybrid working policy and self claim 

Pat:
- Last day:
    - Off morning
    - Tickets:
        - Review PRs
        - TAXW-1477: 保険料控除入力代行有償公開 / Auto-Reading Paid Launch
        - TAXW-1590: [TAXW-1477][DEV] Impact Analysis
    - Meetings:
        - Bi-weekly MFG All-hands Video
- Today:
    - Tickets:
        - Review Document design of Auto reading Paid launch
        - TAXW-1486: [TA2025] Bugs
        - TAXW-622: [Legacy Bug] - Employee Log - It is recorded log with an incorrect insurance number on Employee Log when updating insurance which is XML or auto reading insurance with existing manual insurance 
    - Meetings:
        - Sharing Cursor AI & Rules, Reliability in Sidekiq Pro
        - [For local hiring staff] Q&A about new hybrid working policy

Hugo:
- Last day:
    - Tasks:
        - TAXW-1441: Auto change the status to Non-target when income amount over 20 million in previous work/ 前職収入金額が二千万を超えると自動的に非対象に変更
            - Follow up & support
        - TAXW-964: TA2024_RegressionPhase2_[Dependent PDF Next Year] - The Widow check box is still ON after syncing Gender from PA (20%)
        - Support team member
    - Meeting:
        - Bi-weekly MFG All-hands Video
- Today:
    - Tasks:
        - TAXW-964: TA2024_RegressionPhase2_[Dependent PDF Next Year] - The Widow check box is still ON after syncing Gender from PA - Continue
        - Follow up my released ticket in this sprint
    - Meetings:
        - Sharing Cursor AI & Rules, Reliability in Sidekiq Pro
        - [For local hiring staff] Q&A about new hybrid working policy and self


### 2025-04-08
Axel:
- Last day:
    - Tasks: 
        - TAXW-1486: [TA2025] Bugs
        - TAXW-1134: [CS Ticket] Email address switch between old and new after changing email due to the updated time being over 1 year
            - Was not able to reproduce the bug, checking external sources (navis client, navis frontend, navis backend) still searching for clues
    - Meetings:
        - No meetings
- Today:
    - Tasks: 
        - TAXW-1486: [TA2025] Bugs
        - TAXW-1134: [CS Ticket] Email address switch between old and new after changing email due to the updated time being over 1 year
            - Continue checking external resources (navis client, navis frontend, navis backend)
    - Meetings:
        - Bi-weekly MFG All-hands Video

Trance:
- Last Friday:
    - Meetings:
        - TA Management MTG
        - [TA Dev] Team Sync-up
        - Service Platform sharing
        - Bi-weekly TA and SRE team
    - Tasks:
        - TAXW-1486: [TA2025] Bugs
        - TAXW-1555: The exported Payment report total PDF file is not matching with Calculation table  
            - Working (80%)
        - PR reviews: 
            - TAXW-46: [Sonar - tech debts] Fix Sonar Tech Debts from March-Apr 2025
            - TAXW-1536: [Web Plan] The plan is not updated after changing from ERP
- Today:
    - Meetings:
        - Bi-weekly MFG All-hands Video
        - Meeting with Reacher (tran.ngoc.hai) on DORA Capabilities
    - Tasks:
        - TAXW-1486: [TA2025] Bugs
        - TAXW-1555: The exported Payment report total PDF file is not matching with Calculation table  
            - To finish
        - PR reviews: following up
            - TAXW-1680: Update postcode master data up to 31 Mar 2025 / 2025年3月31日までの郵便番号を更新する
            - TAXW-1649: [Improvement][Monthly Payment] Change the search data in Employee Group dropdown

Edgar:
- Last day:
    - Tickets:
        - TAXW-1477: 保険料控除入力代行有償公開 / Auto-Reading Paid Launch
        - TAXW-1575: [TAXW-1477][DEV] Document design 
    - Meetings:
        - None
- Today:
    - Tickets:
        - TAXW-1477: 保険料控除入力代行有償公開 / Auto-Reading Paid Launch
        - TAXW-1575: [TAXW-1477][DEV] Document design 
        - TAXW-1486: [TA2025] Bugs
        - TAXW-1700: [Auto Reading Insurance] 500 error is displayed when removing employee from YETA
    - Meetings:
        - None

Pat: 
- Off this morning

Hugo:
- Last day:
    - Tasks:
        - TAXW-1414: Minus input for insurance premium
        - TAXW-1629: [Relate TAXW-1414] Write Technical Docs - Done
        - TAXW-1680: Update postcode master data up to 31 Mar 2025 / 2025年3月31日までの郵便番号を更新する - Done
    - Meeting:
        - FE Guild Major Sync-up
- Today:
    - Tasks:
        - TAXW-1414: Minus input for insurance premium
        - Follow up test case
        - Support review PRs
    - Meetings:
        - Bi-weekly MFG All-hands Video

### 2025-04-04
Axel:
- Yesterday:
    - Tasks: 
        - TAXW-1486
            - TAXW-1134 [CS Ticket]email address switch between old and new after changing email due to the updated time being over 1 year: Was able to access aweb staging but was not able to reproduce the bug
    - Meetings:
        - Borderless Culture: Insights from Culture Heroes
- Today:
    - Tasks: 
        - TAXW-1486
            - TAXW-1134 [CS Ticket]email address switch between old and new after changing email due to the updated time being over 1 year: reproduce the bug and fix it
    - Meetings:
        - No meetings

Trance:
- Yesterday:
    - Meetings:
        - Borderless Culture: Insights from Culture Heroes
    - Tasks:
        - TAXW-1555 The exported Payment report total PDF file is not matching with Calculation table
          Continue (30%)
        - PR Reviews: 
            - TAXW-1651 -  Minus input for insurance warning message
            - PR Fix My Number: https://moneyforward.atlassian.net/browse/TAXW-1450
                - To test: Import with Cloud Payroll
                    1. declaration_of_employee
                    2. declaration_of_partner
                    3. next_declaration_of_employee
                    4. next_declaration_of_partner
                    5. declaration_of_dependents
                        - wife/husband
                        - father/mother
                    6. next_declaration_of_employee.next_dependents
- Today:
    - Meetings:
        - TA Management MTG
        - [TA Dev] Team Sync-up
        - Service Platform sharing
        - Bi-weekly TA and SRE team
    - Tasks:
        - TAXW-1555 The exported Payment report total PDF file is not matching with Calculation table
          Continue

Edgar:
- Yesterday:
    - Tasks:
        - TAXW-1477 Auto-reading paid launch
        - TAXW-1575: Document design
        - TAXW-1486 - Bug list 
        - TAXW-1700: [Auto Reading Insurance] 500 error is displayed when removing employee from YETA
    - Meetings:
        - Borderless Culture: Insights from Culture Heroes
- Today:
    - Tasks:
        - TAXW-1477 Auto-reading paid launch
        - TAXW-1575: Document design => should be ready for review by today
        - TAXW-1486 - Bug list 
        - TAXW-1700: [Auto Reading Insurance] 500 error is displayed when removing employee from YETA
    - Meetings:
        - None

Pat:
- Yesterday:
    - Tasks:
        - TAXW-1486 - Bug list 
        - TAXW-1698: [Auto reading Insurance] Can go to next step when employee Do Not press [Send image] button
        - TAXW-1699: [Auto reading Insurance] Generate duplicate error message when employee Do Not press [Send image] button
    - Meetings:
        - Borderless Culture: Insights from Culture Heroes
- Today:
    - Tasks:
        - TAXW-1486 - Bug list 
        - TAXW-1698: [Auto reading Insurance]Can go to next step when employee Do Not press [Send image] button
        - TAXW-1699: [Auto reading Insurance]Generate duplicate error message when employee Do Not press [Send image] button
    - Meetings:
        - None

Hugo:
- Yesterday:
    - Tasks:
        - TAXW-1414 Minus input for insurance premium
            - TAXW-1629 [TAXW-1414] Technical doc - 80%
        - PR Reviews:
            - TAXW-1651 -  Minus input for insurance warning message
    - Meetings:
        - Borderless Culture: Insights from Culture Heroes
- Today:
    - Tasks:
        - TAXW-1414 Minus input for insurance premium
            - TAXW-1629 [TAXW-1414] Technical doc - Continue
    - Meetings:
        - FE Guild Major Sync-up


### 2025-04-03
Axel:
- Yesterday:
    - Tasks: 
        - TAXW-1134 [CS Ticket]email address switch between old and new after changing email due to the updated time being over 1 year: Request service access permission (admin edit email) still waiting for the approval (progress: 20%)
    - Meetings:
        - MFV Monthly All-hands
- Today:
    - Tasks: 
        - TAXW-1134 [CS Ticket]email address switch between old and new after changing email due to the updated time being over 1 year: Wait for aweb staging access approval and reproduce the bug
    - Meetings:
        - Borderless Culture: Insights from Culture Heroes

Trance:
- Yesterday:
    - Meetings:
        - MFV Monthly All-Hands
        - [TA] Weekly Dev Sync
    - Tasks:
        - TAXW-1555 The exported Payment report total PDF file is not matching with Calculation table (10%)
        - Collected context and reproduced the issue
        - Reviewed PRs: 
            - #10775: Update Installation guide (README)
            - #10763: Update Docker setup for Dev Environment
- Today:
    - Meetings:
        - Borderless Culture: Insights from Culture Heroes
    - Tasks:
        - TAXW-1555 The exported Payment report total PDF file is not matching with Calculation table - Continue

Edgar:
- Yesterday:
    - Tasks:
        - [TAXW-1477] Auto-reading paid launch
        - TAXW-1575: Document design (60%)
    - Meetings:
        - MFV Monthly All-hands
- Today:
    - Tasks:
        - [TAXW-1477] Auto-reading paid launch
        - TAXW-1575: Document design
    - Meetings:
        - Borderless Culture: Insights from Culture Heroes

Pat:
- Yesterday:
    - Off in morning
    - Tasks:
        - [TAXW-1414] Minus insurance input - Review PR
        - [TAXW-1477] Auto-reading - TAXW-1590 [TAXW-1477][DEV] Impact Analysis => done
- Today:
    - Tasks:
        - [TAXW-1414] Minus insurance input - Final re-check PrD then release to test ENV and start self-testing
    - Meetings:
        - Borderless Culture: Insights from Culture Heroes

Hugo:
- Yesterday:
    - Tasks:
        - Minus input for insurance premium - Fixed
        - TAXW-1630 [TAXW-1414] Impacted analysis - 90% complete
        - TAXW-1629 [TAXW-1414] Technical doc - Started
    - Meetings:
        - MFV Monthly All-hands
- Today:
    - Tasks:
        - TAXW-1630 [TAXW-1414] Impacted analysis - Complete
        - TAXW-1629 [TAXW-1414] Technical doc - Continue
    - Meetings:
        - Borderless Culture: Insights from Culture Heroes

### 2025-04-02
Axel:
- Yesterday:
    - Tasks: 
        - Request service access permission (aweb staging) and reproduce bug locally for ticket TAXW-1134 [CS Ticket] email address switch between old and new after changing email due to the updated time being over 1 year
    - Meetings:
        - MFV Monthly All-hands
- Today:
    - Tasks:
        - Continue investigating TAXW-1134 email address switch bug
        - Set up local environment for testing
    - Meetings:
        - Borderless Culture: Insights from Culture Heroes

Trance:
- Yesterday:
    - Meetings:
        - MFV Monthly All-Hands
        - [TA] Weekly Dev Sync
    - Tasks:
        - TAXW-1555 The exported Payment report total PDF file is not matching with Calculation table - Continued investigation
        - Reviewed PRs: 
            - #10775: Update Installation guide (README)
            - #10763: Update Docker setup for Dev Environment
- Today:
    - Meetings:
        - [TA] Onboarding: Product Overview - Part 2
    - Tasks:
        - TAXW-1555 The exported Payment report total PDF file is not matching with Calculation table - Continue implementation

Edgar:
- Yesterday:
    - Tasks:
        - TAXW-1575: Document design (40%)
    - Meetings:
        - MFV Monthly All-hands
- Today:
    - Tasks:
        - TAXW-1575: Document design (continue)
        - PR reviews
    - Meetings:
        - Borderless Culture: Insights from Culture Heroes

Pat:
- Yesterday:
    - Off in the morning
    - Tasks:
        - TAXW-1590 [TAXW-1477][DEV] Impact Analysis - 70% complete
- Today:
    - Tasks:
        - TAXW-1590 [TAXW-1477][DEV] Impact Analysis - Complete
        - Start technical documentation
    - Meetings:
        - [TA] Onboarding: Product Overview - Part 2

Hugo:
- Yesterday:
    - Tasks:
        - Minus input for insurance premium - Fixed
        - TAXW-1630 [TAXW-1414] Impacted analysis - 90% complete
        - TAXW-1629 [TAXW-1414] Technical doc - Started
    - Meetings:
        - MFV Monthly All-hands
- Today:
    - Tasks:
        - TAXW-1630 [TAXW-1414] Impacted analysis - Complete
        - TAXW-1629 [TAXW-1414] Technical doc - Continue
    - Meetings:
        - Borderless Culture: Insights from Culture Heroes

### 2025-04-01
Axel:
- Last day:
    - Tasks: 
        - Created a PR for dockerizing the project
        - Read ticket TAXW-1134 [CS Ticket] email address switch between old and new after changing email due to the updated time being over 1 year - to understand bug description 
    - Meetings:
        - [TA - Garnet team] Backlog Refinement
        - Sprint Planning
        - Onboarding: Sharing Session
- Today:
    - Tasks: 
        - TAXW-1134 [CS Ticket] email address switch between old and new after changing email due to the updated time being over 1 year - Gather context (ask about system architecture, request service access permissions) and Reproduce bug locally
    - Meetings:
        - On Boarding Session Product Overview - Way of Work Part 1
        - Bi-weekly MFG All-hands

Trance:
- Yesterday:
    - Meetings:
        - [Garnet] Backlog Refinement
        - [TA Dev] Sprint Planning
        - [PRD sharing] issues list
        - [TA] Onboarding: Sharing Session 5
    - Tasks:
        - TAXW-1450 - Fix My Number: Investigated the issue found during PR Review
        - PRs Review if time allows
- Today:
    - Meetings:
        - SG postpone release discussion
        - Bi-weekly MFG All-hands
        - [TA] Onboarding: Product Overview - Part 1
    - Tasks:
        - TAXW-1450: Fix My Number: Continue to fix the issue found during PR Review

Pat:
- Last day:
    - Tasks:
        - TAXW-1534 Improve performance for employees_csv_import_job - Completed
        - Auto reading
        - TAXW-1590 [TAXW-1477][DEV] Impact Analysis - 50% complete
    - Meetings:
        - [TA - Garnet team] Backlog Refinement
        - TAX: Sprint Planning
- Today:
    - Tasks:
        - TAXW-1590 [TAXW-1477][DEV] Impact Analysis - Continue
    - Meetings:
        - Bi-weekly MFG All-hands Video

Hugo:
- Last day:
    - Tasks:
        - TAXW-1651 Display warning message when there is any negative insurance amount - Update Rspec (Completed)
        - TAXW-1630 [TAXW-1414] Impacted analysis - 50% complete
    - Meetings:
        - Sprint retrospective
        - Tech seminar
- Today:
    - Tasks:
        - TAXW-1630 [TAXW-1414] Impacted analysis - Continue
    - Meetings:
        - Backlog refinement
        - Sprint planning

Edgar:
- Last day:
    - Tasks:
        - TAXW-1587: Display list of tax adjustments which have employees use auto-reading feature
        - TAXW-1593: List of employees used Auto-reading feature
        - Get PR ready to merge
        - TAXW-1663: Update YETA deletion modal
    - Meetings:
        - Sprint Retrospective
- Today:
    - Tasks:
        - TAXW-1575: Document design
    - Meetings:
        - [TA - Garnet team] Backlog Refinement
        - Sprint Planning

### 2025-03-31
Trance:
- Last Friday:
    - Meetings:
        - [TA] Onboarding: Sharing Session 4
        - [PRD sharing] issues list
        - [TA Dev] Team Sync-up
        - [TA] Dev & QA sync-up
        - TAX: Sprint Retrospective+ 2024 KPT review
        - Tech seminar (Monthly)
    - Tasks:
        - Reviewed PR: TAXW-1547, 1548
- Today:
    - Meetings:
        - [Garnet] Backlog Refinement
        - [TA Dev] Sprint Planning
        - [PRD sharing] issues list
        - [TA] Onboarding: Sharing Session 5
    - Tasks:
        - Review PRs: improving SonarQube issues: TAXW-1549, 1588

Hugo:
- Last day:
    - Tasks:
        - TAXW-1651 Display warning message when there is any negative insurance amount - Done
    - Meetings:
        - Sprint retrospective
        - Tech seminar
- Today:
    - Tasks:
        - TAXW-1630 [TAXW-1414] Impacted analysis - Continue
    - Meetings:
        - Backlog refinement
        - Sprint planning

Edgar:
- Last day:
    - Tasks:
        - TAXW-1587: Display list of tax adjustments which have employees use auto-reading feature
        - TAXW-1593: List of employees used Auto-reading feature
        - Get PR ready to merge
        - TAXW-1663: Update YETA deletion modal
    - Meetings:
        - Sprint Retrospective
- Today:
    - Tasks:
        - TAXW-1575: Document design
    - Meetings:
        - [TA - Garnet team] Backlog Refinement
        - Sprint Planning
