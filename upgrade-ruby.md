# Upgrade Ruby

## References

- https://blog.arkency.com/do-you-tune-out-ruby-deprecation-warnings/
- https://dev.to/michymono77/rails-and-ruby-deprecation-warnings-stop-ignoring-start-fixing-1kca#:~:text=Deprecation%20warnings%20are%20rails'(and,active_support.

## Errors

```
/home/circleci/repo/vendor/bundle/ruby/3.4.0/gems/activesupport-7.0.8.1/lib/active_support/logger_thread_safe_level.rb:12:in '<module:LoggerThreadSafeLevel>': uninitialized constant ActiveSupport::LoggerThreadSafeLevel::Logger (NameError)

......
^^^^^^
        from /home/circleci/repo/vendor/bundle/ruby/3.4.0/gems/activesupport-7.0.8.1/lib/active_support/logger_thread_safe_level.rb:9:in '<module:ActiveSupport>'
        from /home/circleci/repo/vendor/bundle/ruby/3.4.0/gems/activesupport-7.0.8.1/lib/active_support/logger_thread_safe_level.rb:8:in '<main>'
        from /usr/local/lib/ruby/3.4.0/bundled_gems.rb:82:in 'Kernel.require'
        from /usr/local/lib/ruby/3.4.0/bundled_gems.rb:82:in 'block (2 levels) in Kernel#replace_require'
        from /home/circleci/repo/vendor/bundle/ruby/3.4.0/gems/bootsnap-1.18.4/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:30:in 'Kernel#require'
        from /home/circleci/repo/vendor/bundle/ruby/3.4.0/gems/activesupport-7.0.8.1/lib/active_support/logger_silence.rb:5:in '<main>'
        from /usr/local/lib/ruby/3.4.0/bundled_gems.rb:82:in 'Kernel.require'
        from /usr/local/lib/ruby/3.4.0/bundled_gems.rb:82:in 'block (2 levels) in Kernel#replace_require'
        from /home/circleci/repo/vendor/bundle/ruby/3.4.0/gems/bootsnap-1.18.4/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:30:in 'Kernel#require'
        from /home/circleci/repo/vendor/bundle/ruby/3.4.0/gems/activesupport-7.0.8.1/lib/active_support/logger.rb:3:in '<main>'
        from /usr/local/lib/ruby/3.4.0/bundled_gems.rb:82:in 'Kernel.require'
        from /usr/local/lib/ruby/3.4.0/bundled_gems.rb:82:in 'block (2 levels) in Kernel#replace_require'
        from /home/circleci/repo/vendor/bundle/ruby/3.4.0/gems/bootsnap-1.18.4/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:30:in 'Kernel#require'
        from /home/circleci/repo/vendor/bundle/ruby/3.4.0/gems/activesupport-7.0.8.1/lib/active_support.rb:29:in '<main>'
        from /usr/local/lib/ruby/3.4.0/bundled_gems.rb:82:in 'Kernel.require'
        from /usr/local/lib/ruby/3.4.0/bundled_gems.rb:82:in 'block (2 levels) in Kernel#replace_require'
        from /home/circleci/repo/vendor/bundle/ruby/3.4.0/gems/bootsnap-1.18.4/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:30:in 'Kernel#require'
        from /home/circleci/repo/vendor/bundle/ruby/3.4.0/gems/railties-7.0.8.1/lib/rails/command.rb:3:in '<main>'
        from /usr/local/lib/ruby/3.4.0/bundled_gems.rb:82:in 'Kernel.require'
        from /usr/local/lib/ruby/3.4.0/bundled_gems.rb:82:in 'block (2 levels) in Kernel#replace_require'
        from /home/circleci/repo/vendor/bundle/ruby/3.4.0/gems/bootsnap-1.18.4/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:30:in 'Kernel#require'
        from /home/circleci/repo/vendor/bundle/ruby/3.4.0/gems/railties-7.0.8.1/lib/rails/commands.rb:3:in '<main>'
        from /usr/local/lib/ruby/3.4.0/bundled_gems.rb:82:in 'Kernel.require'
        from /usr/local/lib/ruby/3.4.0/bundled_gems.rb:82:in 'block (2 levels) in Kernel#replace_require'
        from /home/circleci/repo/vendor/bundle/ruby/3.4.0/gems/bootsnap-1.18.4/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:30:in 'Kernel#require'
        from bin/rails:9:in '<main>'

Exited with code exit status 1
```

