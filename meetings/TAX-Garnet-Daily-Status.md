# Team Garnet

## Summary

| Ticket | Parent Ticket | Description | Assignee | Status |
|--------|--------------|-------------|----------|--------|
| TAXW-1134 | | Email address switch bug investigation | Axel | In Progress |
| TAXW-1450 | | Fix My Number issues | Trance | In Progress |
| TAXW-1534 | | Employees CSV import job performance improvement | Pat | ✅ Completed |
| TAXW-1555 | | Payment report total PDF mismatch with Calculation table | Trance | In Progress |
| TAXW-1575 | | Document design | Edgar | In Progress (40%) |
| TAXW-1587 | [TAXW-1477] | Tax adjustments auto-reading feature list | Edgar | ✅ Completed |
| TAXW-1590 | [TAXW-1477] | Impact Analysis | Pat | In Progress (50%) |
| TAXW-1593 | [TAXW-1477] | Employees auto-reading feature list | Edgar | ✅ Completed |
| TAXW-1629 | [TAXW-1414] | Technical doc | Hugo | In Progress |
| TAXW-1630 | [TAXW-1414] | Impact analysis | Hugo | In Progress |
| TAXW-1651 | | Warning message for negative insurance amount | Hugo | ✅ Completed |
| TAXW-1663 | | YETA deletion modal update | Edgar | ✅ Completed |

## Current Focus

Bug investigations and fixes
Impact analysis for multiple tickets
Documentation work
Code reviews
Onboarding activities

## Daily Status
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
        - Backlog refinement
        - Sprint planning
- Today:
    - Tasks:
        - TAXW-1630 [TAXW-1414] Impacted analysis - Continue
    - Meetings:
        - Bi-weekly all-hand video

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
