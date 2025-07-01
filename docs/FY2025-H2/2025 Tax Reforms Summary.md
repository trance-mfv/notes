# 2025 Tax Reforms Summary

## Kick-off for 2025 Tax Reforms

**Today's Agenda:**
- Overview of Tax Reforms (Changes and Impact on TA)
- The scope addressed in the PRD
- Q&A

## Changes for 2025

1.  **Revision of the basic deduction:** The basic deduction amount will be increased for almost all income earners.
2.  **Revision of the employment income deduction:** The employment income deduction amount will be increased for salaried employees with an annual income of 1.9 million yen.
3.  **Revision of the income requirement for spouse deduction, dependent deduction, disability deduction and working student deduction:** The income requirement for relatives eligible for the spousal deduction and similar deductions will be increased by 100,000 yen. This revision has an impact on income adjustment deduction, widow deduction, and single parent deduction.
4.  **Establishment of new deduction for relatives:** For relatives aged 19 to 22, they can now clarify for the special deduction for specified relatives even if their income exceeds the income requirement for the dependent deduction (580,000 yen).

## Parts Impacted by Changes

One of the main purposes of the year-end tax adjustment is to calculate the annual tax amount based on the total salary and bonuses paid over the year. This year's tax reform affects some parts of the process for calculating the annual tax amount. It also affects declaration forms, electronic filing, and integration with other products. This is a very important change as it impacts all users.

### Tax Calculation Flowchart

+---------------------+
|  Employment Income  |
+---------------------+
           |
           v
+-------------------------------+
| Subtract Employment Income    |
| Deduction                    |
+-------------------------------+
           |
           v
+---------------------------------------------+
| Is Income Adjustment Deduction applicable?  |
+-------------------+-------------------------+
        | Yes                      | No
        v                          v
+-----------------------------+   +-------------------+
| Subtract Income Adjustment  |   |  Taxable Income   |
| Deduction                   |   +-------------------+
+-----------------------------+           |
           |                              |
           +--------------+---------------+
                          v
                +-------------------+
                | Basic Deduction   |
                +-------------------+
                          |
                          v
                +-------------------+
                | Spouse Deduction  |
                +-------------------+
                          |
                          v
                +----------------------+
                | Dependent Deduction  |
                +----------------------+
                          |
                          v
                +-----------------------+
                | Disability Deduction  |
                +-----------------------+
                          |
                          v
                +---------------------------+
                | Working Student Deduction |
                +---------------------------+
                          |
                          v
                +-------------------------------+
                | Life Insurance Premium         |
                | Deduction                     |
                +-------------------------------+
                          |
                          v
                +-------------------------------+
                | Earthquake Insurance Premium  |
                | Deduction                     |
                +-------------------------------+
                          |
                          v
                +-----------------------------+
                | Nontaxable Income Amount    |
                +-----------------------------+
                          |
                          v
                +-------------------+
                | Multiply by Rate  |
                +-------------------+
                          |
                          v
                +-----------------------------+
                | Calculated Income Tax Amount|
                +-----------------------------+
                          |
                          v
                +------------------------------------------+
                | Subtract Special Deduction for Housing   |
                | Loans                                    |
                +------------------------------------------+
                          |
                          v
                +-------------------+
                | Annual Tax Amount |
                +-------------------+

## Scope of the PRD (Product Requirement Document)

**PRD: The increase of the 1.03 million yen income threshold**

**Requirement 1:** Address Revision of basic deduction.
- Change the calculation logic of basic deduction for employees themselves.

**Requirement 2:** Address Revision of employment income deduction.
- Change the calculator logic of employment deduction for employees themselves and their spouse.

**Requirement 3:** Address Working student deduction.
- Enable considering the amount of total income when determining working deduction for this year and next year.

**Requirement 4:** Address the Deductions related to spouse.
- Change the income requirement for each deduction.

**Notes:** Other deductions and the establishment of new deductions for relatives will be addressed in a separate PRD. Additional PRDs will be created for changes other than calculation logic, such as integration with other products and changing the declaration forms.

## Reference Information for Separate PRD

**PRD: Establishment of new deductions**

**Requirement 1-2:** Address the deductions related to dependent relatives.
- Change UI of the survey screen and the income requirement for each deduction.

**Requirement 3-4:** Address widow deduction and single parent deduction.
- Add questions to the survey for confirming widow/single parent and change the income requirement for the dependent relatives.

**Requirement 5:** Address dependent relatives declared for tax deduction by other taxpayer.
- Change the income requirement eligible for dependent relative declared by other taxpayer.

**Requirement 6:** Address dependent relatives for inhabitant tax.
- Change the income requirement of the dependent relatives for inhabitant tax.

**Requirement 7-8:** Address the establishment new deduction (Special deduction for specified relative).
- Enable user to calculate the amount of special deduction for specified relatives.

**Requirement 9 (Nice to have):** Add the validation for the estimated income input field on survey screen.