## Warnings

```
$ bin/rails s
=> Booting Puma
=> Rails 7.0.8.1 application starting in development 
=> Run `bin/rails server --help` for more startup options
/Users/nguyen.tung.trang/.rbenv/versions/3.1.4/lib/ruby/gems/3.1.0/gems/bootsnap-1.11.1/lib/bootsnap/compile_cache/iseq.rb:49: warning: character class has '-' without escape: /\A[a-zA-Z0-9-\/]+\z/
Puma starting in single mode...
* Puma version: 5.6.7 (ruby 3.1.4-p223) ("Birdie's Version")
*  Min threads: 5
*  Max threads: 5
*  Environment: development
*          PID: 35180
* Listening on http://127.0.0.1:3000
* Listening on http://[::1]:3000
Use Ctrl-C to stop
Started GET "/" for 127.0.0.1 at 2025-05-06 18:58:39 +0700
```

#### Solve
```
$ bundle update bootsnap

Installing msgpack 1.8.0 (was 1.4.5) with native extensions
Using bootsnap 1.18.4 (was 1.11.1)
...
Bundle updated!
```

#### Results
```
    bootsnap (1.18.4)

    msgpack (1.8.0)
```

### WARNING: MYSQL_OPT_RECONNECT is deprecated and will be removed in a future version.

In database.yml, remove this line:
```
  reconnect: false
```

### DEPRECATION WARNING: TimeWithZone#to_s(:ymd) is deprecated
```
DEPRECATION WARNING: Using a :default format for TimeWithZone#to_s is deprecated. Please use TimeWithZone#to_fs instead. If you fixed all places inside your application that you see this deprecation, you can set `ENV['RAILS_DISABLE_DEPRECATED_TO_S_CONVERSION']` to `"true"` in the `config/application.rb` file before the `Bundler.require` call to fix all the callers outside of your application. (called from show at /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/app/controllers/year_end_tax_adjustment/tax_adjustment_queue_statuses_controller.rb:15)

DEPRECATION WARNING: Using a :default format for TimeWithZone#to_s is deprecated. Please use TimeWithZone#to_fs instead. If you fixed all places inside your application that you see this deprecation, you can set `ENV['RAILS_DISABLE_DEPRECATED_TO_S_CONVERSION']` to `"true"` in the `config/application.rb` file before the `Bundler.require` call to fix all the callers outside of your application. (called from show at /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/app/controllers/year_end_tax_adjustment/tax_adjustment_queue_statuses_controller.rb:16)


ActionView::Template::Error (DEPRECATION WARNING: TimeWithZone#to_s(:ymd) is deprecated. Please use TimeWithZone#to_fs(:ymd) instead. (called from other_phase at /Users/nguyen.tung.trang/.rbenv/versions/3.1.4/lib/ruby/gems/3.1.0/bundler/gems/omniauth_openid_connect-75ac84b88106/lib/omniauth/strategies/openid_connect.rb:136)):
    21:       .panel.panel-default.border.rounded.mf-mb20.w-100
    22:         .panel-heading.border-bottom.rounded-top.d-flex.align-items-center
    23:           span.mb-0
    24:             = "作成日：#{tax_adjustment.created_at.to_s(:ymd)} #{tax_adjustment.name}"
    25:           .d-flex.ml-auto
    26:             - is_disabled_actions =  @tax_adjustment_aggregation_queue&.status.in?(%w( waiting running )) || @tax_adjustment_delete_queue.present? || (@ta_employees_delete_queue&.tax_adjustment_id == tax_adjustment.id && @ta_employees_delete_queue&.in_progress?)
    27:             - is_disable_delete = !tax_adjustment.destroyable? || tax_adjustment.waiting_or_running_queue_exists?
```

