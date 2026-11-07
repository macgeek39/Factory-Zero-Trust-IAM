# Factory Zero Trust IAM — Architecture

## 1. Project Overview

Factory Zero Trust IAM is a simulated enterprise Identity and Access Management environment designed to demonstrate secure identity lifecycle management, Zero Trust access controls, and IAM automation.

## 2. Technology Stack

- **Identity Provider:** Microsoft Entra ID P2
- **Automation:** PowerShell 7 and Microsoft Graph API
- **Development:** Visual Studio Code on macOS
- **Version Control:** GitHub
- **Security Model:** Zero Trust and least privilege

## 3. Initial Architecture

Development Workstation (macOS)
↓
PowerShell 7
↓
Microsoft Graph API
↓
Microsoft Entra ID

GitHub stores project scripts, documentation, architecture diagrams, and sanitized validation evidence.

## 4. Planned Enterprise Capabilities

- Joiner, Mover, Leaver (JML) automation
- Role-Based Access Control (RBAC)
- Privileged Identity Management (PIM)
- Conditional Access policies
- Access reviews
- IAM audit logging and reporting

These are planned capabilities, not all completed implementations.

## 5. Security Principles

1. Verify explicitly.
2. Enforce least privilege.
3. Assume breach.
4. Minimize standing privileged access.
5. Maintain traceability and auditability.

## 6. Current Implementation

Lab 01 established the initial development environment and verified Microsoft Graph connectivity.

The architecture will expand as subsequent labs are implemented and validated.