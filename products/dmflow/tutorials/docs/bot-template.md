# 模板

模板分為對話模板以及記憶模板。
## 對話模板

### 基本介紹
![](../../../../../images/docs/image056.png)
- 1.將會補全該領域的功能，例如：問答對的相似問題或是知識庫的實體等。
- 2.可以將對話模板做分類，填寫分類名稱以及描述即可新增新的分類。
- 3.會顯示所有目前支援的平台。
- 4.對話模板會顯示現有的名稱。

### 支援平台
目前僅支援LINE和FB的Messenger。

### LINE

#### 文字訊息
![](../../../../../images/docs/image074.png)

#### 預覽-文字訊息預覽[僅供參考]
![](../../../../../images/docs/image082.png)


#### 快速回覆

![](../../../../../images/docs/image095.png)

- 1.文字快速回覆
- 2.電子信箱-回傳電子信箱
- 3.手機號碼-回傳手機號碼
- 4.按鈕文字，快速回覆文字內容。
- 5.訊息型態包含此兩種[觸發動作-訊息文字](/products/dmflow/tutorials/docs/bot-template.html#觸發動作-訊息文字)、[觸發動作-回傳值](/products/dmflow/tutorials/docs/bot-template.html#觸發動作-回傳值)
- 6.文字旁邊的icon



#### 圖片訊息
![](../../../../../images/docs/image075.png)

網址圖片支援JPEG或是PNG和10MB內，縮圖限制1MB，且必須為HTTPS協定。DmFlow上傳限制1MB[以系統顯示為主]內。

只要有圖片網址，都可以進行上傳。
- 1.垂直向左
- 2.垂直向右
- 3.上傳
- 4.放大
- 5.縮小
- 6.取消圖片

#### 預覽-圖片訊息預覽[僅供參考]
![](../../../../../images/docs/image083.png)

#### 實際-圖片訊息預覽
![](../../../../../images/docs/image104.png)

#### 影片訊息
![](../../../../../images/docs/image076.png)

目前DmFlow尚未支援上傳影片功能，僅能使用網址，影片僅支援MP4且在200MB以內。且必須為HTTPS協定。

#### 語音訊息

![](../../../../../images/docs/image077.png)

目前DmFlow尚未支援上傳語音功能，僅能使用網址，語音僅支援M4A且在200MB以內。且必須為HTTPS協定。

#### 圖文訊息
![](../../../../../images/docs/image078.png)

[LINE官方圖文訊息介紹](https://tw.linebiz.com/manual/line-official-account/oa-manager-richmessage/)

- 1.網址限制10MB以下，且必須為HTTPS協定。DmFlow上傳圖片僅能1MB[以系統顯示為主]內。
- 2.替代文字為當使用者收到此圖文訊息時，跳出的訊息文字。
- 3.[圖文訊息-影片](/products/dmflow/tutorials/docs/bot-template.html#圖文訊息-影片)
- 4.[圖文訊息-觸發動作](/products/dmflow/tutorials/docs/bot-template.html#圖文訊息-觸發動作)
#### 圖文訊息-影片

![](../../../../../images/docs/image079.png)

- 1.目前DmFlow尚未支援上傳影片功能，僅能使用網址，影片僅支援MP4且在200MB以內。且必須為HTTPS協定。
- 2.預覽圖片，支援1mb以內。
- 3.水平位置，由左邊開始的位置。(必須大於0)
- 4.垂直位置，由上方開始的位置。(必須大於0)
- 5.影片寬度
- 6.影片高度
- 7.影片結束後提供外部連結
- 8.外部連結名稱

#### 圖文訊息-觸發動作
包含[圖文訊息-訊息文字](/products/dmflow/tutorials/docs/bot-template.html#圖文訊息-訊息文字)以及[圖文訊息-開啟視窗](/products/dmflow/tutorials/docs/bot-template.html#圖文訊息-開啟視窗)

#### 圖文訊息-訊息文字

![](../../../../../images/docs/image080.png)

- 1.由上方開始位置計算
- 2.由左方開始位置計算
- 3.文字顯示高度
- 4.顯示出文字
- 5.文字顯示寬度
- 6.備註(當客戶端有輔助功能時做語音提醒)


#### 圖文訊息-開啟視窗

![](../../../../../images/docs/image081.png)

- 1.由上方開始位置計算
- 2.備註(當客戶端有輔助功能時做語音提醒)
- 3.文字顯示寬度
- 4.由左方開始位置計算
- 5.文字顯示高度
- 6.連結網址

#### 預覽-圖文訊息預覽[僅供參考]

![](../../../../../images/docs/image084.png)

紅色箭頭以及指向方框，為解釋填寫內容，非正式出現，影片僅用VIDEO提示位置以及高寬度，文字部分會將點擊後顯示文字標示(實際上不會出現該文字)，超連結也會將連結內容標示(實際上不會出現該連結文字)，以實際顯示為準。


#### 實際-圖文訊息預覽

![](../../../../../images/docs/image110.png)

#### 圖片輪播

![](../../../../../images/docs/image085.png)

- 1.當電腦版無法顯示的時候顯示的文字。
- 2.模板選擇"圖片輪播模組"
- 3.點擊後觸發分為訊息文字、回傳值以及開啟視窗

#### 觸發動作
包含[觸發動作-訊息文字](/products/dmflow/tutorials/docs/bot-template.html#觸發動作-訊息文字)、[觸發動作-回傳值](/products/dmflow/tutorials/docs/bot-template.html#觸發動作-回傳值)、[觸發動作-開啟視窗](/products/dmflow/tutorials/docs/bot-template.html#觸發動作-開啟視窗)

#### 觸發動作-訊息文字
![](../../../../../images/docs/image086.png)
- 1.圖片上的文字按鈕顯示之文字。
- 2.當點擊按鈕後回傳的文字。

#### 觸發動作-回傳值
![](../../../../../images/docs/image087.png)
- 1.圖片上的文字按鈕顯示之文字。
- 2.訊息型態分為文字以及事件。
- 3.文字的細項僅有文字，事件的細項分為打斷事件、忽略事件、開始事件、結束事件、表格問答-下一頁、表格問答-清空過濾條件，點此[回傳值](/products/dmflow/tutorials/docs/bot-template.html#回傳值)了解回傳值的使用。
- 4.根據'情境節點'中的'重回主場景'，如果未填入，則一律重回Main。
- 5.文字的詢問，此詢問將會丟入DmFlow當作用戶說話。
- 6.當用戶點此文字按鈕後，將會顯示在自己的LINE客戶端上的文字。

#### 回傳值
代表點擊該按鍵時會傳給DmFlow的數據，主要需要了解的是事件的細稱：
- 1.打斷事件：直接跳去選定的場景。
- 2.忽略事件：當下點擊不會回復任何話語。（當前只想顯示數據時，不想引起後台回復時所用）
- 3.開始事件：可以做當前對話重新開始。
- 4.結束事件：讓整場對話做結束。
- 5.表格問答-下一頁：該事件處在表格問答時適用。如果該表格有下一頁處理時可用。
- 6.表格問答-清空過去條件：該事件處在表格問答時適用。將過濾條件清空。

#### 觸發動作-開啟視窗
![](../../../../../images/docs/image088.png)
- 1.圖片上的文字按鈕顯示之文字。
- 2.手機裝置跳出的webview。
- 3.非手機裝置跳出的網頁。

#### 預覽-圖片輪播預覽[僅供參考]

![](../../../../../images/docs/image089.png)

#### 實際-圖片輪播預覽

![](../../../../../images/docs/image105.png)

#### 確認範本

![](../../../../../images/docs/image090.png)
- 1.模板選擇"確認範本"
- 2.確認問題為二選一之詢問。
- 3.觸發動作，可以前往[觸發動作](/products/dmflow/tutorials/docs/bot-template.html#觸發動作)了解。

#### 預覽-確認範本預覽[僅供參考]

![](../../../../../images/docs/image091.png)

#### 實際-確認範本預覽

![](../../../../../images/docs/image106.png)

#### 按鈕範本

![](../../../../../images/docs/image093.png)

- 1.模板選擇"按鈕範本"
- 2.標題，可根據預覽了解放置位置。
- 3.文字訊息，可根據預覽了解放置位置。
- 4.圖片縮圖，可根據預覽了解放置位置。
- 5.[圖片比例](/products/dmflow/tutorials/docs/bot-template.html#圖片比例)
- 6.[圖片呈現](/products/dmflow/tutorials/docs/bot-template.html#圖片呈現)
- 7.背景顏色，當"圖片呈現"為contain時，會用此色碼填滿。
- 8.當點擊非按鈕時觸發(包含圖片、標題以及內容)，[觸發動作](/products/dmflow/tutorials/docs/bot-template.html#觸發動作)
- 9.[觸發動作](/products/dmflow/tutorials/docs/bot-template.html#觸發動作)

#### 圖片比例

- rectangle=1.51:1
- quare=1:1

#### 圖片呈現

- cover:填充整個區塊，超過不顯示
- contain:顯示整張圖片，未填滿以背景色填充

#### 預覽-按鈕範本預覽[僅供參考]
![](../../../../../images/docs/image092.png)

#### 實際-按鈕範本預覽
![](../../../../../images/docs/image107.png)

#### 輪播範本

![](../../../../../images/docs/image094.png)
- 1.模板選擇"輪播模組"
- 2.圖片輪播欄位，同[按鈕範本](/products/dmflow/tutorials/docs/bot-template.html#按鈕範本)，只是可以支援複數。
- 3.[圖片比例](/products/dmflow/tutorials/docs/bot-template.html#圖片比例)
- 4.[圖片呈現](/products/dmflow/tutorials/docs/bot-template.html#圖片呈現)

#### 預覽-輪播範本預覽[僅供參考]
![](../../../../../images/docs/image109.png)

#### 實際-輪播範本預覽
![](../../../../../images/docs/image108.png)

### Facebook Messenger

#### 文字及其他訊息

![](../../../../../images/docs/image096.png)

文字以及圖片(可上傳，1mb以內)，其他如影片、音訊、檔案都僅支援網址連接。

#### 實際-文字訊息預覽

![](../../../../../images/docs/image112.png)

#### 一般範本

![](../../../../../images/docs/image097.png)

- 1.horizontal:16:9, square:1:1
- 2.標題，可根據預覽了解放置位置。
- 3.副標題，可根據預覽了解放置位置。
- 4.圖片，可根據預覽了解放置位置。
- 5.[連結元件、連結元件(extension)](/products/dmflow/tutorials/docs/bot-template.html#連結元件連結元件extension)
- 6.觸發條件包含[連結元件、連結元件(extension)](/products/dmflow/tutorials/docs/bot-template.html#連結元件連結元件extension)以及[觸發動作-回傳值](/products/dmflow/tutorials/docs/bot-template.html#觸發動作-回傳值)。

#### 預覽-一般範本預覽[僅供參考]
![](../../../../../images/docs/image100.png)

#### 實際-一般範本預覽

![](../../../../../images/docs/image111.png)

#### 連結元件、連結元件(extension)

連結元件

![](../../../../../images/docs/image098.png)

- 1.網址連結
- 2.網址名稱
- 3.FULL(100%)、COMPACT(50%)、TAIL(75%)

連結元件(extension)

[加入 Messenger 擴充套件 SDK](https://developers.facebook.com/docs/messenger-platform/webview/extensions/)

![](../../../../../images/docs/image099.png)

- 1.網址連結
- 2.網址名稱
- 3.FULL(100%)、COMPACT(50%)、TAIL(75%)
- 4.不支援時連結的網址

#### 按鈕範本

![](../../../../../images/docs/image101.png)

- 1.詢問問題。
- 2.按鈕元件包含[連結元件、連結元件(extension)](/products/dmflow/tutorials/docs/bot-template.html#連結元件連結元件extension)以及[觸發動作-回傳值](/products/dmflow/tutorials/docs/bot-template.html#觸發動作-回傳值)。

#### 預覽-按鈕範本預覽[僅供參考]
![](../../../../../images/docs/image102.png)

#### 實際-按鈕範本預覽
![](../../../../../images/docs/image113.png)

## 記憶模板
記憶模板分為使用者參數、使用者標籤、機器人參數以及單一會話儲存。
![](../../../../../images/docs/image058.png)
- 1.使用者參數：為儲存使用者資料的欄位。屬性包含文字、數字、時間等。
- 2.使用者標籤：用於儲存使用者的一種標示，會顯示得到該標籤次數以及最後得到的時間。
- 3.機器人參數：為儲存機器人永久參數，用於前綴為cofig的變數。
- 4.單一會話儲存：用於當前對話暫時保存之欄位。屬性包含文字、數字、時間、列表等。

### 屬性
- 1.文字：用於儲存一般文字。
- 2.數字：用於儲存數字型態的文字。
- 3.時間：用於儲存日期或時間型態的文字。
- 4.列表：選一個欄位做主鍵，可以儲存複數欄位值。

# 接著讀
- [全局設定](/products/dmflow/tutorials/docs/bot-global.html)