### Using a :default format for Time#to_s is deprecated
```
/Users/nguyen.tung.trang/.rbenv/versions/3.1.4/lib/ruby/gems/3.1.0/gems/puma-5.6.7/lib/puma/launcher.rb:233:in `close_binder_listeners': DEPRECATION WARNING: Using a :default format for Time#to_s is deprecated. Please use Time#to_fs instead. If you fixed all places inside your application that you see this deprecation, you can set `ENV['RAILS_DISABLE_DEPRECATED_TO_S_CONVERSION']` to `"true"` in the `config/application.rb` file before the `Bundler.require` call to fix all the callers outside of your application. (called from <main> at bin/rails:9) (ActiveSupport::DeprecationException)
	from /Users/nguyen.tung.trang/.rbenv/versions/3.1.4/lib/ruby/gems/3.1.0/gems/puma-5.6.7/lib/puma/launcher.rb:209:in `run'
	from /Users/nguyen.tung.trang/.rbenv/versions/3.1.4/lib/ruby/gems/3.1.0/gems/puma-5.6.7/lib/rack/handler/puma.rb:72:in `run'
	from /Users/nguyen.tung.trang/.rbenv/versions/3.1.4/lib/ruby/gems/3.1.0/gems/rack-2.2.8/lib/rack/server.rb:327:in `start'
	from /Users/nguyen.tung.trang/.rbenv/versions/3.1.4/lib/ruby/gems/3.1.0/gems/railties-7.0.8.1/lib/rails/commands/server/server_command.rb:38:in `start'
	from /Users/nguyen.tung.trang/.rbenv/versions/3.1.4/lib/ruby/gems/3.1.0/gems/railties-7.0.8.1/lib/rails/commands/server/server_command.rb:143:in `block in perform'
	from <internal:kernel>:90:in `tap'
```

### Using a :default format for Date#to_s is deprecated
```
 Rendered year_end_tax_adjustment/tax_adjustment_employees/shared/_breadcrumb.html.slim (Duration: 11.0ms | Allocations: 5078)
DEPRECATION WARNING: Using a :default format for Date#to_s is deprecated. Please use Date#to_fs instead. If you fixed all places inside your application that you see this deprecation, you can set `ENV['RAILS_DISABLE_DEPRECATED_TO_S_CONVERSION']` to `"true"` in the `config/application.rb` file before the `Bundler.require` call to fix all the callers outside of your application. (called from other_phase at /Users/nguyen.tung.trang/.rbenv/versions/3.1.4/lib/ruby/gems/3.1.0/bundler/gems/omniauth_openid_connect-75ac84b88106/lib/omniauth/strategies/openid_connect.rb:136)
  Rendered year_end_tax_adjustment/tax_adjustment_employees/shared/_statistic_block.html.slim (Duration: 24.8ms | Allocations: 23618)
```

### AVOID eager loading detected
```
GET /tax_adjustments/v135lMBxGUX3p_7nhrXgWQ/tax_adjustment_employees/not_requested
AVOID eager loading detected
  DeclarationOfEmployee => [:declaration_of_life_insurance_deduction_auto_reading_images]
  Remove from your query: .includes([:declaration_of_life_insurance_deduction_auto_reading_images])
Call stack
  /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/app/views/year_end_tax_adjustment/tax_adjustment_employees/not_requested_tax_adjustment_employees/index.html.slim:35:in `_app_views_year_end_tax_adjustment_tax_adjustment_employees_not_requested_tax_adjustment_employees_index_html_slim___1907177357345293652_249560'
```

