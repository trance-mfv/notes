# TAX Onboarding Improvement

## Table of Contents

- [TAX Onboarding Improvement](#tax-onboarding-improvement)
  - [Draft Ideas](#draft-ideas)
    - [Trance](#trance)
    - [Vinnie](#vinnie)
    - [Edgar](#edgar)
	- [Ideas collected from Edgar and Vinnie](#ideas-collected-from-edgar-and-vinnie)
	- [Final Ideas After Discussions with Nas](#final-ideas-after-discussions-with-nas)


## Draft Ideas

### Trance

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

* Implementation/Process
    - Onboarding Buddy: a experienced team member assigned to help the new joiner in the first month or 2 months
    - To help new joiner to get familiar with the system and guide through the steps to work on the first issue in action: 

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

## Vinnie
* Demo:
    - The Onboarding Sharing Sessions are very helpful; however, it is not easy to catch up all information without a real demo. It'd be great if we  can demonstrate the system in action in these sessions.
        -Example: basic steps to use the system: 
            - Using MFID to create a new user, 
            - Using Navis to create a tenant, 

## Edgar
* Document:
    - [Gitflow Process document](https://moneyforwardvietnam.atlassian.net/wiki/spaces/TA/pages/2489221231/GitFlow+Process)
        - Some minor points are missing, e.g. git flow for subtasks
        
* Communication:
    - Slack channels are evolving everyday, so we should have a Confluence page for the public channels (this channel is for xxx, can we use VNese in it or not etc.)

## Ideas collected from Edgar and Vinnie

1. Onboarding Buddy
    Category: Implementation/Process, Teamwork
    Impact on Onboarding: High
    Impact: New joiners may struggle with applying workflows to practical, real-world tasks and need direct assistance and guidance when actively working on issues.
    Idea: Assign each new joiner an experienced team member as an onboarding buddy for 2 months. The buddy's responsibilities will include providing guidance and support when the new joiner is actively working on issues.
    Example: The buddy can guide the new joiner through the steps of understanding the system, a JIRA ticket, creating a branch, committing code, creating a pull request, merging to the target branch, self-test the issue in the test environment, notifying the QA team, and viewing CI/CD results.

2. System Demo
    Category: Knowledge
    Impact on Onboarding: Medium
    Impact: While the Onboarding Sharing Sessions provide valuable information, new joiners may have difficulty fully grasping the concepts without a practical demonstration.
    Idea: Live or video demos to provide a real-world example of the basic steps and functionalities.
    Example: Demonstrate how to use MFID to create a new user and how to use Navis to create a tenant and ect.

3. Slack Channel Guidelines
    Category: Communication
    Impact on Onboarding: Medium
    Impact: New joiners may find it challenging to navigate the Slack channels and understand their purpose and communication norms.
    Idea: Add proper description to Slack channels: like what it is for, who is in here, which language(s) should be use etc.. Create a Confluence page with guidelines for important Slack channels, including their purpose, appropriate language, and any relevant rules or conventions.

4. Seed Data for Development
    Category: Implementation
    Impact on Onboarding: Low
    Impact: New joiners may find it challenging to initialize the system and set up their development environment with the necessary basic data.
    Idea: Create a standardized seed data file or script that new joiners can easily use to populate their development environment with initial data. This will save them time and effort and ensure consistency across setups.
    Example: The seed data could include sample user accounts and other necessary data to get started.

## Final Ideas After Discussions with Nas

1. Onboarding Buddy
    Category: Implementation/Process, Teamwork
    Impact on Onboarding: Medium
    Impact: New joiners may struggle with applying workflows to practical, real-world tasks and need direct assistance and guidance when actively working on issues.
    Idea: onboarding buddy/mentor
        - Assign each new joiner an experienced team member as an onboarding buddy for the first 2 months. The buddy will provide guidance and support when the new joiner is actively working on issues.
        - Time spent on buddy tasks should be tracked since it takes time and efforts.
    Example: The buddy can guide the new joiner through the steps of 
        - understanding the system, 
        - a JIRA ticket, 
        - implementation workflow:  creating a branch, committing code, creating a pull request, merging to the target branch, self-test the issue in the test environment, notifying the QA team, and viewing CI/CD results."

2. System Demo: create Confluence page for basic flows

3. Slack Channel Guidelines
    - #mfv - Vietnam
    - private - devs, free talks
    - #ta_ - TA's public channel, project channels - important
    - `random` - free talks
4. Seed Data for Development: use the app to create a new user and a tenant to practice
5. Confluence - mostly used by MFV, documents created by MFV, TA
