# Briefing Document: Developer Productivity Improvement Initiatives
**Date:** October 26, 2023

**Prepared For:** Interested Parties

**Subject:** Review of Sources on Developer Productivity Improvement Initiatives

## Sources Reviewed:

- **"DORA | Capabilities" (Excerpts):** A catalog of practices and capabilities from the DevOps Research and Assessment (DORA) program aimed at fostering a learning environment, efficient processes, and rapid feedback to accelerate software delivery and enhance organizational performance.
- **"Lead time visualization：Project planning document.pdf" (Excerpts):** A project planning document outlining an initiative to visualize lead time in project development for the HRS product team to identify bottlenecks, improve productivity, and standardize measurement across teams.
- **"MFBC Development Productivity Improvement Project.pdf" (Excerpts):** A project plan detailing MFBC's initiative to utilize the DORA Core Model to monitor and improve developer productivity across the organization, focusing initially on the "Four Keys" metrics and capability improvement.
- **"dev-sync-250402.txt":** A transcript of a development team synchronization meeting discussing the implementation of DORA metrics and lead time visualization within their specific team context.

## Executive Summary:

These sources highlight a concerted effort across different organizations (Google Cloud's DORA program, HRS product team, and MFBC) to understand, measure, and improve developer productivity. The DORA framework, particularly its capabilities and "Four Keys" metrics, serves as a central guiding principle. Key themes include the importance of data-driven decision-making through metrics like lead time and the "Four Keys," the identification and mitigation of bottlenecks in the development process, the cultivation of a learning and high-trust organizational culture, and the empowerment of teams to drive continuous improvement. The practical implementation of these concepts is being explored through projects focused on lead time visualization and the adoption of tools like FindyTeam+ for measuring the "Four Keys."

## Main Themes and Important Ideas/Facts:

### 1. The Importance of the DORA Framework:

- The DORA Core Model is explicitly mentioned as the foundation for MFBC's developer productivity improvement project: "Therefore, MFBC will utilize the DORA Core Model to monitor and improve productivity across the organization to enhance Developer Productivity."
- The "Four Keys" metrics (Deployment Frequency, Lead Time for Changes, Change Failure Rate, and Time to Restore Service) are identified by MFBC as initial monitoring metrics for all product teams.
- The DORA Capabilities are presented as levers for improvement. The "DORA | Capabilities" document categorizes these into:
  - **Capabilities that enable a Climate for Learning:** Examples include "Code maintainability," "Documentation quality," "Empowering teams to choose tools," "Generative organizational culture," "Job satisfaction," "Learning culture," "Team experimentation," "Transformational leadership," and "Well-being."
  - **Capabilities that enable Fast Flow:** Examples include "Continuous delivery," "Deployment automation," "Flexible infrastructure," "Loosely coupled teams," "Streamlining change approval," "Trunk-based development," and "Working in small batches."
  - **Capabilities that enable Fast Feedback:** Examples include "Continuous integration," "Customer feedback," "Monitoring and observability," "Pervasive security," and "Test automation."
- The dev-sync meeting indicates a team within MFBC (potentially under HRS, given the lead time visualization document) is beginning to explore and implement the DORA model, referencing "DORA core model" and its aim to "visualize and improve some of the characteristics of the project."

### 2. Focus on Measuring and Visualizing Lead Time:

- The "Lead time visualization" document explicitly states its purpose: "Lead time visualization is the PJ to visualize the lead time spent on project development. Through visualization, we can know the current status of our development. Next, we will try to decrease the lead time, aim to improve productivity and increase our speed of delivery to users."
- The document provides a clear definition of lead time: "Lead time refers to the days from the start of each process to its completion. If the process includes multiple tasks, the lead time is the number of days between the beginning of one task and the completion of the last task." It also specifies the calculation: "It will be measured 'end date - start date + 1'. It includes waiting days. It excludes holidays."
- The document outlines the processes to be visualized, including "Requirement & design," "development," and "Test lead time," along with specific start and end criteria for each. For example, for "development," the start is when "one of the following has started: Tech design document, Testcases, the 1st branch of the PJ," and the end is "when all of the following has started: a test-ready environment is set up, all test cases are fixed."
- The dev-sync meeting reveals that the team is actively working on how to calculate and store lead time data, with discussions around the "template how to calculate how to where to store the lead visualization." They are looking at examples and recognizing the need for a standardized approach while acknowledging current variations in how different teams track their work.

### 3. Driving Improvement Through Data Analysis and Action:

- MFBC's project plan emphasizes the goal that "All product teams at MFBC should measure their Software Delivery, analyze issues, and establish an improvement cycle, resulting in improved Software Delivery."
- The plan outlines the expectation that teams will "analyze Software Delivery metrics, select and improve the capabilities to focus on, and as a result, improve Software Delivery metrics."
- The dev-sync meeting reflects this intention, with next steps including understanding the FindyTeam+ tool for measuring the "Four Keys" and then selecting "one or 2 capabilities" to focus on for improvement. The expectation is to discuss the "pros and cons" of potential capabilities in the next meeting.

### 4. Utilizing Tools for Measurement and Analysis:

- FindyTeam+ is identified as the tool MFBC product teams should introduce by February 15th to start measuring Software Delivery. The dev-sync meeting includes a discussion on how to access and configure this tool.
- The dev-sync meeting mentions the current use of dashboards (potentially in Jira, as referenced later) by some teams for visibility, but acknowledges that a standardized approach, potentially involving spreadsheets for teams without consistent dashboard data, is currently needed for lead time visualization. The goal is to potentially move towards using dashboards more consistently in the future.

### 5. Fostering a Learning and Collaborative Environment:

- The "DORA | Capabilities" document explicitly highlights the importance of "Capabilities that enable a Climate for Learning" and "Generative organizational culture."
- MFBC's project plan mentions that the goal is "not to forcibly increase performance metrics" but rather to "enhance the quality of improvement activities by observing overall trends." This suggests a focus on learning and systemic improvement over individual performance targets.
- The dev-sync meeting includes the establishment of a "Deep Productivity Guild" and encourages team members to participate and leverage the knowledge of others (e.g., SMB team's experience with FindyTeam+).

### 6. Managing Risks and Scope:

- MFBC's project plan acknowledges the risk of Goodhart's Law ("When metrics are set, manipulation to make those metrics look better tends to occur") and emphasizes the importance of not losing sight of "actual performance" and using the "Four Keys" in conjunction with qualitative information.
- The initial scope of MFBC's project focuses on the "Four Keys" and capabilities, explicitly excluding "Reliability (SLO and availability metrics) and Outcomes (Business Performance, Well-being)" from the initial measurement phase.
- The lead time visualization project specifies its scope to include "Capitalized PJ," "Tech debt PJ / Design debt PJ" within the HRS division.

## Quotes from the Original Sources:

- **DORA | Capabilities:** "Explore the practices and capabilities that foster a learning environment, efficient processes, and rapid feedback, all of which accelerate software delivery and enhance overall organizational performance."
- **Lead time visualization:** "Lead time refers to the days from the start of each process to its completion."
- **MFBC Development Productivity Improvement Project:** "At MFBC, we define a team with high Developer Productivity as one that has improved capabilities according to the DORA Core Model, enhanced team performance, and can deliver the maximum outcomes."
- **dev-sync-250402.txt (Nazmul):** "The one thing I would like to get support about lead time visualization. So if you have a time you can have a look in details about this document lead time visualization You can understand what is actually lead time visualization and how to calculate the lead time."
- **dev-sync-250402.txt (Nazmul):** "So this is one of the project the main target of this project is to implement a DORA core model and the reason considering DORA's core model is We would like to visualize and improve some of the characteristics of the project."
- **dev-sync-250402.txt (Nazmul):** "Let's read those documents and next week let's uh let's have individual opinion which area we'd like to focus as a first step."

## Conclusion:

The provided sources collectively demonstrate a strategic and tactical focus on improving developer productivity through the lens of the DORA framework. Organizations are recognizing the value of measuring key software delivery metrics, understanding the factors that influence these metrics (DORA Capabilities), and fostering a culture of continuous learning and improvement. Projects focused on lead time visualization and the adoption of tools for metric tracking are concrete steps being taken to achieve these goals. The ongoing discussions within development teams highlight the practical considerations and collaborative efforts required to successfully implement these initiatives.