---
title: DmFlow 機器人API | DmFlow
description: "API的用途是以程式碼搜尋、修改和刪除DmFlow內部資料。透過API，您可以以程式化的方式與DmFlow資料進行互動，實現無縫整合和自動化的資料管理。提高效率、增強生產力，充分發揮DmFlow內部資料的應用潛力。"
---

# 機器人API

## Authorization

直接進行機器人的"密鑰列表"和領域的"API管理"，顯示密鑰旁邊有個複製直接複製即可。

{{auth}}=Bearer <api token> 

## 機器人詳情

擷取機器人內的名稱、描述以及時區。

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
    "description": "範例",
    "locale": "zh_TW"
  }
}
```

| RESPONSE PATH      | 說明
| ------------------ | -------
| rc                 | 回應碼，0=>回應成功，不等於0為錯誤
| error              | 當回應碼不為0的時候產生的錯誤訊息
| data.id            | 機器人id
| data.name          | 機器人名稱
| data.description   | 機器人描述
| data.locale        | 機器人語系

## 機器人對話

機器人的圖形對話流程，知識庫和問答對的問答。

### 流程對話

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
        "query": "天氣",
        "type": "text"
    }
}
```

| REQUEST_PATH  | 必填  | 型態   | 說明
| ------------- | ----- |-----   | ----
| branch        |   x   | ENUM   | prod、dev，若為null則為prod
| platform      |   v   | STRING | 分為line、messenger、api、telegram、telegram
| userId        |   v   | STRING | 由呼叫方自行定義，可使用uuid
| type          |   v   | ENUM   | event、text、attachment
| scene         |   x   | STRING | 此為填寫場景名稱，預設為Main，當填寫後會根據情境節點中的"回到主情境"對應。詳情請參考"機器人流程"。
| payload       |   v   | OBJECT | 傳給DmFlow的訊息

#### payload

type = text

文字訊息

```
"payload": {
  "query": "xxx",
  "type": "text"
}
```

| PAYLOAD_PATH  | 必填 | 型態   | 說明
| ------------- | ---- | ------ | -----
| query         |   v  | STRING | 詢問的問題
| type          |   v  | ENUM   | text，目前僅提供text

type = attachment

檔案訊息

```
"payload": {
  "url": "xxx",
  "id": "uuid",
  "name": "text.txt"
  "size": 10240,
  "type": "file"
}
```

| PAYLOAD_PATH  | 必填   | 型態   | 說明
| ------------- | ----   | ------ | -----
| url           |   x/v  | STRING | 與id二選一，為檔案連結
| id            |   x/v  | STRING | 與url二選一，為檔案id
| name          |   v    | STRING | 檔案名稱
| size          |   v    | NUMBER | 檔案容量

圖片訊息

```
"payload": {
  "url": "xxx",
  "id": "uuid",
  "previewImageUrl": "xxx"
  "type": "image"
}
```

| PAYLOAD_PATH    | 必填  | 型態   | 說明
| -------------   | ----  | ------ | -----
| url             |   x/v | STRING | 與id二選一，為圖片連結
| id              |   x/v | STRING | 與url二選一，為圖片id
| previewImageUrl |   x   | STRING | 圖片縮圖網址

影片訊息

```
"payload": {
  "url": "xxx",
  "id": "uuid",
  "previewImageUrl": "xxx"
  "type": "video"
}
```

| PAYLOAD_PATH    | 必填   | 型態   | 說明
| -------------   | ----   | ------ | -----
| url             |   x/v  | STRING | 與id二選一，為影片連結
| id              |   x/v  | STRING | 與url二選一，為影片id
| previewImageUrl |   x    | STRING | 影片縮圖網址

語音訊息

```
"payload": {
  "url": "xxx",
  "id": "uuid",
  "duration": 60
  "type": "audio"
}
```

| PAYLOAD_PATH    | 必填  | 型態   | 說明
| -------------   | ----  | ------ | -----
| url             |  x/v  | STRING | 與id二選一，為語音連結
| id              |  x/v  | STRING | 與url二選一，為語音id
| duration        |   x   | NUMBER | 語音持續時間(秒)

