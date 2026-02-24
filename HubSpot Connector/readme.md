# SCA HubSpot Connector

The **SCA HubSpot Connector** is a secure, "Zero-Trust" Azure Function App that bridges HubSpot CRM and the **Secure Contacts App (SCA)**. It automates the retrieval, encryption, and storage of HubSpot contacts, making them available to SCA users without requiring additional HubSpot licenses.

## Who is it for?
Organizations using HubSpot as a CRM who want to securely extend contact data to SCA users - without compromising on security or compliance.

## Key Value Propositions
* **Cost Efficiency:** Provides access to HubSpot contacts without needing a "Full User" license for every employee.
* **Hardened Security:** Features **AES-256 encryption**, tenant-specific isolation, and a passwordless Azure architecture (Managed Identities).
* **Automated Sync:** Keeps contact data fresh via scheduled or manual triggers.
* **Easy Configuration:** Dynamically generates the SCA AppConfig JSON needed for SCA to access the connector’s encrypted contact export in Azure Blob Storage (MDM-ready).

## High-Level Architecture
1. **Trigger:** Azure Function fires (Timer or HTTP).
2. **Fetch:** Authenticates to HubSpot via Private App Access Token.
3. **Secure:** Encrypted contact data remains protected throughout its lifecycle.
4. **Store:** Uploads encrypted JSON blobs to a private Azure Storage container.
5. **Access:** SCA retrieves and decrypts the data locally on authorized devices.

## Core Requirements
* **Azure Subscription:** Required for Hosting (Function App), Storage, and Secret Management (Key Vault).
* **HubSpot Account:** Required with API access (System Admin or dedicated API User) to establish the Authentication Token Flow.

## Get started in minutes
Provision in Azure, connect to HubSpot, and configure with just a few environment variables. Enjoy peace of mind with robust encryption, centralized secret management, and automated updates.

> For full documentation (including a detailed setup guide), refer to the documentation included in the connector ZIP package.

----

© 2026 Provectus Software GmbH.