```
$ bundle exec rspec
/Users/nguyen.tung.trang/.rbenv/versions/3.1.4/lib/ruby/gems/3.1.0/gems/bootsnap-1.11.1/lib/bootsnap/compile_cache/iseq.rb:49: warning: character class has '-' without escape: /\A[a-zA-Z0-9-\/]+\z/
WARNING: MYSQL_OPT_RECONNECT is deprecated and will be removed in a future version.
/Users/nguyen.tung.trang/.rbenv/versions/3.1.4/lib/ruby/gems/3.1.0/gems/bootsnap-1.11.1/lib/bootsnap/compile_cache/iseq.rb:49: warning: character class has '-' without escape: /\A[a-zA-Z0-9-\/]+\z/
WARNING: MYSQL_OPT_RECONNECT is deprecated and will be removed in a future version.
WARNING: MYSQL_OPT_RECONNECT is deprecated and will be removed in a future version.
WARNING: MYSQL_OPT_RECONNECT is deprecated and will be removed in a future version.
WARNING: MYSQL_OPT_RECONNECT is deprecated and will be removed in a future version.
WARNING: MYSQL_OPT_RECONNECT is deprecated and will be removed in a future version.
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/forms/payment_report_total_table_update_form_spec.rb:29: warning: key :is_override_tax_withholding_announcement_type_to_other is duplicated and overwritten on line 32
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/jobs/combined_declaration_of_basic_deduction_pdf_generation_job_spec.rb:3: warning: already initialized constant CombinedDeclarationOfBasicDeductionPdfGenerationJob::NUMBER_ITEMS_PER_QUEUE
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/app/jobs/combined_declaration_of_basic_deduction_pdf_generation_job.rb:4: warning: previous definition of NUMBER_ITEMS_PER_QUEUE was here
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/jobs/combined_declaration_of_dependent_deduction_pdf_generation_job_spec.rb:3: warning: already initialized constant CombinedDeclarationOfDependentDeductionPdfGenerationJob::NUMBER_ITEMS_PER_QUEUE
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/app/jobs/combined_declaration_of_dependent_deduction_pdf_generation_job.rb:4: warning: previous definition of NUMBER_ITEMS_PER_QUEUE was here
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/jobs/combined_declaration_of_housing_loan_deduction_pdf_generation_job_spec.rb:5: warning: already initialized constant CombinedDeclarationOfHousingLoanDeductionPdfGenerationJob::NUMBER_ITEMS_PER_QUEUE
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/app/jobs/combined_declaration_of_housing_loan_deduction_pdf_generation_job.rb:4: warning: previous definition of NUMBER_ITEMS_PER_QUEUE was here
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/jobs/combined_declaration_of_insurance_deduction_pdf_generation_job_spec.rb:5: warning: already initialized constant CombinedDeclarationOfInsuranceDeductionPdfGenerationJob::NUMBER_ITEMS_PER_QUEUE
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/app/jobs/combined_declaration_of_insurance_deduction_pdf_generation_job.rb:4: warning: previous definition of NUMBER_ITEMS_PER_QUEUE was here
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/jobs/combined_payment_report_total_table_pdf_generation_job_spec.rb:5: warning: already initialized constant CombinedPaymentReportTotalTablePdfGenerationJob::NUMBER_ITEMS_PER_QUEUE
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/app/jobs/combined_payment_report_total_table_pdf_generation_job.rb:4: warning: previous definition of NUMBER_ITEMS_PER_QUEUE was here
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/jobs/combined_withholding_book_pdf_generation_job_spec.rb:5: warning: already initialized constant CombinedWithholdingBookPdfGenerationJob::NUMBER_ITEMS_PER_QUEUE
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/app/jobs/combined_withholding_book_pdf_generation_job.rb:4: warning: previous definition of NUMBER_ITEMS_PER_QUEUE was here
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/jobs/combined_withholding_slip_pdf_generation_job_spec.rb:5: warning: already initialized constant CombinedWithholdingSlipPdfGenerationJob::NUMBER_ITEMS_PER_QUEUE
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/app/jobs/combined_withholding_slip_pdf_generation_job.rb:4: warning: previous definition of NUMBER_ITEMS_PER_QUEUE was here
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/jobs/ta_employee_previous_withholding_slip_csv_import_sub_job_spec.rb:6: warning: already initialized constant NUMBER_OF_EMPL
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/jobs/ta_employee_previous_withholding_slip_csv_import_job_spec.rb:6: warning: previous definition of NUMBER_OF_EMPL was here

An error occurred while loading ./spec/models/declaration_of_dependent_spec.rb.
Failure/Error:
  context "when #{after_or_equal_to}" do
    let(:factory_instance) { build(factory_name, column_name => after_or_equal_to.yesterday) }
    it do
      expect(factory_instance.valid?).to be_falsey
      expect(factory_instance.errors.messages[column_name].first.include?("#{after_or_equal_to} 以降の日付にしてください。")).to be_truthy
    end
  end

ActiveSupport::DeprecationException:
  DEPRECATION WARNING: Using a :default format for Date#to_s is deprecated. Please use Date#to_fs instead. If you fixed all places inside your application that you see this deprecation, you can set `ENV['RAILS_DISABLE_DEPRECATED_TO_S_CONVERSION']` to `"true"` in the `config/application.rb` file before the `Bundler.require` call to fix all the callers outside of your application. (called from block (3 levels) in <main> at /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/support/validations/validates_date_range.rb:21)
# ./spec/support/validations/validates_date_range.rb:21:in `block (3 levels) in <main>'
# ./spec/support/validations/validates_date_range.rb:9:in `block (2 levels) in <main>'
# ./spec/support/validations/validates_date_range.rb:8:in `each'
# ./spec/support/validations/validates_date_range.rb:8:in `block in <main>'
# ./spec/models/declaration_of_dependent_spec.rb:22:in `block (2 levels) in <main>'
# ./spec/models/declaration_of_dependent_spec.rb:21:in `block in <main>'
# ./spec/models/declaration_of_dependent_spec.rb:3:in `<main>'

