# Team Garnet - Sprint 114

## Sprint Retrospective
- [Guild](https://moneyforward.slack.com/archives/C08JUKXF70C/p1745904954968439)

## Sprint Summary

Garnet team:
Capitalization: 61%
Non-capitalization: 39%
    Technical Debt: 10%
        Maintenance
        Technical Improvement task
        Other internal issue
    VOC/CRE request: 29%
        Bug investigation
        Bug fixing
    Onboarding: 0%

## PrD Ready:
- TAXW-1898: [TA2025] Mass Checking UX Improvement Phase 3/ [UX改善]大量確認作業のステップ数削減  Phase3
- TAXW-1427: [TA2025] Mass Checking UX Improvement / [UX改善]大量確認作業のステップ数削減 
- TAXW-1894: [TA2025] Mass Checking UX Improvement Phase 2/ [UX改善]大量確認作業のステップ数削減  Phase2
- TAXW-1426: Change the “Beneficiary” field from optional to mandatory / 「保険金等の受取人」欄を任意項目から必須項目に変更 (09/05)
- TAXW-1706: Changes in the calculation of the withholding tax amount in the withholding slips total report / 給与所得の源泉徴収票等の法定調書合計表源泉徴収税額算出方法見直し (09/05)
- TAXW-1484: Auto-reading Feature Improvement phase1 (09/05)
    - How many teams will be implemented?

## Sprint Progress Updates - May 02:
- Product Roadmap:
    - TAXW-1414: Minus input for insurance premium
        - Dev Process: 100%
        - QA: Testing

    - TAXW-1477: 保険料控除入力代行有償公開 / Auto-Reading Paid Launch
        - Dev Process: 100%
        - QA: Test case creation - In progress

    - TAXW-1424: Display payment amount in withholding book even if taxable amount is negative / 源泉徴収簿の支給額を課税支給額がマイナスであっても表示
        - Dev progress: 20%

- Feedback - Improvement
    - TAXW-1454: 寡婦・ひとり親判定の見直し / Review of widow/single parent status determination
        - Dev progress: 100%

    - TAXW-1649: [Improvement][Monthly Payment]Change the search data in Employee Group dropdown
        - Dev progress: 100%
        - QA testing

- Bugs:
    - TAXW-1700: [Auto Reading Insurance] 500 error is displayed when removing employee from YETA/従業員削除したら、500エラーが発生
        - Released

    - TAXW-622: [Legacy Bug] - Employee Log - It is recorded log with an incorrect insurance number on Employee Log when updating insurance which is XML or auto reading insurance with existing manual insurance 
        - Dev Process: 100%
        - Ready for Test

    - TAXW-964: TA2024_RegressionPhase2_[Dependent PDF Next Year] - The Widow check box is still ON after syncing Gender from PA
        - Dev Process: 100%
        - Ready for Test

    - TAXW-1707: [Delete owner] - Attorney can delete owner
        - Dev progress: 30%

    - TAXW-1555: The exported Payment report total PDF file is not matching with Calculation table 
        - In Confirm with PrD

- Non-functional Requirements:
    - TAXW-1600: Upgrade Ruby
    - Dev Progress: 60%

    - TAXW-1599: Upgrade Rails
    - Dev Progress: 45%


## Daily Status

### 2025-05-02
Axel:
- Last day:
    - Tasks: 
        - TAXW-1600: Upgrade Ruby
        - TAXW-1745: [TAXW-1600] Upgrade Dev Environment to Ruby 3.2.8 Update codebase, remove deprecations
    - Meetings:
        - MFBC Monthly All-hands video
- Today:
    - Tasks: 
        - TAXW-1600: Upgrade Ruby
        - TAXW-1745: [TAXW-1600] Upgrade Dev Environment to Ruby 3.2.8 Update codebase, remove deprecations
            - Continue updating codebase
    - Meetings:
        - No meetings

Edgar:
- Last day:
    - Tickets:
        - TAXW-1599: Upgrade Rails
        - TAXW-1750: [TAXW-1599] Upgrade Development Environment to Rails 7.1.5.1
    - Meetings:
        - MFBC Monthly All-hands video
- Today:
    - Tickets:
        - TAXW-1599: Upgrade Rails
        - TAXW-1750: [TAXW-1599] Upgrade Development Environment to Rails 7.1.5.1
    - Meetings:
        - None

Pat: OFF

Hugo:
- Last day:
    - Tasks:
        - TAXW-964: TA2024_RegressionPhase2_[Dependent PDF Next Year] - The Widow check box is still ON after syncing Gender from PA
            - Implement Done
        - TAXW-1244: SG Plan Linkage Revision / 士業プラン連携改修
        - TAXW-1885: [DEV][SG] Write Impact Analysis - 90%
            - Self-test for changes?
    - Meetings:
        - MFBC Monthly All-hands video
- Today:
    - Tasks:
        - TAXW-964: TA2024_RegressionPhase2_[Dependent PDF Next Year] - The Widow check box is still ON after syncing Gender from PA
            - Write impact analysis
        - TAXW-1244: SG Plan Linkage Revision / 士業プラン連携改修
        - TAXW-1885: [DEV][SG] Write Impact Analysis
            - Finish
        - TAXW-1821: [TAXW-1707][DEV] Attorney cannot delete owner
            - Start
    - Meetings:
        - None

Trance: OFF
    - Notes from SRE:
        - Links:
            - [ta-migration-urgent-case](https://moneyforward.slack.com/archives/C08M0RB1C8Y/p1746193430436779?thread_ts=1746192799.748329&cid=C08M0RB1C8Y)
        - Tade/phan.minh.trung: 14:23
            - a vào đc pws bastion rùi, đang check connectivity trên production
            - thứ 2 a chỉ cách vào
        - Nazmul / alam.nazmul: 20:46
            - Thanks Nas for pointing out.The current weekly scheduled maintenance:
                - Tuesdays from 2:00 to 4:00 AM JST
                - Fridays from 2:00 to 4:00 AM JST
        - Nas: 
            - review env, vault
        - Jeff: [review datadog dashboard](https://moneyforward.slack.com/archives/C08M0RB1C8Y/p1746170141601849?thread_ts=1746170052.563019&cid=C08M0RB1C8Y)
            - Em đang vướng chỗ đưa các metrics của MySQL lên DD
            - Em chưa vào trong cái Aurora and RDS nhưng chưa được, có time anh support em vs nha.
            - Em vào :
                - AWS accounts: TEST-SERVICE-PLATFORM-CLUSTER
                - Quyền: ServicePlatformClusterOperator
        - **Final SP schedule: Friday, May 09 at 2AM-4AM JST**

### 2025-04-29
Axel:
- Yesterday:
    - Tasks: 
        - TAXW-1414: Minus input for insurance premium
        - TAXW-1847: [TAXW-1414][Minus insurance] Import SmartHR - Validate invalid values - Incorrect error message 
            - Fixed comments and deployed/verified feature on testing environment
    - Meetings:
        - [TA-Garnet] Sync-up
        - TAX: Sprint Planning
        - 1on1 with Nas
- Today:
    - Tasks: 
        - Upgrade ruby
    - Meetings:
        - MFBC Monthly All-hands video

Edgar:
- Last day:
    - Tickets:
        - TAXW-1599: Upgrade Rails
        - TAXW-1751: [TAXW-1599] Investigate change logs and impact areas for Rails 7.2.2.1
    - Meetings:
        - [TA-Garnet] Sync-up
        - TAX: Sprint Planning
        - 1 on 1
- Today:
    - Tickets:
        - TAXW-1599: Upgrade Rails
        - TAXW-1751: [TAXW-1599] Investigate change logs and impact areas for Rails 7.2.2.1
        - TAXW-1750: [TAXW-1599] Upgrade Development Environment to Rails 7.1.5.1
    - Meetings:
        - MFBC Monthly All-hands video

Pat: Off this morning

Hugo:
- Last day:
    - Tasks:
        - TAXW-964: TA2024_RegressionPhase2_[Dependent PDF Next Year] - The Widow check box is still ON after syncing Gender from PA
            - 50%
    - Meetings:
        - [TA-Garnet] Sync-up
        - TAX: Sprint Planning
        - 1on1
- Today:
    - Tasks:
        - TAXW-964: TA2024_RegressionPhase2_[Dependent PDF Next Year] - The Widow check box is still ON after syncing Gender from PA
        - TAXW-1244: SG Plan Linkage Revision / 士業プラン連携改修
        - TAXW-1885: [DEV][SG] Write Impact Analysis
    - Meetings:
        - MFBC Monthly All-hands video

Trance:
- Last day:
    - Meetings: 
        - [TA-Garnet] Sync-up
        - TAX: Sprint Planning
        - Discuss Sprint Planning issues
    - Tasks:
        - TAXW-1703: [Minus Insurance] -  Execute test on TEST environment
            - Followed up: the issue fix and finished up the test execution
- Today:
    - Meetings:
        - TA Jira Workflow Discussion
        - MFBC Monthly All-hands video
    - Tasks:
        - TAXW-1703: [Minus Insurance] -  Execute test on TEST environment
            - Following up with Gwen for a plan to Open New YETA
            - Following up with QA for a release plan
        - TAXW-1477: 保険料控除入力代行有償公開 / Auto-Reading Paid Launch
            - Transferring from Jeff MFV
            - Jeff: 
                - Should do
                    - Code review
                    - If issues found, fix early before QA
                    - Refactor codes
                    - app/services/billing/calculate_monthly_payment_auto_reading_employees_service.rb
                - Code file này đang xử lý hơi nhiều logic nên em định plan để refactor mà chưa đủ time. Phần này nếu có thể  plan thì có thể làm ngay, ngược lại có thể tạo task improvement làm sau.

### 2025-04-28

Axel:
- Last day:
    - Tasks: 
        - TAXW-1414: Minus input for insurance premium
        - TAXW-1847: [TAXW-1414][Minus insurance] Import SmartHR - Validate invalid values - Incorrect error message Fixed comments of issue
    - Meetings:
        - TAX: Sprint Retrospective
        - Engineering All Hands
- Today:
    - Tasks: 
        - TAXW-1414: Minus input for insurance premium
        - TAXW-1847: [TAXW-1414][Minus insurance] Import SmartHR - Validate invalid values - Incorrect error message Fixed comments of issue
        - Upgrade ruby
    - Meetings:
        - [TA-Garnet] Sync-up
        - TAX: Sprint Planning
        - 1on1 with Nas

Edgar:
- Last day:
    - Tickets:
        - TAXW-1599: Upgrade Rails
        - TAXW-1751: [TAXW-1599] Investigate change logs and impact areas for Rails 7.2.2.1
    - Meetings:
        - TAX: Sprint Retrospective
        - Ruby seminar: Integrating Feature Flag Platform(FFP)
- Today:
    - Tickets:
        - TAXW-1599: Upgrade Rails
        - TAXW-1751: [TAXW-1599] Investigate change logs and impact areas for Rails 7.2.2.1
            - => Should be done by today
    - Meetings:
        - [TA-Garnet] Sync-up
        - TAX: Sprint Planning
        - 1 on 1

Pat:
- Yesterday:
    - Tickets:
        - TAXW-1703: [DEV][TAXW-1414]Minus Insurance -  Execute test on TEST environment
    - Meetings:
        - TAX: Sprint Retrospective
        - Engineering All Hands
- Today:
    - Tickets:
        - TAXW-1745: [TAXW-1600] Upgrade Dev Environment to Ruby 3.2.8
    - Meetings:
        - [TA-Garnet] Sync-up
        - TAX: Sprint Planning
        - Pat - Monthly Goals review + 1on1

Hugo:
- Last day:
    - Tasks:
        - TAXW-1454: 寡婦・ひとり親判定の見直し / Review of widow/single parent status determination
        - Fix issue: 
            - TAXW-1849: [TAXW-1454]][Widow/Single parent status] - The widow's checkbox is ON even though the condition is not satisfied
            - TAXW-1850: [TAXW-1454]][Single parent status] - Single parent checkbox is ON even though remove dependents is child
    - Meetings:
        - TAX: Sprint Retrospective
        - [TA-Garnet+] New YETA Issues Discussion
        - 1on1 with a Trance
        - Engineering All Hands
- Today:
    - Tasks:
        - Follow up minus insurance feature
        - New assignment
    - Meetings:
        - [TA-Garnet] Sync-up
        - TAX: Sprint Planning
        - 1on1

Trance:
- Last day:
    - Meetings:
        - [TA][Service Platform]Bug Review
        - TAX: Sprint Retrospective
        - [TA-Garnet+] New YETA Issues Discussion
        - 1on1 with Hugo
        - Engineering All Hands 
        - Ruby Seminar - optional
        - [TA]Weekly Dev Sync
        - [TA] QA & Dev sync-up
    - Tasks:
        - TAXW-1703: [Minus Insurance] -  Execute test on TEST environment
            - Followed up: mostly done. Still testing on 4 cases of XML and fixing UI issues 
    - PR Review:
        - TAXW-1847: [TAXW-1414][Minus insurance] Import SmartHR - Validate invalid values - Incorrect error message
            - To investigate to simplify the solution
        - TAXW-1454: 寡婦・ひとり親判定の見直し / Review of widow/single parent status determination
            - To simplify the constants
- Today:
    - Meetings: 
        - [TA-Garnet] Sync-up
        - TAX: Sprint Planning
        - Nas/Trance 1on1
    - Tasks:
        - TAXW-1703: [Minus Insurance] -  Execute test on TEST environment
            - Following up: the UI fix and finished up the testing 
        - TAXW-1599: Upgrade Rails
            - Following up: Review and upgrade at local 

