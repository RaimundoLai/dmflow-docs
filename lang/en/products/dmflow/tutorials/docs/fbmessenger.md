---
title: DmFlow Applying for Facebook API | DmFlow
description: DmFlow integrates with the Facebook server via API to publish the chatbot to Messenger and provide it to users for interaction.
---

# Applying for Facebook API

# Architecture
DmFlow integrates with the Facebook server via API to publish the chatbot to Messenger and provide it to users for interaction.

``` mermaid
sequenceDiagram
    participant User
    participant MESSENGER SERVER
    participant DmFlow

    User->>MESSENGER SERVER: Sends a message
    MESSENGER SERVER->>DmFlow: HTTP POST to webhook
    DmFlow-->>MESSENGER SERVER: HTTP 200 OK
    Note over DmFlow: Process and generate response
    DmFlow->>MESSENGER SERVER: Reply message
    MESSENGER SERVER-->>User: Sends the response
```

## Facebook Server

Facebook provides various services that allow data exchange with DmFlow through API to communicate with Facebook's platform.

## API

API stands for Application Programming Interface, which specifies the rules for communication between software applications.

## Getting Started
To begin, you need a Facebook account. The following steps focus on application creation, configuration, and review.

## Application Creation
First, go to the Facebook Developers website and access "Apps"

[Apps](https://developers.facebook.com/apps/)is shown in the image below. Click on "Create App" to proceed.

![DmFlow Integration with Messenger](../../../../../../images/en/messenger-001.png "DmFlow Integration with Messenger")

Choose the purpose of the application (usually for commercial use) and provide basic information, such as APP Name and App Contact Email. Both can be saved and modified later.

![DmFlow Integration with Messenger](../../../../../../images/en/messenger-002.png "DmFlow Integration with Messenger")

Once created, as shown in Image 1, click on the newly created application to enter the Dashboard. Go to "Settings" -> "Basic."

![DmFlow Integration with Messenger](../../../../../../images/en/messenger-003.png "DmFlow Integration with Messenger")

The Application ID is referred to as "APP ID," and the Application Secret is the "APP SECRET."

## Configuration

![DmFlow Integration with Messenger](../../../../../../images/en/messenger-004.png "DmFlow Integration with Messenger")

Navigate to Products -> Messenger -> Settings to find the "Access Tokens" [PAGE ACCESS TOKEN]. Click on [3]. If you haven't created a Facebook Page, click on [2] to create one.

![DmFlow Integration with Messenger](../../../../../../images/en/messenger-006.png "DmFlow Integration with Messenger")

Click on [1] to edit "Callback URL" and provide the "Callback URL" and "Verify Token" [you can generate it automatically in DmFlow -> Bot -> Publish -> Keys]. Then, click [3] as shown in the image below to enable the required permissions.

![DmFlow Integration with Messenger](../../../../../../images/en/messenger-005.png "DmFlow Integration with Messenger")

## Review

To allow other users to access the chatbot, you need to publish and review the "pages_messaging" permission under Advanced Access for the Facebook Page.

![](../../../../../../images/en/messenger-007.png)