An error occurred while loading ./spec/models/declaration_of_employee_spec.rb.
Failure/Error:
  context "when #{after_or_equal_to}" do
    let(:factory_instance) { build(factory_name, column_name => after_or_equal_to.yesterday) }
    it do
      expect(factory_instance.valid?).to be_falsey
      expect(factory_instance.errors.messages[column_name].first.include?("#{after_or_equal_to} 以降の日付にしてください。")).to be_truthy
    end
  end

ActiveSupport::DeprecationException:
  DEPRECATION WARNING: Using a :default format for Date#to_s is deprecated. Please use Date#to_fs instead. If you fixed all places inside your application that you see this deprecation, you can set `ENV['RAILS_DISABLE_DEPRECATED_TO_S_CONVERSION']` to `"true"` in the `config/application.rb` file before the `Bundler.require` call to fix all the callers outside of your application. (called from block (3 levels) in <main> at /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/support/validations/validates_date_range.rb:21)
# ./spec/support/validations/validates_date_range.rb:21:in `block (3 levels) in <main>'
# ./spec/support/validations/validates_date_range.rb:9:in `block (2 levels) in <main>'
# ./spec/support/validations/validates_date_range.rb:8:in `each'
# ./spec/support/validations/validates_date_range.rb:8:in `block in <main>'
# ./spec/models/declaration_of_employee_spec.rb:34:in `block (2 levels) in <main>'
# ./spec/models/declaration_of_employee_spec.rb:33:in `block in <main>'
# ./spec/models/declaration_of_employee_spec.rb:3:in `<main>'

