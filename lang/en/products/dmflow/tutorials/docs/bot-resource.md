---
title: DMflow Bot Resource Management | DMflow
description: In a conversation flow, resource nodes are used to manage the use of resources and connect to external APIs to facilitate the interaction of business logic.
---

# Bot Resource Management
- Variable Management：In a conversation flow, you can use variables to manage and store parameters required for resources. Variables are used to pass resource parameters or represent return values.
- Resource Management：In a conversation flow, resource nodes are used to manage the use of resources and connect to external APIs to facilitate the interaction of business logic. Resource nodes can perform specific operations such as querying external APIs for data, modifying resource states, accessing external databases, etc. By using resource nodes, you can integrate with external systems within the conversation flow to provide richer and more personalized services. Resource management allows you to effectively utilize existing resources and external services to expand the functionality and capabilities of the conversation system.

## Variable Management

- 1.Name: The name of the variable, usually in English. The name should be descriptive to identify and use the variable within the conversation flow.
- 2.Data Type: Specify the data type of the variable. Available options include:
    - String: Used to store text information.
    - Number: Used to store numerical values.
    - Datetime: Used to store dates and times.
    - Boolean: Used to store true/false values.
    - Object: Used to store complex structured data.
    - Array: Used to store a collection of multiple values.
- 3.Description: Description and explanation of the variable. Provide detailed information to help developers understand the purpose and functionality of the variable.
- 4.Alias (Optional): This is an optional attribute used to provide an alias for the variable, making it easier to understand and identify. For example, if the variable name is "price," you can assign aliases such as "how much" to make it more intuitively understood within the conversation flow.

## Resource Management

- 1.Resource Name: The name of the resource, using English for naming.
- 2.Description: Description and explanation of the resource. Provide detailed information to help developers understand the purpose and functionality of the resource.
- 3.Request URL: The URL for the resource's business logic. Enter the complete URL and ensure that it includes the HTTPS protocol.
- 4.Request Method: Specify the request method for the resource. Currently supports GET, POST, PATCH, PUT, and DELETE methods.
- 5.Content-Type: Specify the content type of the request. Choose between URL encoding or JSON format (application/json).
- 6.Request Header Fields: Fill in the header information for the request, specifying different header types based on different prefixes. Options include Constant, Conversation, Session, User Parameters, or Bot Config.
- 7.Parameters: Fill in the corresponding parameters based on the request's Content-Type. These parameters will be injected into the request. [Extension 2](#extension-2)
- 8.Return Value: Specify the return value for the request. You can specify the JSON path to extract and inject its value into a designated variable. [Extension 3](#extension-3)

### Extension 1
- constant:Can include any text after the prefix without any specific requirements.
- session, user, config, etc.: You can refer to the Memory Template section in the[template](../../tutorials/docs/bot-template.html#memory-template) to learn more.
### Extension 2
Suppose we have a parameter called city, which 'Taipei' represents the city name.
- URL: The parameter can be passed directly as &city=urlEncode(Taipei).
- JSON: The parameter can be passed as {"city":"Taipei"}.

### Extension 3
Suppose the response from the API is {"city":"Taipei"}, and we have a parameter called city that 'Taipei' represents the city name.

In this case, the JSON path would be city, and you can choose the variable city as the target for injecting the value. The injection will be done within the "Resource Node" in the "Conversation Flow".

### JSON Path Tutorial
JSON Path Examples: Suppose the response is {"city":"Taipei", "obj":{"apple":"Apple"}, "order":["Order"]}
- To extract the Taipei, the JSON path would be city.
- To extract the Apple, the JSON path would be obj['apple'].
- To extract the Order, the JSON path would be order[0].

# 接著讀
- [Bot Dialogue Flow](../../tutorials/docs/bot-flow.html)

## Contact Information

Email: <service@dmflow.chat>

DMflow.chat Official website: [DMflow.chat](https://www.dmflow.chat/en/)
(We changed our domain to www.dmflow.chat on 2024-05-18)