type = event

打斷事件

會將當前情境中斷，並從指定情境開始，當指定情境結束後會回來當前情境繼續完成工作。

```
"payload": {
  "context": "xxx",
  "type": "sleep"
}
```

| PAYLOAD_PATH    | 必填 | 型態   | 說明
| -------------   | ---- | ------ | -----
| context         |   v  | STRING | 打斷到指定情境

忽略事件

當呼叫此事件，將不會做任何事情。

```
"payload": {
  "type": "ignore"
}
```

開始事件

當呼叫此事件，將會清空當前session狀態，重新開始。

```
"payload": {
  "type": "start"
}
```

結束事件

當呼叫此事件，同"開始事件"，但是不會再問開始節點的問話，並保持睡眠狀態，需搭配"喚醒模式"使用。

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
            "{\"text\":\"今天天氣舒服\"}"
        ],
        "msg_type": "JSON",
        "version_id": "274504579784423095",
        "fallback": false,
        "status": "WAIT"
    }
}
```

| RESPONSE PATH                  | 型態   | 說明
| ------------------------------ |------- | -------
| rc                             | NUMBER | 回應碼，0=>回應成功，不等於0為錯誤
| error                          | STRING | 當回應碼不為0的時候產生的錯誤訊息
| data.replies                   | ARRAY  | 回答陣列
| data.msg_type                  | ENUM   | 回答型態TEXT、IMAGE、AUDIO、VIDEO、EVENT、JSON、FILE，目前僅提供JSON、TEXT
| data.version_id                | STRING | 當前機器人版本
| data.fallback                  | BOOLEAN| 是否命中失誤
| data.status                    | ENUM   | WAIT、LISTEN

data.replies

當REQUEST的platform使用了對話模板，RESPONSE中的data.replies將會把該平台的JSON做輸出。

假設REQUEST的platform = api 回應如下。

```
{
    "rc": 0,
    "data": {
        "replies": [
            "今天天氣舒服"
        ],
        "msg_type": "TEXT",
        "version_id": "274504579784423095",
        "fallback": false,
        "status": "WAIT"
    }
}
```

data.status

- WAIT 等待用戶回話。
- LISTEN 只做聆聽不做事，需搭配開始節點的"喚醒模式"使用。

### 問答對話
POST /_api/v1/bot/faqs/{faqId}

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

REQUEST JSON 

```
{
    "text": "工程師",
    "userId": "12345"
}
```

| REQUEST_PATH  | 必填 | 型態   | 說明
| ------------- | ---- |-----   | ----
| text          |   v  | STRING | 詢問問題
| userId        |   v  | STRING | 由呼叫方自行定義，可使用uuid
| bestThreshold |   x  | FLOAT  | 0.1~1 最佳選擇答案
| suggThreshold |   x  | FLOAT  | 0.1~1 建議選擇答案
| timezone      |   x  | NUMBER | 預設800->UTC+08:00

RESPONSE JSON

```
{
    "rc": 0,
    "data": {
        "answer": "[\"job_interview\"]",
        "question": "面試JAVA工程師",
        "type": "REDIRECT",
        "fallback": false,
        "suggQuestions": [
            {
                "question": "面試Node.js工程師",
                "answer": "[\"interview_nodejs\"]",
                "type": "REDIRECT"
            },
            {
                "question": "介紹Node.js工程師",
                "answer": "[\"describe_nodejs\"]",
                "type": "REDIRECT"
            },
            {
                "question": "介紹Angular工程師",
                "answer": "[\"describe_angular\"]",
                "type": "REDIRECT"
            }
        ]
    }
}
```

| RESPONSE_PATH                       |  型態    | 說明
| ------------------------------      | ------   | -------
| rc                                  | NUMBER   | 回應碼，0=>回應成功，不等於0為錯誤
| error                               | STRING   | 當回應碼不為0的時候產生的錯誤訊息
| data.answer                         | STRING   | type = 'REDITECT'=>'["targetContext"]', type=TEXT=>'answer'
| data.type                           | ENUM     | REDIRECT、TEXT
| data.fallback                       | BOOLEAN  | 是否未命中
| data.suggQuestions                  | ARRAY    | 當其他答案高於建議選擇答案比率，將會顯示其他答案

data.type

- REDIRECT => JSONARRAT STRING 用於轉向其他情境節點
- TEXT => 純文字回答

data.suggQuestions

| PATH                                |  型態    | 說明
| ------------------------------      | ------   | -------
| question                            | STRING   | 文檔問題
| answer                              | STRING   | 文檔答案
| type                                | ENUM     | REDIRECT、TEXT


### 表格問答對話
POST /_api/v1/bot/tableqas/{tableqaId}

!此回答為範例練習，手機內容不符合真實!

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

REQUEST JSON 

```
{
    "text": "價格在6000元到七千元且品牌為蘋果的手機",
    "userId": "5610b60sa183abb1a49de8b8955c1625",
    "sessionId": "sd6e303ce8e89576dd79afb5d1ab8fc3b",
    "subjectSize": 10
}
```

| REQUEST_PATH  | 必填   | 型態   | 說明
| ------------- | ----   |-----   | ----
| text          |   x/v  | STRING | 詢問問題，event=next時可不填寫
| userId        |   v    | STRING | 由呼叫方自行定義，可使用uuid
| sessionId     |   v    | STRING | 相同sessionId才能進行上下文對答
| subjectSize   |   x    | NUMBER | 預設為10，1-10 顯示數量
| timezone      |   x    | NUMBER | 預設800->UTC+08:00
| reset         |   x    | BOOLEAN| 預設FALSE，為TRUE時會消除session所有資料
| event         |   x/v  | ENUM   | reset(用於消除當前儲存的過濾條件)、next(下一頁，當有page時需要使用此參數)
| page          |   x/v  | OBJECT | 當要跳轉下一頁的時候為必填，且event必須是next
| filterMap     |   x/v  | OBJECT | 過濾條件，event=next時若需要過濾條件則為必填

page

| REQUEST_PATH  | 必填 | 型態   | 說明
| ------------- | ---- |-----   | ----
| index         |   v  | NUMBER | 頁數索引
| size          |   v  | NUMBER | 同 subjectSize

filterMap

此為"價格在6000元到七千元且品牌為蘋果的手機"的詢問

分析:
- 價格大於6000且小於7000
- 品牌等於蘋果 

```
{
  "filterMap": {
    "price": [
      {
        "key": "price",
        "op": "gte",
        "value": "6000"
      },
      {
        "key": "price",
        "op": "lte",
        "value": "7000"
      }
    ],
    "brand": [
      {
        "op": "eq",
        "value": "蘋果",
        "key": "brand"
      }
    ]
  }
}
```

RESPONSE JSON

```
{
    "rc": 0,
    "data": {
        "filterMap": {
            "price": [
                {
                    "op": "gte",
                    "value": "6000.0",
                    "key": "price"
                },
                {
                    "op": "lte",
                    "value": "7000.0",
                    "key": "price"
                }
            ],
            "brand": [
                {
                    "op": "eq",
                    "value": "蘋果",
                    "key": "brand"
                }
            ]
        },
        "answer": "",
        "subjects": [
            {
                "name": "iphone12",
                "attributes": [
                    {
                        "name": "charge",
                        "value": "支持",
                        "render": false
                    },
                    {
                        "name": "price",
                        "value": "iphone12的價格是6900元",
                        "render": false
                    },
                    {
                        "name": "charging",
                        "value": "支持",
                        "render": false
                    },
                    {
                        "name": "battery",
                        "value": "3500",
                        "render": false
                    },
                    {
                        "name": "brand",
                        "value": "蘋果",
                        "render": false
                    },
                    {
                        "name": "ram",
                        "value": "128",
                        "render": false
                    }
                ]
            }
        ],
        "page": {
            "total": 1,
            "size": 10,
            "index": 0
        },
        "fallback": false
    }
}
```

| RESPONSE PATH                           | 說明
| ------------------------------          | -------
| rc                                      | 回應碼，0=>回應成功，不等於0為錯誤
| error                                   | 當回應碼不為0的時候產生的錯誤訊息
| data.filterMap                          | 分析語法過濾條件
| data.answer                             | 當查找不到或未命中時產生的話語
| data.subjects                           | 實體
| data.page                               | 當前頁面
| data.fallback                           | 未命中

data.subjects 

| PATH                                    | 說明
| ------------------------------          | -------
| name                                    | 實體名稱
| attributes                              | 實體屬性

attributes

| PATH                                    | 說明
| ------------------------------          | -------
| name                                    | 欄位鍵
| value                                   | 欄位值

## 領域詳情

根據機器人開啟的領域做過濾。

### 領域
GET /_api/v1/bot/domains?types=faqEnum&types=tableqaEnum

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

| 參數          | 說明
| ------------- | -------
| types         | faqEnum(問答對), tableqaEnum(表格問答), intentEnum(意圖)

RESPONSE JSON
```
{
    "rc": 0,
    "data": {
        "domains": [
            {
                "name": "hire",
                "description": "面試",
                "id": "267950411136516195",
                "type": "faqEnum"
            },
            {
                "name": "phone",
                "description": "手機介紹",
                "id": "271530283370373185",
                "type": "tableqaEnum"
            },
            {
                "name": "car",
                "description": "汽車介紹",
                "id": "263431310541176907",
                "type": "tableqaEnum"
            }
        ]
    }
}
```

| RESPONSE PATH                           | 說明
| ------------------------------          | -------
| rc                                      | 回應碼，0=>回應成功，不等於0為錯誤
| error                                   | 當回應碼不為0的時候產生的錯誤訊息
| data.domains[0].name                    | 領域名稱
| data.domains[0].description             | 領域描述
| data.domains[0].id                      | 領域id
| data.domains[0].type                    | 領域型態

### 問答對列表
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
                "description": "面試",
                "id": "267950411136516195"
            }
        ]
    }
}
```