An error occurred while loading ./spec/models/declaration_of_family_spec.rb.
Failure/Error:
  context "when #{after_or_equal_to}" do
    let(:factory_instance) { build(factory_name, column_name => after_or_equal_to.yesterday) }
    it do
      expect(factory_instance.valid?).to be_falsey
      expect(factory_instance.errors.messages[column_name].first.include?("#{after_or_equal_to} 以降の日付にしてください。")).to be_truthy
    end
  end

ActiveSupport::DeprecationException:
  DEPRECATION WARNING: Using a :default format for Date#to_s is deprecated. Please use Date#to_fs instead. If you fixed all places inside your application that you see this deprecation, you can set `ENV['RAILS_DISABLE_DEPRECATED_TO_S_CONVERSION']` to `"true"` in the `config/application.rb` file before the `Bundler.require` call to fix all the callers outside of your application. (called from block (3 levels) in <main> at /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/support/validations/validates_date_range.rb:21)
# ./spec/support/validations/validates_date_range.rb:21:in `block (3 levels) in <main>'
# ./spec/support/validations/validates_date_range.rb:9:in `block (2 levels) in <main>'
# ./spec/support/validations/validates_date_range.rb:8:in `each'
# ./spec/support/validations/validates_date_range.rb:8:in `block in <main>'
# ./spec/models/declaration_of_family_spec.rb:17:in `block (2 levels) in <main>'
# ./spec/models/declaration_of_family_spec.rb:16:in `block in <main>'
# ./spec/models/declaration_of_family_spec.rb:3:in `<main>'
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/models/declaration_of_housing_loan_spec.rb:105: warning: key :deduction_type is duplicated and overwritten on line 105

An error occurred while loading ./spec/models/declaration_of_partner_spec.rb.
Failure/Error:
  context "when #{after_or_equal_to}" do
    let(:factory_instance) { build(factory_name, column_name => after_or_equal_to.yesterday) }
    it do
      expect(factory_instance.valid?).to be_falsey
      expect(factory_instance.errors.messages[column_name].first.include?("#{after_or_equal_to} 以降の日付にしてください。")).to be_truthy
    end
  end

ActiveSupport::DeprecationException:
  DEPRECATION WARNING: Using a :default format for Date#to_s is deprecated. Please use Date#to_fs instead. If you fixed all places inside your application that you see this deprecation, you can set `ENV['RAILS_DISABLE_DEPRECATED_TO_S_CONVERSION']` to `"true"` in the `config/application.rb` file before the `Bundler.require` call to fix all the callers outside of your application. (called from block (3 levels) in <main> at /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/support/validations/validates_date_range.rb:21)
# ./spec/support/validations/validates_date_range.rb:21:in `block (3 levels) in <main>'
# ./spec/support/validations/validates_date_range.rb:9:in `block (2 levels) in <main>'
# ./spec/support/validations/validates_date_range.rb:8:in `each'
# ./spec/support/validations/validates_date_range.rb:8:in `block in <main>'
# ./spec/models/declaration_of_partner_spec.rb:13:in `block (2 levels) in <main>'
# ./spec/models/declaration_of_partner_spec.rb:4:in `block in <main>'
# ./spec/models/declaration_of_partner_spec.rb:3:in `<main>'

An error occurred while loading ./spec/models/declaration_of_previous_employment_withholding_slip_spec.rb.
Failure/Error:
  context "when #{after_or_equal_to}" do
    let(:factory_instance) { build(factory_name, column_name => after_or_equal_to.yesterday) }
    it do
      expect(factory_instance.valid?).to be_falsey
      expect(factory_instance.errors.messages[column_name].first.include?("#{after_or_equal_to} 以降の日付にしてください。")).to be_truthy
    end
  end

ActiveSupport::DeprecationException:
  DEPRECATION WARNING: Using a :default format for Date#to_s is deprecated. Please use Date#to_fs instead. If you fixed all places inside your application that you see this deprecation, you can set `ENV['RAILS_DISABLE_DEPRECATED_TO_S_CONVERSION']` to `"true"` in the `config/application.rb` file before the `Bundler.require` call to fix all the callers outside of your application. (called from block (3 levels) in <main> at /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/support/validations/validates_date_range.rb:21)
