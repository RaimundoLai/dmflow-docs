# Bot API

## Authorization

Every request needs to include the Authorization header.

Here is a reference for the Postman pre-script.

```
pm.environment.set('secret', 'b60207f4d8abf6dd7bf14ecbb69fbc31031078456dae354fadd4939eda95e54c');
var secret = pm.environment.get('secret');
var body = request.data;
if(body === undefined) {
    body + ':';
}else {
    body = '';
}
var signature = CryptoJS.HmacSHA256(body+'6d7ffe73-e922-4009-9087-606fc42966d0'+':1666164860759:6d7ffe73-e922-4009-9087-606fc42966d1', secret).toString(CryptoJS.enc.Hex);
var map = {'signature':'sha256='+signature, 'clientId':'6d7ffe73-e922-4009-9087-606fc42966d0','timestamp':'1666164860759', 'random':'6d7ffe73-e922-4009-9087-606fc42966d1'};
var words = CryptoJS.enc.Utf8.parse(JSON.stringify(map));
var base64 = CryptoJS.enc.Base64.stringify(words);
pm.environment.set('auth', 'Bearer '+base64);
```
signature, clientId, timestamp, random is required.

The random parameter should be a unique identifier, such as a UUID, to ensure it is only used once within a 15-minute timeframe.

The timestamp parameter is used to limit the request time and should be within 15 minutes of the current timestamp to prevent replay attacks.


## Bot Details

To retrieve the name, description, and time zone of the bot, you can make a GET request to the appropriate endpoint.

GET /_api/v1/bot/info

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

RESPONSE JSON 

```
{
  "rc": 0,
  "data": {
    "id": "12345678",
    "name": "bot",
    "description": "example",
    "locale": "en_US"
  }
}
```

| RESPONSE PATH      | Description
| ------------------ | -------
| rc                 | Response code. 0 => Successful response, non-zero values indicate errors.
| error              | Error message generated when the response code is non-zero.
| data.id            | Bot ID.
| data.name          | Bot name.
| data.description   | Bot description.
| data.locale        | Bot language/locale.

## Bot Conversations

The graphical conversation flow of the bot, including knowledge base and question-answer pairs.

### Flow Conversations

POST /_api/v1/bot/chat

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

REQUEST JSON 

```
{
    "branch": "dev",
    "platform": "messenger",
    "userId": "8840402706055126",
    "type": "text",
    "payload": {
        "query": "weather",
        "type": "text"
    }
}
```

| REQUEST_PATH  | Required	  | Type   | Description
| ------------- | ----------- |-----   | ----
| branch        |   x         | ENUM   | prod, dev. If null, it is prod by default.
| platform      |   v         | STRING | Available options: line, messenger, api, telegram.
| userId        |   v         | STRING | Defined by the caller, can use UUID.
| type          |   v         | ENUM   | event、text、attachment
| scene         |   x         | STRING | The name of the scene. Default is "Main". If specified, it will correspond to the "Return to Main Scene" in the context node. For more details, refer to "Bot Flow".
| payload       |   v         | OBJECT | The message sent to DmFlow.

#### payload

type = text

Text message

```
"payload": {
  "query": "xxx",
  "type": "text"
}
```

| PAYLOAD_PATH  | Required | Type   | Description
| ------------- | -------- | ------ | -----
| query         |   v      | STRING | The question/query.
| type          |   v      | ENUM   | text (currently only supports text)

type = attachment

File message

```
"payload": {
  "url": "xxx",
  "id": "uuid",
  "name": "text.txt"
  "size": 10240,
  "type": "file"
}
```

| PAYLOAD_PATH  |  Required | Type   | Description
| ------------- | ----      | ------ | -----
| url           |   x/v     | STRING | Either the file URL or the file ID.
| id            |   x/v     | STRING | Either the file URL or the file ID.
| name          |   v       | STRING | The name of the file.
| size          |   v       | NUMBER | The file size.

Image message

```
"payload": {
  "url": "xxx",
  "id": "uuid",
  "previewImageUrl": "xxx"
  "type": "image"
}
```