| RESPONSE PATH                           | 說明
| ------------------------------          | -------
| rc                                      | 回應碼，0=>回應成功，不等於0為錯誤
| error                                   | 當回應碼不為0的時候產生的錯誤訊息
| data.faqs[0].name                       | 領域名稱
| data.faqs[0].description                | 領域描述
| data.faqs[0].id                         | 領域id

### 知識庫列表
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
                "description": "汽車介紹",
                "id": "263431310541176907"
            },
            {
                "name": "phone",
                "description": "手機介紹",
                "id": "271530283370373185"
            }
        ]
    }
}
```

| RESPONSE PATH                               | 說明
| ------------------------------              | -------
| rc                                          | 回應碼，0=>回應成功，不等於0為錯誤
| error                                       | 當回應碼不為0的時候產生的錯誤訊息
| data.tableqas[0].name                       | 領域名稱
| data.tableqas[0].description                | 領域描述
| data.tableqas[0].id                         | 領域id

## 使用者詳情

### 獲取使用者們
POST /_api/v1/bot/users

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

REQUEST JSON 

```
{
  "platform": "api",
  "index": 0,
  "size": 10
}
```

| REQUEST_PATH     | 必填 | 說明
| -------------    | ---- |-------
| platform         |   v  | 分為line、messenger、api、telegram、telegram
| index            |   v  | 索引，以0開始
| size             |   v  | 索取的數量
| systemFields     |   x  | 系統使用者屬性
| customFields     |   x  | 客製使用者屬性
| includes         |   x  | 包含標籤
| afterUpdatedTime |   x  | 更新在某一時間之後

systemFields

範例：
```
{
  "platform": "api",
  "index": 0,
  "size": 10,
  "systemFields" : {
      "username": "xxx"
  }
}
```

| REQUEST_PATH          | 型態    | 說明
| --------------------- | --------| ----------------------
| systemFields          | OBJECT  | 用於填寫預設的系統屬性
| systemFields.username | STRING  | 系統使用者名稱

customFields

範例：
```
{
  "platform": "api",
  "index": 0,
  "size": 10,
  "customFields" : [
      {
	      "key": "username",
	      "op": "eq",
	      "value": "小王"
	  }
  ]
}
```

| REQUEST_PATH          | 型態    | 限制數量 | 說明
| --------------------- | --------| -------- | ------------
| customFields          | ARRAY   |    10    | 用於自定義屬性
| customFields[0].key   | STRING  |          | 屬性鍵
| customFields[0].op    | STRING  |          | 屬性比較gte(大於等於), lte(小於等於), eq(相等), not_eq(不等於)
| customFields[0].value | STRING  |          | 屬性值，時間要轉換成Seconds，數字要滿足數字型態

includes

範例：
```
{
  "platform": "api",
  "index": 0,
  "size": 10,
  "includes" : [
      "254870170810449954"
  ]
}
```

| REQUEST_PATH          | 型態    | 限制數量 | 說明
| --------------------- | --------| -------- | ------------
| includes              | ARRAY   |    10    | 用於自定義標籤id

afterUpdatedTime

| REQUEST_PATH          | 型態    | 說明
| --------------------- | --------| ------------
| afterUpdatedTime      | Long    | 表示過濾這個時間點後的使用者(milliSeconds)

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
            "desc": "生日"
          },
          {
            "constraintType": "stringEnum",
            "id": "478075408797933588",
            "value": "小王",
            "key": "username",
            "desc": "使用者名稱"
          }
        ],
        "userId": "5610b61ca183abb1a48de8b8955c1627",
        "platform": "@api",
        "enabled": false,
        "username": "小王",
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

| RESPONSE PATH                           | 說明
| ------------------------------          | -------
| rc                                      | 回應碼，0=>回應成功，不等於0為錯誤
| error                                   | 當回應碼不為0的時候產生的錯誤訊息
| data.page.total                         | 回傳過濾過的使用者數量
| data.page.index                         | 當前頁數索引
| data.page.size                          | 當前頁面數量
| data.users[0].image                     | 用戶圖片
| data.users[0].updateTime                | 更新日期(秒)
| data.users[0].createdTime               | 創建日期(秒)
| data.users[0].hasImage                  | 是否有圖片，platform為line跟messenger有
| data.users[0].id                        | 使用者DmFlow id
| data.users[0].userId                    | 使用者的platform id
| data.users[0].platform                  | 分為line、messenger、api、telegram
| data.users[0].enabled                   | 是否啟用，如果line被blocked時將會關閉
| data.users[0].username                  | 使用者名稱
| data.users[0]tags                       | 使用者標籤
| data.users[0].tags[0].id                | 標籤id
| data.users[0].fields                    | 使用者屬性
| data.users[0].fields[0].constraintType  | datetimeEnum(日期), stringEnum(字串), numEnum(數字), passwdEnum(密碼)
| data.users[0].fields[0].id              | 記憶欄位id
| data.users[0].fields[0].key             | 記憶欄位鍵
| data.users[0].fields[0].value           | 記憶欄位使用者值
| data.users[0].fields[0].desc            | 記憶欄位描述


### 獲取使用者

第一種userId是客戶產生的ID，第二種查詢是以DmFlow分發的ID做查詢

#### 第一種

GET /_api/v1/bot/users/{userId}?platform=messenger

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

| 參數          | 說明
| ------------- | -------
| platform      | 分為line、messenger、api、telegram

#### 第二種

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
        "desc": "生日"
      },
      {
        "constraintType": "stringEnum",
        "id": "478075408797933588",
        "value": "小王",
        "key": "username",
        "desc": "使用者名稱"
      }
    ],
    "userId": "5610b60ca183abb1a48de8b8955c1627",
    "platform": "@fbmessenger",
    "enabled": true,
    "username": "小王",
    "tags": [
      {
        "lastModifiedTime": 1664382904,
        "count": "2",
        "name": "tag1",
        "id": "254870170810449954",
        "desc": "標籤1"
      },
      {
        "lastModifiedTime": 1664382875,
        "count": "4",
        "name": "tag2",
        "id": "256770248043135038",
        "desc": "標籤2"
      }
    ]
  }
}
```

