### **Context**

We’ve noticed a recurring challenge during our sprint release process: while the development team is consistently working to close Jira tickets and reduce lead time, not all completed tickets make it into the sprint release. This is largely due to limited QA capacity, which results in only a subset of completed tickets being selected for testing and release.

This gap between development output and QA throughput affects our delivery consistency and makes it harder to plan predictable releases.

### **Questions for QA**

To better understand and align with the QA process, it would be helpful to get more clarity on a few points:

> **Could QA please share the reasoning behind not selecting a ticket for the release, aside from those already part of the product roadmap?**
> **Additionally, what criteria does QA use when selecting tickets during release planning?**

This insight would help the team align expectations, improve planning, and potentially identify ways to support QA more effectively.

---

### **Proposed Solution: Versioning and Git Tagging with a Dedicated QA Branch**

To improve coordination and reduce the delivery gap, I’d like to propose the adoption of a **Git-based QA workflow using versioning, tags, and a dedicated QA branch**. Here's how this could work:

#### **1. Dedicated QA Branch**

* After devs complete their work and merge to `main` or `develop`, selected tickets can be cherry-picked or merged into a QA-specific branch (e.g., `qa/sprint-24`).
* This branch would represent the actual scope that QA plans to test and release for the sprint.

#### **2. Git Tagging and Versioning**

* QA branches can be tagged with clear version labels (e.g., `v1.3.0-qa`) to track exactly what is being tested.
* Once approved, the same version tag (or a release tag) can be used for the production deployment, ensuring consistency between tested code and released code.

#### **3. Benefits**

- **Decouples development and QA pacing**, allowing QA to work on a stable, known scope.

- **Improves transparency**: Everyone knows exactly what’s included in a QA round and eventual release.

- **Reduces communication overhead** between devs and QA over “what’s included and what’s not.”

- **Better audit trail** through Git history and tags, linking code to tested and released versions.

---

### **Next Steps**

If this approach sounds viable, we could:

* Align with QA to define criteria for ticket selection.
* Pilot the Git tagging and QA branch process in an upcoming sprint.
* Optionally automate deployment of QA branches to staging environments via CI/CD.

---

Let me know if you’d like a shorter version or a version formatted for presentation/email.