| PAYLOAD_PATH    | Required | Type   | Description
| -------------   | ----     | ------ | -----
| url             |   x/v    | STRING | Either the image URL or the image ID.
| id              |   x/v    | STRING | Either the image URL or the image ID.
| previewImageUrl |   x      | STRING | The thumbnail image URL.

Video message

```
"payload": {
  "url": "xxx",
  "id": "uuid",
  "previewImageUrl": "xxx"
  "type": "video"
}
```

| PAYLOAD_PATH    | Required | Type   | Description
| -------------   | ----     | ------ | -----
| url             |   x/v    | STRING | Either the video URL or the video ID.
| id              |   x/v    | STRING | Either the video URL or the video ID.
| previewImageUrl |   x      | STRING | The thumbnail image URL.

Audio message

```
"payload": {
  "url": "xxx",
  "id": "uuid",
  "duration": 60
  "type": "audio"
}
```

| PAYLOAD_PATH    | Required | Type   | Description
| -------------   | ----     | ------ | -----
| url             |  x/v     | STRING | Either the audio URL or the audio ID.
| id              |  x/v     | STRING | Either the audio URL or the audio ID.
| duration        |   x      | NUMBER | The duration of the audio (in seconds).

type = event

Interrupt event

It interrupts the current context and starts from the specified context. After the specified context is completed, it returns to the current context to continue the process.

```
"payload": {
  "context": "xxx",
  "type": "sleep"
}
```

| PAYLOAD_PATH    | Required | Type   | Description
| -------------   | ----     | ------ | -----
| context         |   v      | STRING | The context to interrupt to.

Ignore event

When called, it does nothing.

```
"payload": {
  "type": "ignore"
}
```

Start event

When called, it clears the current session status and starts over.

```
"payload": {
  "type": "start"
}
```

End event

Similar to the "Start event", but it does not ask the starting node's question again and keeps the sleep status. It should be used in conjunction with the "Wake-up Mode".

```
"payload": {
  "type": "end"
}
```

RESPONSE JSON

```
{
    "rc": 0,
    "data": {
        "replies": [
            "{\"text\":\"The weather is nice today.\"}"
        ],
        "msg_type": "JSON",
        "version_id": "274504579784423095",
        "fallback": false,
        "status": "WAIT"
    }
}
```

| RESPONSE PATH                  | Type   | Description
| ------------------------------ |------- | -------
| rc                             | NUMBER | Response code. 0 => Successful response, non-zero values indicate errors.
| error                          | STRING | Error message generated when the response code is non-zero.
| data.replies                   | ARRAY  | Array of replies/answers.
| data.msg_type                  | ENUM   | Response type: TEXT, IMAGE, AUDIO, VIDEO, EVENT, JSON, FILE. Currently only supports JSON and TEXT.
| data.version_id                | STRING | Current bot version.
| data.fallback                  | BOOLEAN| Whether a fallback occurred.
| data.status                    | ENUM   | WAIT、LISTEN

data.replies

When the platform in the REQUEST is set to a dialogue template, the data.replies in the RESPONSE will output the JSON for that platform.

Assuming the REQUEST platform is set to "api", the response will be as follows:

```
{
    "rc": 0,
    "data": {
        "replies": [
            "The weather is nice today."
        ],
        "msg_type": "TEXT",
        "version_id": "274504579784423095",
        "fallback": false,
        "status": "WAIT"
    }
}
```

data.status

- WAIT: Waiting for user response.
- LISTEN: Only listening without taking action. It should be used with the "Wake-up Mode" in the starting node.

### Q&A Dialogue
POST /_api/v1/bot/faqs/{faqId}

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

REQUEST JSON 

```
{
    "text": "engineer",
    "userId": "12345"
}
```

| REQUEST_PATH  | Required | Type   | Description
| ------------- | ----     |-----   | ----
| text          |   v      | STRING | The question being asked
| userId        |   v      | STRING | Defined by the caller, can use UUID
| bestThreshold |   x      | FLOAT  | 0.1~1 Best answer threshold
| suggThreshold |   x      | FLOAT  | 0.1~1 Suggested answer threshold
| timezone      |   x      | NUMBER | Default 800 -> UTC+08:00

