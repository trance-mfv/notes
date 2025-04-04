# DORA and MFBC Summary

## Table of Contents

1. [MFBC Goals for Software Delivery Improvement](#mfbc-goals-for-software-delivery-improvement)
2. [MFBC Define High Developer Productivity](#mfbc-define-high-developer-productivity)
3. [DORA Capabilities](#dora-capabilities)
   - [Technical Practices](#technical-practices)
   - [Process](#process)
   - [Cultural](#cultural)
4. [DORA Capabilities Foster Rapid Feedback](#dora-capabilities-foster-rapid-feedback)
5. [DORA Capabilities that Enable a Climate for Learning](#what-are-the-dora-capabilities-that-enable-a-climate-for-learning)
6. [DORA | Capabilities](#dora--capabilities)
   - [Capabilities that Enable a Climate for Learning](#1-capabilities-that-enable-a-climate-for-learning)
   - [Capabilities that Enable Fast Flow](#2-capabilities-that-enable-fast-flow)
   - [Capabilities that Enable Fast Feedback](#3-capabilities-that-enable-fast-feedback)
7. [Defined Start and End Points for Development Lead Time](#what-are-the-defined-start-and-end-points-for-development-lead-time)
8. [Purpose of Lead Time Visualization](#what-is-the-purpose-of-lead-time-visualization)

# MFBC
## MFBC Goals for software delivery improvement
Based on the "MFBC Development Productivity Improvement's Project Plan", MFBC has several key goals for software delivery improvement:

*   **All product teams at MFBC should be able to measure "Software Delivery (Four Keys)."** This includes Deployment Frequency, Lead Time for Changes, Change Failure Rate, and Time to Restore Service. The meeting transcript also mentions the introduction of FindyTeam+ for DevOps analysis (Four Keys) measurement in each product team.

*   **All product teams at MFBC should analyze Software Delivery metrics, select and improve the capabilities to focus on, and as a result, improve Software Delivery metrics.** This involves understanding the DORA capabilities [18, 20, 52, FindyTeam+ document] and choosing one or two to focus on for improvement.

*   **More than 80% of product teams at MFBC should show improved Software Delivery metrics at the end of the term compared to the start (average value of the first month).** This goal emphasizes tangible improvement in the measured metrics as a result of the improvement activities.

*   **The MFBC-CTO office should aggregate and systematize the results of improvement activities and Software Delivery metrics from each product team to establish a continuous improvement cycle as an organization.** This highlights the organizational-level goal of learning and improving collectively based on the data gathered from individual teams.

It is important to note that the goal is **not to forcibly increase performance metrics**. The measurement results are intended to **enhance the quality of improvement activities** by observing overall trends, not to force specific numerical achievements on each team. The underlying principle is that performance will improve as a natural consequence of each team's focused improvement activities on relevant DORA capabilities.

Furthermore, the meeting transcript indicates that the broader aim of this initiative is to **visualize and improve some of the characteristics of the project** by implementing the DORA core model. This aligns with the goals of measuring software delivery performance and improving capabilities.

## MFBC define high developer productivity
According to the "MFBC Development Productivity Improvement's Project Plan", **MFBC defines a team with high Developer Productivity as one that has improved capabilities according to the DORA Core Model, enhanced team performance, and can deliver the maximum outcomes**.

The document further elaborates on this definition by stating that MFBC will utilize the DORA Core Model to monitor and improve productivity across the organization to enhance Developer Productivity. The initial focus will be on measuring and analyzing **Software Delivery (Four Keys) performance** (Deployment Frequency, Lead Time for Changes, Change Failure Rate, and Time to Restore Service) and improving capabilities. Ultimately, this aims to enhance overall organizational performance, including reliability, and improve well-being and business outcomes.

Therefore, MFBC's definition of high developer productivity is multifaceted, encompassing:

*   **Improved capabilities according to the DORA Core Model:** This implies a focus on implementing and improving the technical, process, and cultural capabilities identified by DORA [17, 52, dora.dev, FindyTeam+ document]. Our conversation history and the provided links detail these capabilities.
*   **Enhanced team performance:** This suggests improvements in the metrics related to software delivery, as MFBC will be monitoring the Four Keys.
*   **Delivery of maximum outcomes:** This indicates a broader goal of achieving better business results, improved reliability, and enhanced well-being, which are seen as consequences of improved developer productivity.

It's important to note that the goal is not to forcibly increase performance metrics but rather to enhance the quality of improvement activities by observing overall trends as a result of each team's improvement efforts.

# DORA
## DORA | Capabilities
The "DORA | Capabilities" source provides a catalog of practices and capabilities identified by the DORA (DevOps Research and Assessment) program, which is run by Google Cloud. These capabilities are designed to foster a **learning environment, efficient processes, and rapid feedback**, ultimately accelerating software delivery and enhancing overall organizational performance. The source is structured into different sections based on the outcomes these capabilities enable.

Here is a summary of the key categories and capabilities mentioned:

**1. Capabilities that enable a Climate for Learning:** This section focuses on creating an environment where teams and individuals can continuously learn and improve. The core capabilities listed are:

*   **Code maintainability**: Making code easy to find, reuse, change, and keeping dependencies updated.
*   **Documentation quality**: Maintaining accurate, well-organized, and user-centric internal documentation.
*   **Empowering teams to choose tools**: Allowing teams to make informed decisions on tools and technologies to improve software delivery effectiveness.
*   **Generative organizational culture**: Growing a high-trust culture that drives better organizational and software delivery performance.
*   **Job satisfaction**: Ensuring people have the necessary tools and resources and that their skills and abilities are well-utilized.
*   **Learning culture**: Cultivating a culture where learning is prioritized and its impact on organizational performance is understood.
*   **Team experimentation**: Enabling empowered teams to try new ideas without external approval to foster faster innovation.
*   **Transformational leadership**: Effective leaders driving the adoption of technical and product management capabilities to improve software delivery performance.
*   **Well-being**: Focusing on employee happiness and work environment to improve organizational performance and retain talent.

**2. Capabilities that enable Fast Flow:** This section highlights practices that streamline the software delivery process and enable frequent and reliable deployments. The core capabilities include:

*   **Continuous delivery**: Making software deployment a reliable, low-risk process that can be performed on demand.
*   **Database change management**: Ensuring database changes do not cause problems or slow down the process.
*   **Deployment automation**: Utilizing best practices and approaches to automate deployments and reduce manual intervention.
*   **Flexible infrastructure**: Effectively managing cloud infrastructure to achieve higher agility, availability, and cost visibility.
*   **Loosely coupled teams**: Moving towards service-oriented and microservice architectures without a complete re-architecture.
*   **Streamlining change approval**: Replacing heavyweight change-approval processes with peer review for a more reliable and faster release process.
*   **Trunk-based development**: Preventing merge-conflict issues through trunk-based development practices.
*   **Version control**: Implementing the right version control practices for reproducibility and traceability.
*   **Visual management**: Using principles of visual management to promote information sharing and a common understanding of team status.
*   **Work in process limits**: Prioritizing work and limiting the amount of simultaneous tasks to focus on completing high-priority items.
*   **Working in small batches**: Creating shorter lead times and faster feedback loops by working in smaller increments.

**3. Capabilities that enable Fast Feedback:** This section focuses on practices that ensure quick and comprehensive feedback throughout the software development lifecycle. The core capabilities are:

*   **Continuous integration**: Understanding common mistakes, measurement methods, and ways to improve continuous integration efforts.
*   **Customer feedback**: Gathering customer feedback and incorporating it into product and feature design to drive better organizational outcomes.
*   **Monitoring and observability**: Building tooling to understand and debug production systems effectively.
*   **Monitoring systems to inform business decisions**: Improving monitoring across different layers to provide fast feedback to developers.
*   **Pervasive security**: Integrating security into the software development lifecycle without compromising delivery speed.
*   **Proactive failure notification**: Setting up proactive alerts to identify and act on critical issues before they escalate.
*   **Test automation**: Improving software quality by building reliable automated test suites across the delivery lifecycle.
*   **Test data management**: Implementing effective strategies for managing test data and providing fast, secure data access for testing.
*   **Visibility of work in the value stream**: Understanding and visualizing the flow of work from idea to customer outcome to enhance performance.

The source emphasizes that each of these capabilities comes with articles providing implementation guidance and strategies to overcome common challenges. Additionally, a guide titled "How to Transform" is available for deploying a program to implement these capabilities. The "MFBC Development Productivity Improvement's Project Plan" also indicates that MFBC will utilize the DORA Core Model and its capabilities to monitor and improve productivity, with teams expected to analyze their Software Delivery metrics and choose capabilities to focus on for improvement [18, 20, 52, meeting transcript].

## DORA capabilities foster rapid feedback:

*   **Continuous Integration (CI)**: CI efforts involve frequently merging code changes and automatically testing them. This provides developers with quick feedback on the quality and correctness of their code [7, dora.dev (from conversation history)]. Learning about common mistakes, ways to measure, and how to improve CI efforts is crucial for enabling fast feedback.

*   **Customer feedback**: Gathering customer feedback and incorporating it into product and feature design is essential for driving better organizational outcomes. This provides direct feedback on the value and usability of the software being delivered.

*   **Monitoring and observability**: Building tooling to understand and debug production systems allows for the rapid detection and diagnosis of issues. This provides quick feedback on the health and performance of the deployed software.

*   **Monitoring systems to inform business decisions**: Improving monitoring across infrastructure platforms, middleware, and the application tier enables fast feedback to developers, which can also inform business decisions.

*   **Pervasive security**: Building security into the software development lifecycle without compromising delivery speed ensures that security issues are identified and addressed early, providing rapid feedback on potential vulnerabilities.

*   **Proactive failure notification**: Setting up proactive failure notifications helps identify critical issues and enables teams to act on problems before they arise, providing early feedback on potential stability risks.

*   **Test automation**: Building reliable automated test suites and performing all kinds of testing throughout the software delivery lifecycle improves software quality by providing quick feedback on whether new code changes introduce regressions or other issues [9, dora.dev (from conversation history)].

*   **Test data management**: Understanding the right strategies for managing test data effectively and providing fast, secure data access for testing ensures that testing can be done efficiently, leading to faster feedback cycles.

*   **Visibility of work in the value stream**: Understanding and visualizing the flow of work from idea to customer outcome allows for the identification of bottlenecks and areas where feedback loops can be improved to drive higher performance.

## What are the DORA capabilities that enable a climate for learning?
Based on the "DORA | Capabilities" excerpts, the following DORA capabilities enable a climate for learning:

*   **Code maintainability**: This core capability focuses on making it **easy for developers to find, reuse, and change code, and keep dependencies up-to-date**. When code is maintainable, developers can more easily understand and learn from existing codebases, facilitating knowledge sharing and reducing the barrier to making improvements.

*   **Documentation quality**: Maintaining **accurate, well-organized, user-centric internal documentation** is crucial for empowering teams throughout the software development process. High-quality documentation serves as a valuable learning resource, enabling team members to understand systems, processes, and best practices, thereby fostering a climate of continuous learning and knowledge acquisition.

*   **Empowering teams to choose tools**: Allowing teams to make **informed decisions on tools and technologies** drives more effective software delivery. When teams have autonomy in selecting their tools, they are more likely to engage with them deeply, learn their nuances, and find innovative ways to improve their work, contributing to a learning-oriented environment.

*   **Generative organizational culture**: Growing a **generative, high-trust culture drives better organizational and software delivery performance**. A generative culture, characterized by trust, information sharing, and a focus on learning from both successes and failures, is fundamental for creating an environment where individuals and teams feel safe to experiment, learn, and grow.

*   **Job satisfaction**: Ensuring that people **have the tools and resources to do their job, and making good use of their skills and abilities** is important for job satisfaction. When individuals feel supported and their skills are valued, they are more likely to be motivated to learn and improve, contributing to a positive learning climate.

*   **Learning culture**: Growing a **learning culture** and understanding its impact on organizational performance is a core capability. A dedicated focus on fostering learning through various means, such as training, knowledge sharing, and reflection, directly contributes to an environment where learning is prioritized and encouraged.

*   **Team experimentation**: Building **empowered teams that can try out new ideas without approval from people outside the team** fosters innovation. Allowing teams to experiment and learn from the outcomes, both positive and negative, without excessive bureaucracy promotes a culture of exploration and continuous improvement.

*   **Transformational leadership**: Effective leaders influence software delivery performance by **driving the adoption of technical and product management capabilities**. Leaders who champion learning, provide guidance, and support the development of their teams play a critical role in establishing a climate conducive to learning and growth.

*   **Well-being**: A focus on **employee happiness and work environment** can improve organizational performance while helping retain talent. When employees feel well and are in a positive work environment, they are more likely to be engaged, open to learning, and collaborative, all of which contribute to a healthy learning climate.

# Lead Time
## What are the defined start and end points for development lead time?
Based on the "Lead time visualization：Project planning document.pdf" and the discussion in the "dev-sync-250402.txt", the defined start and end points for development lead time are as follows:

**Start of Development Lead Time**:

The development lead time is considered to have started when **one of the following** actions has begun:

*   **Tech design document** creation has started.
*   **Testcases** preparation has started.
*   The **first branch of the project (code push)** has occurred.

**End of Development Lead Time**:

The development lead time is considered to have ended when **all of the following** conditions have been met:

*   A **test-ready environment is set up**.
*   **All test cases are fixed** (bug fixes are included in the test lead time as mentioned in).
*   The system is **ready to deploy** (meaning all testing is finished and no bugs are present). It's noted in the meeting transcript that this signifies readiness to deploy, though the actual deployment timing might vary.

Therefore, the development phase is considered complete when the necessary groundwork (design, test cases, initial code) has started, and it concludes when the environment is ready for thorough testing and all identified issues in the test cases have been resolved, making the software potentially deployable.

## What is the purpose of lead time visualization?
The primary purpose of lead time visualization, as outlined in the "Lead time visualization：Project planning document.pdf", is to **understand the current status of project development** by visualizing the time spent on each stage. This visualization serves as the **first step towards improving productivity** and increasing the speed of delivery to users by identifying areas for improvement.

Here's a more detailed breakdown of the purposes:

*   **Knowing the current status of development**: By visualizing lead time, teams gain insights into how long each process takes, providing a clear picture of the ongoing development efforts.
*   **Identifying problems affecting productivity**: The document explicitly states that one of the backgrounds for this initiative is the difficulty in finding the problems that affect productivity due to a lack of data. Lead time visualization aims to address this by providing data that can highlight bottlenecks and inefficiencies in the development process.
*   **Finding the bottleneck of the development process**: A key purpose is to pinpoint the stages in the development lifecycle where the most time is spent, which are likely the bottlenecks hindering overall productivity.
*   **Improving productivity by solving the bottleneck**: Once bottlenecks are identified through visualization, the next step is to implement strategies to reduce lead time in those areas, ultimately improving overall productivity.
*   **Enabling collaboration with each team by using a standardized measure**: The initiative aims to establish a standardized way to measure lead time, which can facilitate better communication and collaboration among different teams by providing a common understanding of development timelines and potential issues.
*   **Supporting the broader goals of DORA and productivity improvement**: As discussed in the context of the "MFBC Development Productivity Improvement's Project Plan" and our previous conversations, measuring and visualizing metrics like lead time aligns with the objectives of the DORA Core Model to monitor and improve software delivery performance. The meeting transcript also emphasizes that lead time visualization is a component of broader developer productivity initiatives.

In summary, the core purpose of lead time visualization is to gain transparency into the software development process, specifically the duration of each stage, to identify inefficiencies and bottlenecks. This understanding then forms the basis for targeted efforts to improve productivity and accelerate software delivery, aligning with broader organizational goals for enhancing developer productivity through the principles of the DORA Core Model.