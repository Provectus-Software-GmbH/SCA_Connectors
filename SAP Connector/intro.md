# SCA SAP Connector

The **SCA SAP Connector** is a secure, "Zero-Trust" Azure Function App that bridges SAP S/4HANA Cloud and the **Secure Contacts App (SCA)**. It automates the retrieval, encryption, and storage of SAP business partner contacts, making them available to SCA users without requiring additional SAP licenses.

## Who is it for?
Organizations using SAP S/4HANA Cloud as a source of contact data who want to securely extend that data to SCA users without compromising security or compliance.

## Key Value Propositions
* **Cost Efficiency:** Provides access to SAP contact data without needing a SAP license for every employee.
* **Hardened Security:** Features **AES-256 encryption**, tenant-specific isolation, and a passwordless Azure architecture (Managed Identities).
* **Automated Sync:** Keeps contact data fresh via scheduled or manual triggers.
* **Easy Configuration:** Dynamically generates the required AppConfig JSON for MDM deployment.

## High-Level Architecture
1. **Trigger:** Azure Function fires (Timer or HTTP).
2. **Fetch:** Authenticates to SAP via API key.
3. **Secure:** Encrypted contact data remains protected throughout its lifecycle.
4. **Store:** Uploads encrypted JSON blobs to a private Azure Storage container.
5. **Access:** SCA retrieves and decrypts the data locally on authorized devices.

## Core Requirements
* **Azure Subscription:** Required for Hosting (Function App), Storage, and Secret Management (Key Vault).
* **SAP S/4HANA Cloud Account:** Required with API access to establish the authentication token flow.

## Get started in minutes
Provision in Azure, connect to SAP, and configure with just a few environment variables. Enjoy peace of mind with robust encryption, centralized secret management, and automated updates.

----

© 2026 Provectus Software GmbH.