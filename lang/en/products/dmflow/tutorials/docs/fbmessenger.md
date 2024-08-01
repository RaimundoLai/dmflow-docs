---
title: DMflow Applying for Facebook API | DMflow
description: DMflow integrates with the Facebook server via API to publish the chatbot to Messenger and provide it to users for interaction.
use_mermaid: true
---

# Applying for Facebook API

# Architecture
DMflow integrates with the Facebook server via API to publish the chatbot to Messenger and provide it to users for interaction.

``` mermaid
sequenceDiagram
    participant User
    participant MESSENGER SERVER
    participant DMflow

    User->>MESSENGER SERVER: Sends a message
    MESSENGER SERVER->>DMflow: HTTP POST to webhook
    DMflow-->>MESSENGER SERVER: HTTP 200 OK
    Note over DMflow: Process and generate response
    DMflow->>MESSENGER SERVER: Reply message
    MESSENGER SERVER-->>User: Sends the response
```

## Facebook Server

Facebook provides various services that allow data exchange with DMflow through API to communicate with Facebook's platform.

## API

API stands for Application Programming Interface, which specifies the rules for communication between software applications.

## Getting Started
To begin, you need a Facebook account. The following steps focus on application creation, configuration, and review.

## Application Creation
First, go to the Facebook Developers website and access "Apps"

[Apps](https://developers.facebook.com/apps/)is shown in the image below. Click on "Create App" to proceed.

![DMflow Integration with Messenger](../../../../../../images/en/messenger-001.png "DMflow Integration with Messenger")

Choose the purpose of the application (usually for commercial use) and provide basic information, such as APP Name and App Contact Email. Both can be saved and modified later.

![DMflow Integration with Messenger](../../../../../../images/en/messenger-002.png "DMflow Integration with Messenger")

Once created, as shown in Image 1, click on the newly created application to enter the Dashboard. Go to "Settings" -> "Basic."

![DMflow Integration with Messenger](../../../../../../images/en/messenger-003.png "DMflow Integration with Messenger")

The Application ID is referred to as "APP ID," and the Application Secret is the "APP SECRET."

## Configuration

![DMflow Integration with Messenger](../../../../../../images/en/messenger-004.png "DMflow Integration with Messenger")

Navigate to Products -> Messenger -> Settings to find the "Access Tokens" [PAGE ACCESS TOKEN]. Click on [3]. If you haven't created a Facebook Page, click on [2] to create one.

![DMflow Integration with Messenger](../../../../../../images/en/messenger-006.png "DMflow Integration with Messenger")

Click on [1] to edit "Callback URL" and provide the "Callback URL" and "Verify Token" [you can generate it automatically in DMflow -> Bot -> Publish -> Keys]. Then, click [3] as shown in the image below to enable the required permissions.

![DMflow Integration with Messenger](../../../../../../images/en/messenger-005.png "DMflow Integration with Messenger")

## Review

To allow other users to access the chatbot, you need to publish and review the "pages_messaging" permission under Advanced Access for the Facebook Page.

![](../../../../../../images/en/messenger-007.png)

## Contact Information

Email: <service@dmflow.chat>

DMflow.chat Official website: [DMflow.chat](https://www.dmflow.chat/en/)
(We changed our domain to www.dmflow.chat on 2024-05-18)