| RESPONSE PATH                  | 說明
| ------------------------------ | -------
| rc                             | 回應碼，0=>回應成功，不等於0為錯誤
| error                          | 當回應碼不為0的時候產生的錯誤訊息
| data.image                     | 用戶圖片
| data.updateTime                | 更新日期(秒)
| data.createdTime               | 創建日期(秒)
| data.hasImage                  | 是否有圖片，platform為line跟messenger有
| data.id                        | 使用者DmFlow id
| data.userId                    | 使用者的platform id
| data.platform                  | 分為line、messenger、api、telegram
| data.enabled                   | 是否啟用，如果line被blocked時將會關閉
| data.username                  | 使用者名稱
| data.tags                      | 使用者標籤
| data.tags[0].lastModifiedTime  | 標籤最後修改時間(秒)
| data.tags[0].count             | 標籤獲得了幾次
| data.tags[0].name              | 標籤鍵
| data.tags[0].id                | 標籤id
| data.tags[0].desc              | 標籤描述
| data.fields                    | 使用者屬性
| data.fields[0].constraintType  | datetimeEnum(日期), stringEnum(字串), numEnum(數字), passwdEnum(密碼)
| data.fields[0].id              | 記憶欄位id
| data.fields[0].key             | 記憶欄位鍵
| data.fields[0].value           | 記憶欄位使用者值
| data.fields[0].desc            | 記憶欄位描述