# ./spec/support/validations/validates_date_range.rb:21:in `block (3 levels) in <main>'
# ./spec/support/validations/validates_date_range.rb:9:in `block (2 levels) in <main>'
# ./spec/support/validations/validates_date_range.rb:8:in `each'
# ./spec/support/validations/validates_date_range.rb:8:in `block in <main>'
# ./spec/models/declaration_of_previous_employment_withholding_slip_spec.rb:13:in `block (2 levels) in <main>'
# ./spec/models/declaration_of_previous_employment_withholding_slip_spec.rb:4:in `block in <main>'
# ./spec/models/declaration_of_previous_employment_withholding_slip_spec.rb:3:in `<main>'
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/models/eltax/r0502800_spec.rb:198: warning: key :my_number is duplicated and overwritten on line 200

An error occurred while loading ./spec/models/employee_spec.rb.
Failure/Error:
  context "when #{after_or_equal_to}" do
    let(:factory_instance) { build(factory_name, column_name => after_or_equal_to.yesterday) }
    it do
      expect(factory_instance.valid?).to be_falsey
      expect(factory_instance.errors.messages[column_name].first.include?("#{after_or_equal_to} 以降の日付にしてください。")).to be_truthy
    end
  end

ActiveSupport::DeprecationException:
  DEPRECATION WARNING: Using a :default format for Date#to_s is deprecated. Please use Date#to_fs instead. If you fixed all places inside your application that you see this deprecation, you can set `ENV['RAILS_DISABLE_DEPRECATED_TO_S_CONVERSION']` to `"true"` in the `config/application.rb` file before the `Bundler.require` call to fix all the callers outside of your application. (called from block (3 levels) in <main> at /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/support/validations/validates_date_range.rb:21)
# ./spec/support/validations/validates_date_range.rb:21:in `block (3 levels) in <main>'
# ./spec/support/validations/validates_date_range.rb:9:in `block (2 levels) in <main>'
# ./spec/support/validations/validates_date_range.rb:8:in `each'
# ./spec/support/validations/validates_date_range.rb:8:in `block in <main>'
# ./spec/models/employee_spec.rb:138:in `block (2 levels) in <main>'
# ./spec/models/employee_spec.rb:137:in `block in <main>'
# ./spec/models/employee_spec.rb:5:in `<main>'
WARNING: Shared example group 'ZipAbility' has been previously defined at:
  /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/support/models/zip_ability_shared_examples.rb:3
...and you are now defining it at:
  /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/models/concerns/zip_ability.rb:5
The new definition will overwrite the original one.

An error occurred while loading ./spec/models/tax_adjustment_employee_spec.rb.
Failure/Error:
  context "when #{after_or_equal_to}" do
    let(:factory_instance) { build(factory_name, column_name => after_or_equal_to.yesterday) }
    it do
      expect(factory_instance.valid?).to be_falsey
      expect(factory_instance.errors.messages[column_name].first.include?("#{after_or_equal_to} 以降の日付にしてください。")).to be_truthy
    end
  end

ActiveSupport::DeprecationException:
  DEPRECATION WARNING: Using a :default format for Date#to_s is deprecated. Please use Date#to_fs instead. If you fixed all places inside your application that you see this deprecation, you can set `ENV['RAILS_DISABLE_DEPRECATED_TO_S_CONVERSION']` to `"true"` in the `config/application.rb` file before the `Bundler.require` call to fix all the callers outside of your application. (called from block (3 levels) in <main> at /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/support/validations/validates_date_range.rb:21)
