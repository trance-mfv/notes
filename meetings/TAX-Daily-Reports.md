# TAX Daily Reports

## Daily Reports

### 2025-03-17
* Last Friday:
	- Meeting: 
		- [TA Dev] Team Sync-up
		- HR Dev. monthly meeting / HRプロダクト開発部月次MTG
		- Sprint Planning 112
		- [TA] Backlog Refinement
	- Tasks: 
		- [TAXW-1502](https://moneyforward.atlassian.net/browse/TAXW-1502) [TAXW-1450] Fix search function based on whether My Number is registered or not

* Today: 
	- Meeting: 
		- TAX: Sprint Planning

### 2025-03-14
* Yesterday:
	- Meeting:
		- TAX: Sprint Review
	- Tasks: 
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect
			- Following up if any issue
		- [TAXW-1502](https://moneyforward.atlassian.net/browse/TAXW-1502) [TAXW-1450] Fix search function based on whether My Number is registered or not
			- Continued work on this

* Today: 
	- Meeting: 
		- [TA Dev] Team Sync-up
		- HR Dev. monthly meeting / HRプロダクト開発部月次MTG
		- Sprint Planning 112
		- [TA] Backlog Refinement
	- Tasks: 
		- [TAXW-1502](https://moneyforward.atlassian.net/browse/TAXW-1502) [TAXW-1450] Fix search function based on whether My Number is registered or not

### 2025-03-13
* Yesterday: 
	- Meeting:
		- [DEV][TAXW-1409] Refactor add employee to YETA discussion
	- Tasks:
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect
			- PR reviewd
		- [TAXW-1502](https://moneyforward.atlassian.net/browse/TAXW-1502) [TAXW-1450] Fix search function based on whether My Number is registered or not
			- Working with the issue

* Today:
	- Meeting:
		- TAX: Sprint Review
	- Tasks: 
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect
			- Following up if any issue
		- [TAXW-1502](https://moneyforward.atlassian.net/browse/TAXW-1502) [TAXW-1450] Fix search function based on whether My Number is registered or not
			- Continue working on this

### 2025-03-12

* Yesterday:
	- Tasks: 
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect
			- Reviewed code and refactor regarding the `municipality_ids` as Reacher's suggestion
			- Discussed with Pat about the edge cases: the possibility when employee's municipality is not (OR is changed during the job) in the list of tax_adjustment.municipality_ids

* Today: 
	- Meeting:
		- [DEV][TAXW-1409] Refactor add employee to YETA discussion
	- Tasks:
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect
			- Following up if any issue
		- [TAXW-1502](https://moneyforward.atlassian.net/browse/TAXW-1450) [TAXW-1450] Fix search function based on whether My Number is registered or not
	- Notes: Impact Analysis - more details in the meeting minutes
		- Devs: No code changes without Jira tickets
		- Impact Analysis is mandatory before any release and should be shared with QA in advance so they understand what to check
		- Types of Impact Analysis:
			- Code/Engineering Impact
			- Business Logic Impact
	- Ref:
		![Metting Minutes](./daily-20250312/meeting-minutes.md)

### 2025-03-11

* Yesterday:
	- Meeting:
		- Review TA2024 Season
		- 1:1 with Charlie
	- Tasks: 
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect
			- Continue working with the recalculation issue. Paired with Reacher to debug the issue
		- [TAXW-1502](https://moneyforward.atlassian.net/browse/TAXW-1450) [TAXW-1450] Fix search function based on whether My Number is registered or not

* Today:
	- Tasks: 
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect
			- Review code and possible edge cases and refactor if needed
			- Discussed with Pat about the edge cases:
				emp 1 => muni = 1 && target => manual value id = 1
				emp 2 => muni = 2 && target => manual value id = 1
				emp 3 => muni = 1 &&target => manual value id = 1

				==> print 2 employees

				---- case 2
				municipality_ids = [1, 3]

				emp 1 => muni = 1 && target => not target => manual value id = 1 ==> nil
				emp 3 => muni = 1 && target

				==> print 3

				---- case 3
				municipality_ids = [1, 3]

				emp 1 => muni = 1 && target => not target => manual value id = 1 ==> nil
				emp 2 => muni = 2 && target => not target => manual value id = 1
				emp 3 => muni = 1 && target

				==> print 2 + 3


		- [TAXW-1502](https://moneyforward.atlassian.net/browse/TAXW-1450) [TAXW-1450] Fix search function based on whether My Number is registered or not

### 2025-03-10

* Last day:
	- Meeting:
		- TAX: Sprint Retrospective:
		- Bi-weekly TA and SRE team meeting
	- Tasks: 
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect
			- Recalculation issue found by Reacher

* Today:
	- Meeting:
		- Review TA2024 Season
			- we had four incidents
			- Development in FY2024:
				- Fixed tax reduction
				- (Beta)Auto reading of insurance certificate
				- Auto calculation of housing loan deduction
				- Navis Linkage Step 1
				- Support tax reform
				- Support Tatsuzin linkage file specification change
				- Support SmartHR linkage file specification change
		- 1:1 with Charlie
	- Tasks: 
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect
			- Continue working with the recalculation issue
		- [TAXW-1502](https://moneyforward.atlassian.net/browse/TAXW-1450) [TAXW-1450] Fix search function based on whether My Number is registered or not

### 2025-03-07
* Yesterday:
	- Tasks: 
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect
* Today:
	- Meeting:
		- TAX: Sprint Retrospective:
			- First sprint, I've received amazing supports from the team, which helped me moving faster
			- Bye to Aaron
		- Bi-weekly TA and SRE team meeting
			- Decrease EC2 instance type: currently t3.large (temporarily increased for a task), to reduce back to t3.medium
			- TA to provide checklist for SRE to check the connections through API calls:
				1. TA calls external service: 
					- MFID, Navis, SmartHR, Money Forward Business
					- Mailing system
				2. other services call TA: Uluru
					- External endpoint
					- Internal endpoint
			- Documents:
				- CloudTransfer domains
		- 3 new Teams: https://docs.google.com/presentation/d/1RKcO62lW-l7OjSQZkvwkQy6gWEHvUYI-929cCRLWfDo/edit#slide=id.g3311ae265ca_0_989

	- Tasks: 
		- [TAXW-1502](https://moneyforward.atlassian.net/browse/TAXW-1450) [TAXW-1450] Fix search function based on whether My Number is registered or not
			- Issue found by Reacher: after updating the eligibility to ta_employees, specialists have to recalculate Report to make the export pdf correct

### 2025-03-06
* Yesterday:
	- Meeting:
		- MFV Monthly All-hands
	- Tasks: 
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect
* Today:
	- Tasks: 
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect
			- Review specs
			- Update PR

### 2025-03-05
* Yesterday:
	- Meeting: 
		- MFV Monthly All-hands
	- Tasks: 
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect
* Today:
	- Meeting:
		- MFV Monthly All-hands
	- Tasks: 
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect

### 2025-03-04
* Yesterday:
	- Meeting: 
		- Backlog Refinement Sprint 111
		- Bi-weekly MFG All-hands Video
		- Auto reading sharing
	- Tasks: 
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect

* Today:
	- Meeting: 
		- MFV Monthly All-hands
	- Tasks: 
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect

### 2025-03-04
* Last Day:
	- Meeting: Sprint Planning
	- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect

* Today:
	- Meeting: 
		- - Backlog Refinement Sprint 111
		- Bi-weekly MFG All-hands Video
		- Auto reading sharing

### 2025-03-03
* Yesterday:
	- Meeting: 
		- Tech Seminar (Bi-Monthly)
	- Continue exploring the TAXW application and infra
* Today:
	- Meeting: Sprint Planning
	- Tickets:
		- [TAXW-1450](https://moneyforward.atlassian.net/browse/TAXW-1450) Fix search function based on whether My Number is registered or not
		- [TAXW-1500](https://moneyforward.atlassian.net/browse/TAXW-1500) Export payment_report_total_tables, the number of PDF file report is incorrect
* Tasks:
	- Navis:
		- New Office: https://biz-admin.test.mfw.work/app/tenant_registration/new
		- ERP: 
			- New Business Plan: https://erp-stg1.ebisubook.com/change_erp_contract/new
			- Home: https://erp-stg1.ebisubook.com/home
			- Credit card number: 4111111111111111
	
### 2025-02-28
* Yesterday:
	- Meeting: 
		- TAX: Sprint Review
		- Onboarding Session 4 Sharing
	- Continue exploring the TAXW application
	- Continue reading TAX Infrastructure document:
		- SRE Team is moving ECS to EKS for all services of the company
		- TAX services will be migrated to EKS in the future
* Today:
	- Meeting: 
		- Onboarding Session 5 Sharing
			- Questions: 
				- Infrastructure of TAX: ECS Cluster (Subnet Group private), mongoDB missing in the architecture diagram
				- applying SOLID principle? i18n?
				- DB: use enum attributes?
			- sonarqube: 
				- code smells, code coverage tool => c0 >= 90%
			- Feature Flag:
				- Tools: flagd (openfeature)
			- TAX Infrastructure:　https://moneyforward.kibe.la/notes/199474 
				- MFV plan: moving to service platform (K8s)
				- AWS Infrastructure: https://aws.amazon.com/containers/
					- Region: Tokyo (ap-northeast-1)
					- Elastic Container Registry (ECR)
					- Elastic Container Service (ECS) hosted on Fargate
					- AWS Fargate: a serverless compute engine for containers that works with both Amazon Elastic Container Service (ECS) and Amazon Elastic Kubernetes (EKS)
					- CloudFront
					- RDS: Aurora MySQL Cluster
					- ElastiCache Redis
				- CircleCI
				- Heroku
				- Virtual Private Cloud (VPC)
					- region: Tokyo
					- AZ: 3
					- subnets: 3 public, 3 private
					- NAT Gateways: We have NAT for 3 availability zones
					- Internet Gateway: communication between VPC and the internet
				- Application Load Balancer (ALB)
				- SSH/Tunnel:
					- SSH access via port 22
					- to connect to production database and container debugging
					- For staging: directly SSH from local to AWS via the Bastion host.
					- For production: use PWS to join MFJ network before accessing the Bastion host. 

			- Lead time tracking and monitoring:
				- Lead time: time from first commit to merge PR
				- Time to merge: time from create PR to merge PR
				- Time to deploy: time from merge PR to deploy to production

			```
			|------------- lead time -------------|
			|               |--- time to merge ---|
			---------------------------------------
			^               ^                     ^
			first commit    create PR          merge PR
			```

		- TAX: Sprint Retrospective
		- [TA] Backlog Refinement
		- Tech Seminar (Bi-Monthly)
	- Continue exploring the TAXW application

### 2025-02-27
* Yesterday:
	- Meeting: 
		- Onboarding Session 3 Sharing
		- Ruby Seminar: CA Team
	- Continue exploring the TAXW application: procedure feature
	- Fixed the issue with webpacker to run TAXW in Docker container
	- Read TA System guide book
* Today:
	- Meeting: 
		- TAX: Sprint Review
		- Onboarding Session 4 Sharing
	- Continue exploring the TAXW application
	- Continue reading TA System guide book

### 2025-02-26
* Yesterday:
	- Granted access to Jira, Rollbar.
	- Meeting: 
		- Onboarding session 2 sharing
		- MFBC Monthly All-Hands
	- Development environment setup: running tax_adjustment_web in Docker container
		- issue: webpacker
	- Tested the local TAXW app and its features, e.g. create a new group and create a new employee
	- Read TA documents:
		* Tax Adjustment Introduction: https://docs.google.com/document/d/1O1lBP7_qzlpG47l0CDX4EPUn81p-fvuYCqYsc0yVFNk/edit?tab=t.0#heading=h.ng8d1pecyn9
* Today:
	- Meeting: Onboarding Session 3 Sharing
		+ tax_adjustment_web 
			- Dockerfile-dev: to update node_12 to node_14
			```
			RUN echo "deb https://deb.nodesource.com/node_14.x/
			```
		+ tax_adjustment_web 
			- docker-compose-env.yml: missing mongodb service
			```
			  mongo:
				image: mongo:latest
				ports:
					- "27019:27017"
						networks:
							- traefik
			```
		- Webpacker has been retired following the release of Rails 7.0: https://github.com/rails/webpacker
			- With Rails 7, we're replacing Webpacker, Turbolinks, UJS with import maps plus Turbo and Stimulus from Hotwire as the defaults: https://world.hey.com/dhh/rails-7-will-have-three-great-answers-to-javascript-in-2021-8d68191b
		? work with a colleague on a task to get familiar with the codebase, business logic and workflow
	- Continue exploring the TAXW application: procedure feature
	- Read TA System guide book

### 2025-02-25
* Yesterday:
	- Training: Onboarding Handbook - Chapter 3
		- Money Forward Business Company Video & Slide
	- Catchup Onboarding Items:
		* Dev Environments:
			* Heroku Endpoints:
				* Deploy: https://dashboard.heroku.com/apps/tax-milestone-dependabot/deploy/github ==> DONE
				x Upgrade Ruby Rails Nodejs: https://upgrade-ruby-rails-nodejs.herokuapp.com/ ==> Cannot access
				? Dependabot: https://tax-milestone-dependabot.herokuapp.com/home ==> ACCESS with ERROR
					Error message:
						* Phoenix 2 	1587-2295 
						* The selected provider is not available. Please contact your authorized administrator or person in charge.
			? Diagnosis: https://diagnosis.tax-adjustment.test.mfw.work ==> ACCESS with ERROR
				Error message:
					* Phoenix 2 	1587-2295 
					* The selected provider is not available. Please contact your authorized administrator or person in charge.
			* Next Release: https://tax-adjustment-next-release.herokuapp.com/ ==> DONE
			* Dev: https://tax-adjustment-web-dev.herokuapp.com/home
			* Staging: https://tax-adjustment.test.mfw.work ==> DONE
			* Production: https://tax-adjustment.moneyforward.com/
			* CircleCI: https://app.circleci.com/pipelines/github/moneyforward/tax_adjustment_web?branch=master ==> DONE
			* Figma: https://www.figma.com/design/uYfC3l77g2hNJExD9yYcNq/%5BTA%5DFY24_Design?node-id=7429-38963&t=1e23OIQUT40YAWQQ-0 ==> DONE
			* Rollbar Account: 
				* Request > DONE > Waiting for approval
	- Development environment setup: running tax_adjustment_web in local machine

* Today:
	- Meeting: Onboarding session 2 sharing
		- BA - external service 
		- SmartHR - external service: Import employee data from SmartHR
		- Employee master
		- YETA (year end tax adjustment): procedure 
			- Create YETA
			- Statuses: Not requested, Requested, Submitted, Withdrawn, Not Finalized
	- Development environment setup: running tax_adjustment_web in Docker container
	- Read TA documents:
		* Accelerator document
		* PMO document
		* Product Overview document: Reacher will introduce...

### 2025-02-24
* Yesterday:
	- Exploring the project structure
	- Setting up local development environment with Docker
* Today:
	- Continue exploring the codebase, project structure 
	- Continue setting up local development environment
	- Onboarding session 2 sharing
	- Onboarding Handbook - Chapter 3
* Blocker:
	- Access to resources: 
		- Jira => Nas will help to request permission
	- docker-compose.yml
		- Service ./bin/webpack-dev-server is not defined => how to run with Docker container?
	- bin/rails s 
		- seed data? Jeff helped Vinne but still need more seed data to run
		- foreman: why not used to run with Procfile
* References:
	- puma-dev with MFID: https://moneyforwardvietnam.atlassian.net/wiki/spaces/TA/pages/2437513217/Using+puma-dev+with+MFID+staging+on+local
	- Docker Desktop alternatives for M1 Mac: https://alex-moss.medium.com/docker-desktop-alternatives-for-m1-mac-918a2dcda10
	- Colima - container runtime for macOS: https://github.com/abiosoft/colima
	- NotebookLM: https://notebooklm.google.com/notebook/74096525-707c-44ae-889e-696d12a0385a?original_referer=https:%2F%2Fwww.google.com%23&pli=1
	- Gemini: https://gemini.google.com/app/655c6104fd094c22

### 2025-02-21
* Yesterday: 
	- Completed training courses: 
		- Information Security Orientation 
		- Technical Orientation
	- Setting up local development environment
* Today:
	- Continue exploring the codebase, project structure 

### 2025-02-20
* Yesterday:
	- Onboarding Session Sharing
	- Meeting: Engineering All Hands
* Today:
	- Training: Information Security and Personal Confidential Information Protection
	- Training: Technical Onboarding

### 2025-02-19
* Today: 
	- Onboarding Session Sharing
	- Meeting: Engineering All Hands

## Previous Daily Reports

| Date | Yesterday | Today | Blockers |
|------|-----------|-------|----------|
| 2025-02-22 | • Onboarding session 2 sharing | • | |
| 2025-02-21 | • Exploring the project structure<br>• Setting up local development environment with Docker | • Continue exploring the codebase, project structure<br>• Continue setting up local development environment<br>• Onboarding session 2 sharing | • Access to resources:<br>  - Jira => Nas will help to request permission<br>• docker-compose.yml:<br>  - Service ./bin/webpack-dev-server is not defined<br>• bin/rails s:<br>  - seed data? Jeff helped Vinne but still need more seed data to run<br>  - foreman: why not used to run with Procfile |
| 2025-02-20 | • Completed training courses:<br>  - Information Security Orientation<br>  - Technical Orientation<br>• Setting up local development environment | • Continue exploring the codebase, project structure | |
| 2025-02-20 | • Onboarding Session Sharing<br>• Meeting: Engineering All Hands | • Training: Information Security and Personal Confidential Information Protection<br>• Training: Technical Onboarding | |
| 2025-02-19 | | • Onboarding Session Sharing<br>• Meeting: Engineering All Hands | |
