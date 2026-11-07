# Factory Zero Trust IAM — Engineering Decisions

## ADR-001: Microsoft Entra ID as Identity Platform

**Status:** Accepted

**Decision:** Use Microsoft Entra ID P2 as the project's primary identity platform.

**Reasoning:**
- Supports enterprise identity management.
- Provides access to Conditional Access and PIM capabilities.
- Integrates with Microsoft Graph for automation.
- Supports identity governance features such as access reviews.

**Trade-off:** Microsoft-specific implementation and licensing dependencies.

---

## ADR-002: PowerShell for IAM Automation

**Status:** Accepted

**Decision:** Use PowerShell 7 for IAM scripts.

**Reasoning:**
- Cross-platform support for macOS and Windows.
- Integration with Microsoft Graph.
- Strong support for repeatable administrative tasks.

**Trade-off:** Scripts require appropriate permissions, validation, and error handling.

---

## ADR-003: Least-Privilege API Access

**Status:** Accepted

**Decision:** Begin Microsoft Graph authentication using only the `User.Read` delegated permission.

**Reasoning:**
- Limits initial permission exposure.
- Supports safe connectivity testing.
- Prevents unnecessary privilege requests during environment setup.

**Trade-off:** Additional operations may require more permissions later.

**Security Principle:** Least Privilege

---

## ADR-004: GitHub for Version Control

**Status:** Accepted

**Decision:** Store code and documentation in a GitHub repository.

**Reasoning:**
- Tracks engineering changes.
- Enables review of implementation history.
- Supports transparent technical documentation.

**Security Requirement:** Never commit secrets, credentials, access tokens, or sensitive identity data.