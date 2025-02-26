# TAX Daily Reports

## Daily Reports

2025-02-27
* Yesterday:
	- Meeting: Onboarding Session 3 Sharing
	- Continue exploring the TAXW application: procedure feature
	- Read TA System guide book
* Today:
	-	Meeting: 
		- Onboarding Session 3 Sharing
		- Ruby Seminar: CA Team
	- Fixed the issue with webpacker to run TAXW in Docker container

2025-02-26
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

2025-02-25
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

2025-02-24
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

2025-02-21
* Yesterday: 
	- Completed training courses: 
		- Information Security Orientation 
		- Technical Orientation
	- Setting up local development environment
* Today:
	- Continue exploring the codebase, project structure 

2025-02-20
* Yesterday:
	- Onboarding Session Sharing
	- Meeting: Engineering All Hands
* Today:
	- Training: Information Security and Personal Confidential Information Protection
	- Training: Technical Onboarding

2025-02-19
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