### 用戶對話-第一種

GET /_api/v1/bot/users/{userId}/conversations

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

| 參數          | 必填   | 說明
| ------------- | -------|------ 
| platform      |    v   | 分為line、messenger、api、telegram
| size          |    v   | 數量
| page          |    v   | 索引從0開始
| branch        |    x   | 預設prod，分為dev、prod
| from_type     |    x   | 可以過濾該訊息來自哪裡，此為分頁查找完畢才過濾，數量會低於size，分為API, USER, BOT, THIRD_PARTY
| msg_type      |    x   | 可以過濾該訊息類型，此為分頁查找完畢才過濾，數量會低於size，分為text, image, audio, video, json, event, none, html, files, file, redirect

### 用戶對話-第二種

GET /_api/v1/bot/users/_id/{id}/conversations

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

| 參數          | 必填   | 說明
| ------------- | -------|------ 
| size          |    v   | 數量
| page          |    v   | 索引從0開始
| from_type     |    x   | 可以過濾該訊息來自哪裡，此為分頁查找完畢才過濾，數量會低於size，分為API, USER, BOT, THIRD_PARTY
| msg_type      |    x   | 可以過濾該訊息類型，此為分頁查找完畢才過濾，數量會低於size，分為text, image, audio, video, json, event, none, html, files, file, redirect

