---
title: DMflow Apply for LINE API | DMflow
description: DMflow integrates with LINE Server through API, enabling the use of chatbots for users.
use_mermaid: true
---

# Applying for LINE API

# Architecture
DMflow integrates with the LINE Server via API to provide a chatbot for users.

``` mermaid
sequenceDiagram
    participant User
    participant LINE SERVER
    participant DMflow

    User->>LINE SERVER: Sends a message
    LINE SERVER->>DMflow: HTTP POST to webhook
    DMflow-->>LINE SERVER: HTTP 200 OK
    Note over DMflow: Process and generate response
    DMflow->>LINE SERVER: Push/Reply message
    LINE SERVER-->>User: Sends the response
```

## LINE Server

LINE provides various services that can be accessed through DMflow for data exchange.

## API

API stands for Application Programming Interface, which allows communication between different software applications.

## Getting Started
First, you need to have a LINE account. Visit [LINE Business ID](https://account.line.biz/login)

![DMflow integrate with LINE](../../../../../../images/en/line-002.png "DMflow integrate with LINE")

### Login with LINE Account
You can use your regular LINE user account to log in.

### Login with Business Account
If you have a business email account, you can apply using that. Provide the account name, email address, company name, and business category (description of your business). After filling in the details, the application will be completed.

## Configuration

If the Messaging API is not enabled, go to Settings -> Messaging API and click on "Enable Messaging API". Enter the service provider name (you can name it as per your business; it can be changed later), and fill in the Privacy Policy URL and Terms of Use URL (optional). Confirm the details and click "OK".

![DMflow integrate with LINE](../../../../../../images/en/line-003.png "DMflow integrate with LINE")

- 1.Channel ID
- 2.Channel Secret
- 3.Fill in the Webhook URL.
- 4.Proceed to LINE Developers for the next steps.

### LINE Developers

Clicking on the LINE Developers link will take you to [LINE Developers](https://developers.line.biz/en/). Follow the steps shown in the screenshots below.

![DMflow integrate with LINE](../../../../../../images/en/line-004.png "DMflow integrate with LINE")

![DMflow integrate with LINE](../../../../../../images/en/line-005.png "DMflow integrate with LINE")

![DMflow integrate with LINE](../../../../../../images/en/line-006.png "DMflow integrate with LINE")

![DMflow integrate with LINE](../../../../../../images/en/line-007.png "DMflow integrate with LINE")

You will obtain the Channel ID, Channel Secret, and Channel Access Token. Fill in the Webhook URL, and you are done.

## Contact Information

Email: <service@dmflow.chat>

DMflow.chat Official website: [DMflow.chat](https://www.dmflow.chat/en/)
(We changed our domain to www.dmflow.chat on 2024-05-18)