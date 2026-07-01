# SCA AAD Cache Connector

The **SCA AAD Cache Connector** is an Azure Function App that bridges Microsoft Graph (Azure AD users) and the **Secure Contacts App (SCA)**. It automates user export, encrypted packaging, and blob storage delivery so SCA can consume prepared contact data without repeatedly querying Graph during each sync.

## Who is it for?
Organizations that use Azure AD and want faster, controlled contact sync delivery for SCA while maintaining strong data-handling practices.

## Key Value Propositions
* **Sync Efficiency:** Reduces repeated Graph paging during downstream sync operations by serving prepared exports from Blob Storage.
* **Security by Design:** Exports are written as encrypted password-protected ZIP files with tenant-specific key derivation context.
* **Flexible Authentication:** Supports both client secret mode and managed identity/default credential mode for Microsoft Graph access.
* **Operational Simplicity:** Supports scheduled and on-demand runs and can generate an SCA helper configuration JSON when enabled.

## High-Level Architecture
1. **Trigger:** Azure Function runs on a timer schedule or HTTP request.
2. **Fetch:** Authenticates to Microsoft Graph using configured credential mode.
3. **Secure:** Transforms user data and writes encrypted ZIP exports.
4. **Store:** Uploads exports to Azure Blob Storage using atomic write behavior.
5. **Access:** SCA retrieves prepared export files from Blob Storage for sync consumption.

## Core Requirements
* **Azure Subscription:** Required for Function App hosting and Blob Storage.
* **Azure Function App (.NET 8 Isolated):** Runs on Windows or Linux host.
* **Microsoft Graph Access:** Requires the documented Graph permission set and admin consent path.
* **Configuration and Secrets:** Environment settings are required; Key Vault references are recommended for sensitive values.

## Get started in minutes
Provision the Function App and Storage Account, configure Graph access and environment settings, then trigger a run by timer or HTTP. The connector will produce encrypted exports that SCA can consume from Blob Storage.

----

© 2026 Provectus Software GmbH.