# TAX Onboarding Improvement

* Standardize the Daily Report format?
* Codebase:
    - seed data for development
    - Dockerize the app: out-of-date
        - Dockerfile-dev: old Nodejs version
        - docker-compose-env.yml: missing MongoDB service, mounting database volumes (e.g. mysql - one colleague has lost his data in container)
    - Gems
        - strong_migrations gem to catch unsafe migrations: https://github.com/ankane/strong_migrations
        - data-migrate gem: https://github.com/ilyakatz/data-migrate
        - Shopify maintenance_tasks gem: https://github.com/Shopify/maintenance_tasks
        - Rails settings: https://www.ruby-toolbox.com/projects/ledermann-rails-settings
    - Code refactoring: 
        - enum?
        - Old code vs new code: 
            - Rails 7.0 practices: { key: }
            - Localization
            - Rails Settings to avoid hard-coded settings

* Code Review sessions
    - To share the knowledge and experience
    - To improve the code quality
    - To reduce the maintenance cost

* Documentation:
    - Some documents are out-of-date: 
        - TAX Infrastructure: https://moneyforwardvietnam.atlassian.net/wiki/spaces/TA/pages/1737719855/TAX+-+Infrastructure

* Demo: 
    - The Onboarding Sharing Sessions are very helpful; however, it is hard to catch up all documents and information. It'd be great if we  can demonstrate the system in action:
        - Example: basic steps to use the system: 
            - Using MFID to create a new user, 
            - Using Navis to create a tenant, 

* Mentor/Code Buddy: 
    - A 1:1 helper in the first month or 2 months
    - To help new joiner to get familiar with steps to work on the first issue in action: 
        - Example: 
            - Understand the JIRA ticket
            - Create a new branch from a specific target branch (e.g. milestone)
            - Commit code
            - Create a PR
            - Ask for a review
            - Merge to the target branch (e.g. milestone, one of the heroku branches)
            - Review the issue in the test environment
            - Notify the QA team
            - View CI/CD result

* 
* 
* 