# ./spec/support/validations/validates_date_range.rb:21:in `block (3 levels) in <main>'
# ./spec/support/validations/validates_date_range.rb:9:in `block (2 levels) in <main>'
# ./spec/support/validations/validates_date_range.rb:8:in `each'
# ./spec/support/validations/validates_date_range.rb:8:in `block in <main>'
# ./spec/models/tax_adjustment_employee_spec.rb:57:in `block (2 levels) in <main>'
# ./spec/models/tax_adjustment_employee_spec.rb:44:in `block in <main>'
# ./spec/models/tax_adjustment_employee_spec.rb:3:in `<main>'

An error occurred while loading ./spec/models/withholding_slip_total_table_manual_information_spec.rb.
Failure/Error:
  context "when #{after_or_equal_to}" do
    let(:factory_instance) { build(factory_name, column_name => after_or_equal_to.yesterday) }
    it do
      expect(factory_instance.valid?).to be_falsey
      expect(factory_instance.errors.messages[column_name].first.include?("#{after_or_equal_to} 以降の日付にしてください。")).to be_truthy
    end
  end

ActiveSupport::DeprecationException:
  DEPRECATION WARNING: Using a :default format for Date#to_s is deprecated. Please use Date#to_fs instead. If you fixed all places inside your application that you see this deprecation, you can set `ENV['RAILS_DISABLE_DEPRECATED_TO_S_CONVERSION']` to `"true"` in the `config/application.rb` file before the `Bundler.require` call to fix all the callers outside of your application. (called from block (3 levels) in <main> at /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/support/validations/validates_date_range.rb:21)
# ./spec/support/validations/validates_date_range.rb:21:in `block (3 levels) in <main>'
# ./spec/support/validations/validates_date_range.rb:9:in `block (2 levels) in <main>'
# ./spec/support/validations/validates_date_range.rb:8:in `each'
# ./spec/support/validations/validates_date_range.rb:8:in `block in <main>'
# ./spec/models/withholding_slip_total_table_manual_information_spec.rb:64:in `block (2 levels) in <main>'
# ./spec/models/withholding_slip_total_table_manual_information_spec.rb:63:in `block in <main>'
# ./spec/models/withholding_slip_total_table_manual_information_spec.rb:3:in `<main>'
WARNING: Shared example group 'process data' has been previously defined at:
  /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/services/year_end_tax_adjustment/aggregation_payroll_data_service_spec.rb:70
...and you are now defining it at:
  /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/services/year_end_tax_adjustment/aggregation_payroll_data_service_spec.rb:130
The new definition will overwrite the original one.
WARNING: Shared example group 'process data' has been previously defined at:
  /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/services/year_end_tax_adjustment/aggregation_payroll_data_service_spec.rb:130
...and you are now defining it at:
  /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/services/year_end_tax_adjustment/aggregation_payroll_data_service_spec.rb:184
The new definition will overwrite the original one.
WARNING: Shared example group 'process data' has been previously defined at:
  /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/services/year_end_tax_adjustment/aggregation_payroll_data_service_spec.rb:184
...and you are now defining it at:
  /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/services/year_end_tax_adjustment/aggregation_payroll_data_service_spec.rb:246
The new definition will overwrite the original one.
WARNING: Shared example group 'process data' has been previously defined at:
  /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/services/year_end_tax_adjustment/aggregation_payroll_data_service_spec.rb:246
...and you are now defining it at:
  /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/services/year_end_tax_adjustment/aggregation_payroll_data_service_spec.rb:304
The new definition will overwrite the original one.
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/services/year_end_tax_adjustment_employee/auto_calculation_housing_loan_service_spec.rb:520: warning: key :renovation_loan_year_end_balance is duplicated and overwritten on line 521
/Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/spec/services/year_end_tax_adjustment_employee/auto_calculation_housing_loan_service_spec.rb:577: warning: key :renovation_loan_year_end_balance is duplicated and overwritten on line 578

Finished in 0.0002 seconds (files took 38.67 seconds to load)
0 examples, 0 failures, 8 errors occurred outside of examples
```