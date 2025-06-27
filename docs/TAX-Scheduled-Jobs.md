| Time (JST) | Job name | Status | Note | New Time |
|------------|----------|--------|------|----------|
| 00:00 1st | UnbillableOfficeMonthlyReportJob | OK | Stop working<br>Do not call 3rd service | |
| 00:01 | UpdateWithdrawOfficesJob | NG | Call Navis<br>It often take 5minutess to complete<br>Screenshot 2025-06-25 at 16.22.26.png | 23:50 |
| 00:10 | TaEmployeePublishReservedWitholdingSlipJob | OK | Do not call 3rd service | |
| 00:30 | ReportCountsJob | OK | Do not call 3rd service | |
| 00:30 | UnbillableOfficeReportJob | OK | Do not call 3rd service | |
| 00:45 | DeleteUsersWithoutOfficeMembersJob | OK | Do not call 3rd service | |
| 05:00 | UpdateOfficeContractDailyJob | should change | Should change to 05:05 to ensure the job is always safety<br>It always take 2 minutes to complete the job<br>Screenshot 2025-06-25 at 16.04.07.png | 05:05 |
| 05:30 | CreateOrUpdateAutoReadingMonthlyPaymentsJob | OK | Auto-reading Paid Launch | 05:15 |
| 04:00 | AggregateNavisTenantUsersCronJob | NG | Call Navis | 05:30 |
| 06:00 1st | PostBillableOfficesToErpJob | OK | Not impact | |
| 07:00 | ProcessNavisEventsJob | OK | Not impact | |
| 07:00 1st | PostExtraPaymentBillableOfficesToErpJob | OK | Not impact<br>Auto-reading Paid Launch | |
| 09:00 | AutoReadingUsageJob | OK | Not impact | |
| 10:00 | YearEndTaxAdjustmentNotificationRemindJob | OK | Not impact | |
| 15:00 | ProcessNavisEventsJob | OK | Not impact | |
| 22:00 | CreateOrUpdateMonthlyPaymentsJob | OK | Not impact<br>it often take 5 mins to complete<br>Screenshot 2025-06-25 at 16.25.23.png | |
| Every 30 minutes | WaitingQueuesNotificationJob | OK | Do not call 3rd service | |