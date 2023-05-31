---
title: DmFlow 申請LINE API | DmFlow
description: DmFlow透過API與LINE Server進行串接，提供對話機器人給用戶使用。
---

# 申請LINE API

# 架構
DmFlow透過API與LINE Server進行串接，提供對話機器人給用戶使用。

``` mermaid
sequenceDiagram
    participant 用戶
    participant LINE SERVER
    participant DmFlow

    用戶->>LINE SERVER: 發送訊息
    LINE SERVER->>DmFlow: HTTP POST 到 webhook
    DmFlow-->>LINE SERVER: HTTP 200 OK
    Note over DmFlow: 處理並生成回應
    DmFlow->>LINE SERVER: 推送/回覆訊息
    LINE SERVER-->>用戶: 發送回應
```

## LINE Server

LINE 透過整合有不同的服務，可以透過DmFlow溝通LINE的終端，去做資料交換。

## API

API全名為Application Programming Interface，透過別人開出的規範，可以向其他程式做溝通。

## 開始
先申請LINE帳號，[LINE Business ID](https://account.line.biz/login)

![DmFlow整合LINE](../../../../../../images/tw/line-002.png "DmFlow整合LINE")

### 使用LINE帳號登入
可以使用一般使用者LINE做登入。

### 使用商用帳號登入
以公司為主業務用的電子郵件作申請。填入帳號名稱、電子郵件帳號、公司名稱以及業種(公司業務內容)即可申請完成。

## 設定

若尚未啟用Messaging API，請在設定->Messaging API點選"啟用Messaging API"，並輸入服務提供者(自己命名業務名稱，事後可更改)，並填入隱私權政策及條款(兩者非必填)，確認無誤後，點選"確定"。

![DmFlow整合LINE](../../../../../../images/tw/line-003.png "DmFlow整合LINE")

- 1.Channel ID
- 2.Channel Secret
- 3.填入Webhook網址。
- 4.進入LINE Developers進行接下來動作。

### LINE Developers

點選後會進入[LINE Developers](https://developers.line.biz/en/)，並依序下圖點選。

![DmFlow整合LINE](../../../../../../images/tw/line-004.png "DmFlow整合LINE")

![DmFlow整合LINE](../../../../../../images/tw/line-005.png "DmFlow整合LINE")

![DmFlow整合LINE](../../../../../../images/tw/line-006.png "DmFlow整合LINE")

![DmFlow整合LINE](../../../../../../images/tw/line-007.png "DmFlow整合LINE")

可以得到Channel ID、Channel secret以及Channel access token。並填寫Webhook URL即可完成。