| RESPONSE PATH                  | 說明
| ------------------------------ | -------
| rc                             | 回應碼，0=>回應成功，不等於0為錯誤
| error                          | 當回應碼不為0的時候產生的錯誤訊息
| data.messages                  | 為陣列
| data.messages[0].from          | from_type
| data.messages[0].type          | msg_type
| data.messages[0].content       | 訊息內容
| data.messages[0].createTime    | 訊息創建時間
| data.total                     | 所有訊息總共有多少
| data.cur_page                  | 當前索引
| data.total_page                | 所有索引共多少
| data.size                      | 當前顯示訊息數量

### 修改使用者
PATCH /_api/v1/bot/users/{userId}

| HEADER KEY    | HEADER VALUE
| ------------- | -------------
| Authorization | {{auth}}

REQUEST JSON

```
{
  "sysFields": {
    "username": "小王"
  },
  "platform": "api"
}
```

| 參數          | 必填 | 型態   | 說明
| ------------- | ---- |-----   | -------
| platform      |  v   | ENUM   | 分為line、messenger、api、telegram
| sysFields     |  x   | OBJECT | 系統屬性
| customFields  |  x   | ARRAY  | 客製屬性
| tags          |  x   | ARRAY  | 標籤選擇

sysFields

| REQUEST_PATH          | 必填  | 型態    | 說明
| --------------------- | ------| --------| ----------------------
| sysFields             |    v  | OBJECT  | 用於填寫預設的系統屬性
| sysFields.username    |    x  | STRING  | 系統使用者名稱
| sysFields.enabled     |    x  | BOOLEAN | 系統使用者是否啟用

