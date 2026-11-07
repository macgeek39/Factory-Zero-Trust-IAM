# Factory Zero Trust IAM

**An enterprise-inspired Identity & Access Management engineering portfolio built around Microsoft Entra ID P2, Microsoft Graph, Python, PowerShell, and GitHub.**

> **Project status: Planning / initial build.** This repository documents an evolving hands-on lab. Features below are planned unless a milestone is explicitly marked complete. The company, employees, incidents, and audit data are fictional.

## The Mission

What happens when a manufacturing company needs to securely manage employees, contractors, service accounts, and administrators across multiple facilities and applications?

**Factory Zero Trust IAM** explores that question by designing and building a testable identity security environment—not just a collection of portal screenshots.

The goal is to demonstrate how an IAM engineer can translate business rules into automated access controls, enforce least privilege, and produce evidence that those controls work.

The target scenario models an organization of **1,000 synthetic workforce identities**. Only a small, controlled subset will be created as real test accounts in the Entra lab.

## Project Objectives

- **Identity lifecycle automation:** Model joiner, mover, and leaver events using fictional HR records, role mappings, and Microsoft Graph.
- **Zero Trust security:** Design Conditional Access and risk-aware authentication policies.
- **Privileged Access Management:** Configure time-limited administrator access with Microsoft Entra PIM.
- **Identity Chaos Monkey:** Simulate access-control failures and test detection and remediation.
- **Ghost Hunter:** Analyze service principals, application credentials, and machine identities.
- **Access Time Machine:** Predict access changes and detect separation-of-duties conflicts.
- **Security Control Tower:** Present IAM risks, audit findings, and testing results in a unified dashboard.

## Technology Stack

| Category            | Technology                                   |
| ------------------- | -------------------------------------------- |
| Identity Platform   | Microsoft Entra ID P2                        |
| Identity API        | Microsoft Graph                              |
| Automation          | Python, PowerShell                           |
| Security            | Conditional Access, Identity Protection, PIM |
| Identity Governance | RBAC, supported Access Reviews, custom JML   |
| Development         | GitHub, GitHub Actions                       |
| Visualization       | Streamlit or Grafana (planned)               |
| Analytics           | NetworkX or Neo4j (planned)                  |

## Reference Architecture

The repository's downloadable version includes a GitHub-compatible Mermaid architecture diagram connecting:

**Synthetic HR Data → IAM Orchestration Engine → Microsoft Entra ID → Security Policies → Monitoring and Audit Dashboard**

Detection and remediation components will evaluate access violations and route sensitive changes for human approval.

## Planned Enterprise Scenarios

### 1. Employee Onboarding

A new Quality Assurance technician joins the company.

The system evaluates their HR attributes, determines appropriate access based on their role, provisions required permissions, and records the outcome.

### 2. Employee Department Transfer

An employee moves from Finance to Operations.

The system evaluates the new role, removes obsolete permissions, and checks for conflicts between retained and newly assigned access.

### 3. Contractor Termination

A contractor's assignment expires.

The system detects the expiration, initiates deprovisioning, and checks for downstream access that should have been removed.

### 4. Emergency Privileged Access

A maintenance administrator requires temporary privileged permissions.

PIM manages eligibility, activation requirements, expiration, and audit evidence.

### 5. Identity Security Incident

A simulated identity failure introduces an orphaned account or excessive permissions.

The detection engine identifies the violation, generates evidence, and recommends or initiates approved remediation.

## Project Roadmap

- [ ] **Phase 1:** Lab setup, GitHub repository, architecture documentation, and Microsoft Graph connectivity
- [ ] **Phase 2:** Automated employee onboarding, transfers, offboarding, and RBAC
- [ ] **Phase 3:** Conditional Access, PIM, and identity governance
- [ ] **Phase 4:** Identity Chaos Monkey and failure detection
- [ ] **Phase 5:** Ghost Hunter workload identity security
- [ ] **Phase 6:** Access Time Machine and predictive access analysis
- [ ] **Phase 7:** Unified dashboard, end-to-end tests, documentation, and portfolio demonstration

## Engineering Principles

The implementation will prioritize:

- Least-privilege access and Zero Trust principles
- Automated and repeatable testing
- Idempotent provisioning and deprovisioning
- Secure authentication and credential handling
- Human approval for sensitive remediation
- Auditable access decisions
- Reproducible evidence and honest reporting of test results

## Success Criteria

Completed modules will be evaluated using automated test results, detection coverage, remediation outcomes, permission accuracy, and audit traceability.

Performance and reliability metrics will be reported only after actual tests are conducted.

## Security and Scope

This is a personal educational portfolio lab using fictional enterprise data and an authorized testing environment. It is not a production-certified IAM solution.

Advanced Microsoft Entra Lifecycle Workflows require additional licensing beyond Entra ID P2. Custom lifecycle automation using Microsoft Graph will be developed for this project.

No credentials, private tenant information, or actual employee data will be committed to this repository.

## Project Outcome

The intended result is a working, evidence-backed IAM engineering portfolio demonstrating the complete security engineering lifecycle:

**Requirements → Architecture → Implementation → Verification → Incident Response → Documentation**

*Built to learn how enterprise identity security works—and to prove it through working, testable systems.*
