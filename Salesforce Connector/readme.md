# SCA Salesforce Connector

The **SCA Salesforce Connector** is a secure, "Zero-Trust" Azure Function App that bridges Salesforce CRM and the **Secure Contacts App (SCA)**. It automates the retrieval, encryption, and storage of Salesforce contacts, making them available to SCA users without requiring additional Salesforce licenses.

## Who is it for?
Organizations using Salesforce as a CRM who want to securely extend contact data to SCA users - without compromising on security or compliance.

## Key Value Propositions
* **Cost Efficiency:** Provides access to Salesforce contacts without needing a "Full User" license for every employee.
* **Hardened Security:** Features **AES-256 encryption**, tenant-specific isolation, and a passwordless architecture (OAuth 2.0 JWT & Managed Identities).
* **Automated Sync:** Keeps contact data fresh via scheduled or manual triggers.
* **Easy Configuration:** Dynamically generates the SCA AppConfig JSON needed for SCA to access the connector's encrypted contact export in Azure Blob Storage (MDM-ready).

## High-Level Architecture
1. **Trigger:** Azure Function fires (Timer or HTTP).
2. **Fetch:** Authenticates to Salesforce via Certificate-based JWT.
3. **Secure:** Encrypted contact data remains protected throughout its lifecycle.
4. **Store:** Uploads encrypted JSON blobs to a private Azure Storage container.
5. **Access:** SCA retrieves and decrypts the data locally on authorized devices.

## Core Requirements
* **Azure Subscription:** Required for Hosting (Function App), Storage, and Secret Management (Key Vault).
* **Salesforce Account:** Required with API access (System Admin or dedicated API User) to establish the OAuth 2.0 JWT Bearer Flow.

## Get started in minutes
Provision in Azure, connect to Salesforce, and configure with just a few environment variables. Enjoy peace of mind with robust encryption, centralized secret management, and automated updates.

> For full documentation (including a detailed setup guide), refer to the documentation included in the connector ZIP package.

----

© 2026 Provectus Software GmbH.