範例:

```
{
  "sysFields": {
    "username": "小王"
  },
  "platform": "api"
}
```

customFields

| REQUEST_PATH          | 型態    | 說明
| --------------------- | --------| ----------------------
| customFields          | OBJECT  | 用於填寫客製的屬性
| customFields.xxx      | STRING  | 客製欄位的id，可以在"記憶模板查詢"查找

範例:

```
{
  "customFields": {
    "478075408797933588": "小王"
  },
  "platform": "api"
}
```

tags

將會取代該使用者所有的tags

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

| RESPONSE PATH                  | 說明
| ------------------------------ | -------
| rc                             | 回應碼，0=>回應成功，不等於0為錯誤
| error                          | 當回應碼不為0的時候產生的錯誤訊息
| data.success                   | 為true為成功修改



## 模板詳情

記憶模板內標籤以及使用者存取資料欄位。

### 標籤查詢
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
        "description": "標籤1",
        "id": "254870170810449954"
      },
      {
        "name": "tag2",
        "description": "標籤2",
        "id": "256770248043135038"
      }
    ]
  }
}
```

| RESPONSE PATH             | 說明
| ------------------------- | -------
| rc                        | 回應碼，0=>回應成功，不等於0為錯誤
| error                     | 當回應碼不為0的時候產生的錯誤訊息
| data.tags[0].name         | 標籤名稱
| data.tags[0].description  | 標籤描述
| data.tags[0].id           | 標籤id

### 使用者記憶模板查詢
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
        "description": "使用者名稱",
        "id": "478075408797933588",
        "type": "stringEnum",
        "key": "username"
      },
      {
        "description": "生日",
        "id": "283615327961481304",
        "type": "datetimeEnum",
        "key": "birthday"
      },
      {
        "description": "密碼",
        "id": "477723514581819413",
        "type": "passwdEnum",
        "key": "passwd"
      }
    ]
  }
}
```

| RESPONSE PATH                     | 說明
| --------------------------------- | --------------------------------
| rc                                | 回應碼，0=>回應成功，不等於0為錯誤
| error                             | 當回應碼不為0的時候產生的錯誤訊息
| data.userFields[0].id             | 記憶欄位id
| data.userFields[0].description    | 記憶欄位描述
| data.userFields[0].key            | 記憶欄位鍵
| data.userFields[0].type           | 記憶欄位type(stringEnum, numEnum, datetimeEnum, passwdEnum)

## 事件

### 使用者註冊事件
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

| REQUEST_PATH     | 必填 | 說明
| -------------    | ---- |-------
| broad_hash_id    |   v  | broad提供的id
| platform         |   v  | 分為line、messenger、api、telegram
| userId           |   v  | client_userId

| RESPONSE PATH                     | 說明
| --------------------------------- | --------------------------------
| rc                                | 回應碼，0=>回應成功，不等於0為錯誤
| error                             | 當回應碼不為0的時候產生的錯誤訊息

# 最後更新時間

2023/07/12

刪除API signature Query和Payload的複雜計算

2023/06/20

- 刪除所有API需要appId的參數，一律以系統內部設置為主。

2023/05/23

- 新增"使用者註冊事件"