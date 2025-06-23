# frozen_string_literal: true

module TaReport
  module DeclarationOfBasicAndPartnerAndAmountOfIncome
    module Builder
      class Version2025 < Version2023
        INCOME_RANGES = {
          'D' => { range: 10_000_001..18_050_000, deduction: 480_000 },
          'E' => { range: 18_050_001..23_500_000, deduction: 480_000 },
          'F' => { range: 23_500_001..24_500_000 },
          'G' => { range: 24_500_001..25_000_000 }
        }.freeze

        def set_employee_estimated_total_income_attributes
          super
          set_alphabet_by_employee_estimated_total_income
        end

        private

        def set_alphabet_by_employee_estimated_total_income
          income = @report.employee_estimated_total_income
          alphabet = nil

          INCOME_RANGES.each do |key, config|
            if config[:range].include?(income)
              alphabet = key
              @report.deduction_by_employee_total_earnings = config[:deduction] if config[:deduction]
              break
            end
          end

          @report.alphabet_by_employee_estimated_total_income = alphabet || @report.alphabet_by_employee_estimated_total_income
          @report.alphabet_displayed_by_employee_estimated_total_income = 'D' if INCOME_RANGES['D'][:range].include?(income)
        end
      end
    end
  end
end