RESPONSE JSON

```
{
    "rc": 0,
    "data": {
        "answer": "[\"job_interview\"]",
        "question": "Interview for Java Engineer",
        "type": "REDIRECT",
        "fallback": false,
        "suggQuestions": [
            {
                "question": "Interview for Node.js Engineer",
                "answer": "[\"interview_nodejs\"]",
                "type": "REDIRECT"
            },
            {
                "question": "Introduction to Node.js Engineer",
                "answer": "[\"describe_nodejs\"]",
                "type": "REDIRECT"
            },
            {
                "question": "Introduction to Angular Engineer",
                "answer": "[\"describe_angular\"]",
                "type": "REDIRECT"
            }
        ]
    }
}
```

| RESPONSE_PATH                       |  Type    | Description
| ------------------------------      | ------   | -------
| rc                                  | NUMBER   | Response code, 0 => successful response, non-zero for errors
| error                               | STRING   | Error message generated when the response code is non-zero
| data.answer                         | STRING   | type = 'REDITECT'=>'["targetContext"]', type=TEXT=>'answer'
| data.type                           | ENUM     | REDIRECT、TEXT
| data.fallback                       | BOOLEAN  | Whether it failed to find a match
| data.suggQuestions                  | ARRAY    | If other answers exceed the suggested answer ratio, they will be displayed

data.type

- REDIRECT => JSONARRAY STRING used for redirecting to other contextual nodes
- TEXT => Plain text answer

data.suggQuestions

| PATH                                |  Type    | Description
| ------------------------------      | ------   | -------
| question                            | STRING   | Question text
| answer                              | STRING   | Answer text
| type                                | ENUM     | REDIRECT、TEXT

## Domain Details

Filter based on the domain opened by the bot.

### Domains
GET /_api/v1/bot/domains?types=faqEnum&types=tableqaEnum

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

| Parameter     | Description
| ------------- | -------
| types         | faqEnum (FAQs), tableqaEnum (Table-QAs), intentEnum (Intents)

RESPONSE JSON
```
{
    "rc": 0,
    "data": {
        "domains": [
            {
                "name": "hire",
                "description": "Interview",
                "id": "267950411136516195",
                "type": "faqEnum"
            },
            {
                "name": "phone",
                "description": "Phone Introduction",
                "id": "271530283370373185",
                "type": "tableqaEnum"
            },
            {
                "name": "car",
                "description": "Car Introduction",
                "id": "263431310541176907",
                "type": "tableqaEnum"
            }
        ]
    }
}
```

| RESPONSE PATH                           | Description
| ------------------------------          | -------
| rc                                      | Response code, 0 => successful response, non-zero for errors
| error                                   | Error message generated when the response code is non-zero
| data.domains[0].name                    | Domain name
| data.domains[0].description             | Domain description
| data.domains[0].id                      | Domain ID
| data.domains[0].type                    | Domain type

### 
FAQ List
GET /_api/v1/bot/faqs

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

RESPONSE JSON
```
{
    "rc": 0,
    "data": {
        "faqs": [
            {
                "name": "hire",
                "description": "Interview",
                "id": "267950411136516195"
            }
        ]
    }
}
```

| RESPONSE PATH                           | Description
| ------------------------------          | -------
| rc                                      | Response code, 0 => successful response, non-zero for errors
| error                                   | Error message generated when the response code is non-zero
| data.faqs[0].name                       | Domain name
| data.faqs[0].description                | Domain description
| data.faqs[0].id                         | Domain ID

### Table-QA List
GET /_api/v1/bot/tableqas

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

RESPONSE JSON
```
{
    "rc": 0,
    "data": {
        "tableqas": [
            {
                "name": "car",
                "description": "Car Introduction",
                "id": "263431310541176907"
            },
            {
                "name": "phone",
                "description": "Phone Introduction",
                "id": "271530283370373185"
            }
        ]
    }
}
```

| RESPONSE PATH                               | Description
| ------------------------------              | -------
| rc                                          | Response code, 0 => successful response, non-zero for errors
| error                                       | Error message generated when the response code is non-zero
| data.tableqas[0].name                       | Domain name
| data.tableqas[0].description                | Domain description
| data.tableqas[0].id                         | Domain ID

