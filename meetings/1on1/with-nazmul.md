## 2025-04-02
- complex implementation process: multiple test envs (heroku), reset branches, no unique development branch

### Code quality:
- Unit testing: mock is not a good practice, we should use stub instead
- No integration test: we should have integration test for the feature
- Codebase should be improved:
    + old feature that is not being used should be cleaned up
    + deprecation warnings should be fixed; e.g. running `rspec` shows some deprecation warnings
    + method should be named in a way that is easy to understand; e.g. `get_tax_rate` is not a good method name, it should be named like `tax_rate`
    + method should not be too big; it should be split into smaller methods to make it 
        1. easier to test
        2. easier to understand the business logic
        3. easier to maintain
    + database operations should be encapsulated within transactions to ensure data integrity
    + fat models
    + fat controllers: is currently doing business logic, should be in services. callback methods are not used as a good practice.
    + fat services: 
        - should be open for extension and closed for modification.
        - Problem: service object is used for everything; it's not a good practice, e.g. we should use presenter for view layer and representer for data transformation. 
        - single responsibility: a class should have only one responsibility
    => addressing these issues would result in:
        1. simplified unit testing that can prioritize business logic validation rather than merely achieving code coverage metrics.
        2. more maintainable and extensible codebase, leading to enhanced development velocity and team productivity, ultimately accelerating product delivery timelines.
    
- Considerations for data migration: 
    1. Gem `strong_migrations`: https://github.com/Shopify/strong_migrations
    2. Shopify maintenance_tasks gem (https://github.com/Shopify/maintenance_tasks)
        - run migration at a admin site
        - don't need to access to production terminal to run `rails runner`
    3. data-migrate gem (https://github.com/ilyakatz/data-migrate)
        - for data migration

- App Settings with gem:
    - Database cached config: https://github.com/huacnlee/rails-settings-cached, https://www.ruby-toolbox.com/projects/rails-settings-cached
    - Simple YAML config: https://github.com/rubyconfig/config, https://www.ruby-toolbox.com/projects/config
    - Dry-configurable: https://github.com/dry-rb/dry-configurable, https://www.ruby-toolbox.com/projects/dry-configurable

- it's easier to understand the business logic if we can see the code

- Ruby documentation for TAXW:
    - https://www.honeybadger.io/blog/documentation-worklow-rails/
    - https://www.ruby-toolbox.com/projects/rdoc
    - https://www.ruby-toolbox.com/projects/yard

### Meeting:
- Too many meetings:
  - Excessive meetings reduce productive coding time
  - Consider consolidating meetings where possible
  - Implement "no meeting" blocks or days to allow for focused development
  - Evaluate meeting necessity - could some be handled via async communication?
  - Suggestion: implement a meeting budget (hours per week) for the team
  - Time management issues:
    - Preparation time before meetings and decompression time after meetings aren't accounted for
    - Consider adding buffer time between meetings (e.g., 25 or 50 minute around the meeting time)
    
- daily meeting: should we need the % of the work done? because it's not possible to track and daily meeting is not a good place to discuss the work done.