## User Details

### Get Users
POST /_api/v1/bot/users

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

REQUEST JSON 

```
{
  "platform": "api",
  "appId": "api:234869230928226718",
  "index": 0,
  "size": 10
}
```

| REQUEST_PATH     | Required| Description
| -------------    | ----    |-------
| platform         |   v     | Platform options: line, messenger, api, telegram
| appId            |   v     | For line and messenger, provide the corresponding appId. For API, use 'api:%s'.format(botId), where botId corresponds to the data.id obtained from /_api/v1/bot/info.
| index            |   v     | Index starting from 0
| size             |   v     | Number of users to retrieve
| systemFields     |   x     | System user properties
| customFields     |   x     | Custom user properties
| includes         |   x     | Included tags
| afterUpdatedTime |   x     | Retrieve users updated after a specific time

systemFields

Example:
```
{
  "platform": "api",
  "appId": "api:234869230928226718",
  "index": 0,
  "size": 10,
  "systemFields" : {
      "username": "xxx"
  }
}
```

| REQUEST_PATH          | Data Type    | Description
| --------------------- | --------     | ----------------------
| systemFields          | OBJECT       | Used to fill in default system properties
| systemFields.username | STRING       | System username

customFields

Example:
```
{
  "platform": "api",
  "appId": "api:234869230928226718",
  "index": 0,
  "size": 10,
  "customFields" : [
      {
	      "key": "username",
	      "op": "eq",
	      "value": "John"
	  }
  ]
}
```

| REQUEST_PATH          | Data Type    | Limit    | Description
| --------------------- | --------     | -------- | ------------
| customFields          | ARRAY        |    10    | Used for custom properties
| customFields[0].key   | STRING       |          | Property key
| customFields[0].op    | STRING       |          | Property comparison: gte (greater than or equal to), lte (less than or equal to), eq (equal to), not_eq (not equal to)
| customFields[0].value | STRING       |          | Property value; convert time to seconds, numbers must match the data type

includes

Example:
```
{
  "platform": "api",
  "appId": "api:234869230928226718",
  "index": 0,
  "size": 10,
  "includes" : [
      "254870170810449954"
  ]
}
```

| REQUEST_PATH          | Data Type    | Limit    | Description
| --------------------- | --------     | -------- | ------------
| includes              | ARRAY        |    10    | Included tag IDs

afterUpdatedTime

| REQUEST_PATH          | Data Type    | Description
| --------------------- | --------     | ------------
| afterUpdatedTime      | Long         | Retrieve users updated after this time (in milliseconds)

RESPONSE JSON 

```
{
  "rc": 0,
  "data": {
    "page": {
      "total": 2,
      "size": 10,
      "index": 0
    },
    "users": [
      {
        "updatedTime": 1665674749,
        "createdTime": 1662800401,
        "hasImage": false,
        "id": "388634744657944592",
        "fields": [
          {
            "constraintType": "datetimeEnum",
            "id": "283615327961481304",
            "value": "1641312000",
            "key": "birthday",
            "desc": "Birthday"
          },
          {
            "constraintType": "stringEnum",
            "id": "478075408797933588",
            "value": "John",
            "key": "username",
            "desc": "Username"
          }
        ],
        "userId": "5610b61ca183abb1a48de8b8955c1627",
        "platform": "@api",
        "enabled": false,
        "username": "John",
        "tags": [
          {
            "id": "254870170810449954"
          },
          {
            "id": "256770248043135038"
          }
        ]
      }
    ]
  }
}
```

| RESPONSE PATH                           | Description
| ------------------------------          | -------
| rc                                      | Response code, 0 => successful response, non-zero for errors
| error                                   | Error message generated when the response code is non-zero
| data.page.total                         | Total number of filtered users
| data.page.index                         | Current page index
| data.page.size                          | Current page size
| data.users[0].image                     | User image (available for line and messenger)
| data.users[0].updateTime                | Update time (in seconds)
| data.users[0].createdTime               | Creation time (in seconds)
| data.users[0].hasImage                  | Indicates if the user has an image (available for line and messenger)
| data.users[0].id                        | User's DmFlow ID
| data.users[0].userId                    | User's platform ID
| data.users[0].platform                  | Platform options: line, messenger, api, telegram
| data.users[0].enabled                   | Indicates if the user is enabled. If the user is blocked on Line, it will be disabled.
| data.users[0].username                  | User's username
| data.users[0]tags                       | User tags
| data.users[0].tags[0].id                | Tag ID
| data.users[0].fields                    | User properties
| data.users[0].fields[0].constraintType  | datetimeEnum (datetime), stringEnum (string), numEnum (number), passwdEnum (password)
| data.users[0].fields[0].id              | Field ID
| data.users[0].fields[0].key             | Field key
| data.users[0].fields[0].value           | User's value for the field
| data.users[0].fields[0].desc            | Field description


### Get User

There are two ways to retrieve user information:


#### 
Method 1: Using the user's generated ID

GET /_api/v1/bot/users/{userId}?platform=messenger&appId=221627843009100

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

| Parameter     | Description
| ------------- | -------
| platform      | Platform options: line, messenger, api, telegram
| appId         | For line and messenger, provide the corresponding appId. For API, use 'api:%s'.format(botId), where botId corresponds to the data.id obtained from /_api/v1/bot/info.

#### Method 2: Using the DmFlow ID

GET /_api/v1/bot/users/_id/{id}

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}


RESPONSE JSON 

```
{
  "rc": 0,
  "data": {
    "image": "{{IMAGE_PROVIDER}}/f15a4a8a28de8519e5502fbf393ed3fd",
    "updatedTime": 1665674749,
    "createdTime": 1662800401,
    "hasImage": true,
    "id": "488634744657944593",
    "fields": [
      {
        "constraintType": "datetimeEnum",
        "id": "283615327961481304",
        "value": "1641312000",
        "key": "birthday",
        "desc": "Birthday"
      },
      {
        "constraintType": "stringEnum",
        "id": "478075408797933588",
        "value": "John",
        "key": "username",
        "desc": "Username"
      }
    ],
    "userId": "5610b60ca183abb1a48de8b8955c1627",
    "platform": "@fbmessenger",
    "enabled": true,
    "username": "John",
    "tags": [
      {
        "lastModifiedTime": 1664382904,
        "count": "2",
        "name": "tag1",
        "id": "254870170810449954",
        "desc": "Tag 1"
      },
      {
        "lastModifiedTime": 1664382875,
        "count": "4",
        "name": "tag2",
        "id": "256770248043135038",
        "desc": "Tag 2"
      }
    ]
  }
}
```

| RESPONSE PATH                  | Description
| ------------------------------ | -------
| rc                             | Response code. 0 => successful response, non-zero for errors
| error                          | Error message generated when the response code is non-zero
| data.image                     | User image (available for line and messenger)
| data.updateTime                | Update time (in seconds)
| data.createdTime               | Creation time (in seconds)
| data.hasImage                  | Indicates if the user has an image (available for line and messenger)
| data.id                        | User's DmFlow ID
| data.userId                    | User's platform ID
| data.platform                  | Platform options: line, messenger, api, telegram
| data.enabled                   | Indicates if the user is enabled. If the user is blocked on Line, it will be disabled.
| data.username                  | User's username
| data.tags                      | User tags
| data.tags[0].lastModifiedTime  | Last modified time for the tag (in seconds)
| data.tags[0].count             | Number of times the tag has been assigned
| data.tags[0].name              | Tag name
| data.tags[0].id                | Tag ID
| data.tags[0].desc              | Tag description
| data.fields                    | User properties
| data.fields[0].constraintType  | datetimeEnum (datetime), stringEnum (string), numEnum (number), passwdEnum (password)
| data.fields[0].id              | Memory Field ID
| data.fields[0].key             | Memory Field key
| data.fields[0].value           | Memory User's value for the field
| data.fields[0].desc            | Memory Field description

### Update User
PATCH /_api/v1/bot/users/{userId}

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

REQUEST JSON

```
{
  "sysFields": {
    "username": "John"
  },
  "platform": "api"
}
```

| Parameter     | Required | Type   | Description
| ------------- | ----     |-----   | -------
| platform      |  v       | ENUM   | Platform options: line, messenger, api, telegram
| sysFields     |  x       | OBJECT | System properties to be updated
| customFields  |  x       | ARRAY  | Custom properties to be updated
| tags          |  x       | ARRAY  | Tags to be assigned

sysFields

| REQUEST_PATH          | Required	  | Type    | Description
| --------------------- | ------      | --------| ----------------------
| sysFields             |    v        | OBJECT  | Used to fill in the default system properties
| sysFields.username    |    x        | STRING  | User's system username
| sysFields.enabled     |    x        | BOOLEAN | Indicates if the user is enabled

Example:

```
{
  "sysFields": {
    "username": "John"
  },
  "platform": "api"
}
```

customFields

| REQUEST_PATH          | Type    | Description
| --------------------- | --------| ----------------------
| customFields          | OBJECT  | Used to fill in the custom properties
| customFields.xxx      | STRING  | ID of the custom field, can be found in "Retrieve Memory Templates"

Example:

```
{
  "customFields": {
    "478075408797933588": "John"
  },
  "platform": "api"
}
```

tags

This will replace all tags assigned to the user.

```
{
  "tags": ["254870170810449954"],
  "platform": "api"
}
```


RESPONSE JSON 

```
{
    "rc": 0,
    "data": {
        "success": true
    }
}
```

| RESPONSE PATH                  | Description
| ------------------------------ | -------
| rc                             | Response code. 0 => successful response, non-zero for errors
| error                          | Error message generated when the response code is non-zero
| data.success                   | Indicates if the modification was successful (true)



## Template Details

Tags and user access data fields within the memory template.

### Tag Query
GET /_api/v1/bot/tags

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}


RESPONSE JSON 

```
{
  "rc": 0,
  "data": {
    "tags": [
      {
        "name": "tag1",
        "description": "Tag 1",
        "id": "254870170810449954"
      },
      {
        "name": "tag2",
        "description": "Tag 2",
        "id": "256770248043135038"
      }
    ]
  }
}
```

| RESPONSE PATH             | Description
| ------------------------- | -------
| rc                        | Response code. 0 => successful response, non-zero for errors
| error                     | Error message generated when the response code is non-zero
| data.tags[0].name         | Tag name
| data.tags[0].description  | Tag description
| data.tags[0].id           | Tag ID

### User Memory Template Query
GET /_api/v1/bot/memories

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

RESPONSE JSON 

```
{
  "rc": 0,
  "data": {
    "userFields": [
      {
        "description": "Username",
        "id": "478075408797933588",
        "type": "stringEnum",
        "key": "username"
      },
      {
        "description": "Birthday",
        "id": "283615327961481304",
        "type": "datetimeEnum",
        "key": "birthday"
      },
      {
        "description": "Password",
        "id": "477723514581819413",
        "type": "passwdEnum",
        "key": "passwd"
      }
    ]
  }
}
```

| RESPONSE PATH                     | Description
| --------------------------------- | --------------------------------
| rc                                | Response code. 0 => successful response, non-zero for errors
| error                             | Error message generated when the response code is non-zero
| data.userFields[0].id             | Memory field ID
| data.userFields[0].description    | Memory field description
| data.userFields[0].key            | Memory field key
| data.userFields[0].type           | Memory field type (stringEnum, numEnum, datetimeEnum, passwdEnum)

## Events

### User Registration Event
POST /_api/v1/bot/event/register


| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

REQUEST JSON 

```
{
  "broad_hash_id": "xxxxxxxxx",
  "platform": "line",
  "userId": "Uxxxxxxxxx"
}
```

| REQUEST_PATH     | Required | Description
| -------------    | ----     |-------
| broad_hash_id    |   v      | Provided by broad (ID)
| platform         |   v      | Platform options: line, messenger, api, telegram
| userId           |   v      | Client user ID

| RESPONSE PATH                     | Description
| --------------------------------- | --------------------------------
| rc                                | Response code. 0 => successful response, non-zero for errors
| error                             | Error message generated when the response code is non-zero
