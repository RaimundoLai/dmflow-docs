# 機器人範例

簡單設計招募機器人步驟。

## 規劃

首先先規畫要做什麼、怎麼做。

- 1.思考面試過程需要填寫什麼資訊。像是個人資料、求職問題、心理測驗或是簡單測驗。
- 2.那些需要放在意圖型，那些需要放在問答對或是知識庫或是用機器人流程設計。
- 3.若放到意圖型，是否需要填寫實體?需要那些實體?
- 4.機器人流程的設計問題。

以下開始講解

### 步驟一 建立問答對

我們先取用個人資料、求職問題以及簡單測試方面下手。

預想機器人場景需要job_openning(工作機會)、java_test(JAVA工程師測驗)、describe_java(JAVA工程師介紹)

在問答對內，新建一個問答對庫，分別詢問句是工作機會[轉向 job_openning]、福利待遇[文本 準時付薪水]、公司文化[文本 做客戶喜愛且有用的產品]、介紹JAVA工程師[轉向 describe_java]以及面試JAVA工程師[轉向 java_test]，以下圖為例。

![](../../../../../images/docs/image126.png)

並建立問答對領域，取名為hire_faq，並與問答對庫做連結。

### 步驟二 建立意圖

新增一個領域的意圖類，取名為hire_int。

新增意圖為"greeting"、"basic_info"、"hobbies"、"resign_bool"

greeting稱為招呼意圖，說法為hi、你好、嗨、開始之類的。

basic_info為拿取測驗者基本資料，需要的實體為

| 詞槽名     | 辭典名稱      | 說明
|-------     | ---------     |------
| name       | @ANY          | 測驗者姓名
| location   | @ANY          | 測驗者來自
| work_years | @NUM(量詞:年) | 工作年資
| education  | @ANY          | 教育程度
| college    | @ANY          | 就讀大學
| department | @ANY          | 系所

![](../../../../../images/docs/image127.png)

hobbies為一些基本問題，需要的實體為


| 詞槽名       | 辭典名稱      | 說明
|-------       | ---------     |------
| advantage    | @ANY          | 優勢
| disadvantage | @ANY          | 劣勢
| difficult    | @ANY          | 工作/就業有遇到什麼困難地方
| apply        | @ANY          | 應徵原因
| hire_reason  | @ANY          | 聘用原因
| resign_bool  | @ANY          | 是否有離職

![](../../../../../images/docs/image128.png)

resign_bool為可選意圖，目的只是為了假設應聘者選取了有離職過，會加以詢問離職原因。

| 詞槽名          | 辭典名稱      | 說明
|-------          | ---------     |------
| resign_reason   | @ANY          | 離職原因

![](../../../../../images/docs/image129.png)

當完成意圖們後，記得進入發布做生產發布，才能供給機器人流程使用。

![](../../../../../images/docs/image130.png)

假設需要測試，可在basic_info中的說法填寫"基本資料"，hobbies中的說法填寫"自我介紹"。

測試頁面輸入"基本資料"或是"自我介紹"即可測試。


![](../../../../../images/docs/image131.png)

### 步驟三 機器人流程建置

新建機器人名叫"hire_bot"。

並在記憶模板，使用者參數新增email以及單一會話儲存新增score。

- email 當完成基本資料以及測試後，會需要對方提供email。
- score 則為JAVA試驗成績。

![](../../../../../images/docs/image132.png)

進入全局設定-領域並加入hire_int、hire_faq並在更多內點選啟用。

![](../../../../../images/docs/image134.png)

進入全局設定-場景，將一開始想的job_openning(工作機會)、java_test(JAVA工程師測驗)、describe_java(JAVA工程師介紹)新建。

![](../../../../../images/docs/image133.png)

開始對話流程設計。以下根據編號填寫。

1.點選場景"Main"並點選"start"節點，設定預載領域(意圖)選擇hire_int。

![](../../../../../images/docs/image135.png)

2.建立"回覆節點"輸入以下文字，記得勾選"等待用戶回覆"。

> 請問您需要什麼幫忙?
>
> 工作機會
>
> 公司文化
>
> 福利待遇

![](../../../../../images/docs/image136.png)

3.將開始節點跟回覆節點連線，並將條件設定"intent等於greeing"。

![](../../../../../images/docs/image137.png)

4.新增節點"調用節點"，選擇hire_faq。並將上一個回覆節點[請問您需要什麼幫忙...]節點跟此節點連線選擇"無條件"。

![](../../../../../images/docs/image138.png)

5.新增節點"情境節點"，選擇跳轉至回覆節點[請問您需要什麼幫忙...]，並和調用節點"call_hire_faq"進行連線選擇"無條件"。

![](../../../../../images/docs/image139.png)

從步驟1-5我們完成了情境Main的設置，如下圖。

![](../../../../../images/docs/image140.png)

說明

- 開始節點利用intent=greeting，可以將對方詢問"你好、hi"這一類的話再進入流程，當沒命中會跳出"未命中的回答"。我們可以在創建其他節點取代未命中，使對話更完善。
- 利用call hire_faq可以節省很多if else的流程，當命中工作機會會跳往情境job_openning，而公司文化、福利待遇則以文本顯示。
- 最後設置的跳轉節點，因為不管是文本或是打斷跳轉，最後會需要繼續回到詢問句才設置該節點。

6.進入job_openning的情境，在開始節點的詢問填寫以下。

>  目前有開放職位包含以下
>
>  介紹JAVA工程師

![](../../../../../images/docs/image141.png)

7.新增節點"調用節點"，選擇hire_faq。並將上一個start節點跟此節點連線選擇"無條件"。

![](../../../../../images/docs/image142.png)

從步驟6-7我們完成了情境job_openning的設置，如下圖。

![](../../../../../images/docs/image143.png)

說明

- 開始節點說明"介紹JAVA工程師"會透過hire_faq讓節點前往情境describe_java。而使用者詢問公司文化等問題也會一併回答，如果想只專注於"介紹JAVA工程師"可將無條件改為有條件去限制詢問。

8.進入describe_java的情境，在開始節點的詢問填寫以下。

> JAVA工程師目的在於維護與開發DmFlow相關產品。
>
> 面試JAVA工程師

![](../../../../../images/docs/image144.png)

9.新增節點"調用節點"，選擇hire_faq。並將上一個start節點跟此節點連線選擇"無條件"。

![](../../../../../images/docs/image145.png)

說明 

- 同步驟6-7，只是詢問句改變。

10.進入java_test的情境，在開始節點的詢問填寫以下。從java_test情境我們可以介紹流程如何取代意圖或是知識庫。

> 我們將會根據[1]填寫個人資料[2]工作偏好[3]JAVA基本問題 依序填寫。
>
> 請輸入"準備好了"開始。

![](../../../../../images/docs/image146.png)

11.將流程分為三大區塊分為個人資料、面試基本問答，以及測驗。

下圖紅框是個人資料，藍框是基本問答。

![](../../../../../images/docs/image147.png)

下圖是測驗。

![](../../../../../images/docs/image148.png)

12.先新增回覆節點，輸入以下文字。，並連結start節點，條件可以選擇無條件或是有條件query=準備好了。

> 面試開始前我們先了解您的個人資料
>
> 輸入"準備好了"開始

![](../../../../../images/docs/image149.png)

13.建立"調用節點"，領域選擇hire_int，意圖選擇basic_info。與先前的"[1/3]面試"連線條件可以選擇無條件或是有條件query=準備好了。

![](../../../../../images/docs/image150.png)

14.建立"回覆節點"，輸入以下文字。與調用節點[收集個人資料]做無條件連線。

> 為了瞭解您的工作偏好，請回答以下問題?
>
> 輸入"準備好了"開始問答

![](../../../../../images/docs/image151.png)

15.建立"調用節點"，領域選擇hire_int，意圖選擇hobbies。與先前的"[2/3]面試"連線條件可以選擇無條件或是有條件query=準備好了。

![](../../../../../images/docs/image152.png)

16.建立"回覆節點"，輸入以下文字。與調用節點[介紹個人特色]做無條件連線。

> 我們將考你一些關於JAVA的問題，請輸入"準備好了"開始作答。

![](../../../../../images/docs/image153.png)

17.新增"變數節點"，並將score歸零，並與先前節點連線，條件為無條件。

![](../../../../../images/docs/image154.png)

18.分別創建題目，題目為選選擇題，答對了加分，答錯繼續下一題。先建立"回覆節點"並跟先前"變數節點"連線，條件為無條件。

> 以下哪一個不是設計模式?
>
> 享元模式
>
> 單例模式
>
> 策略模式
>
> 生產鏈模式
>
> 我不知道

![](../../../../../images/docs/image155.png)

19.當正確答案等於[query|等於|constant|生產鏈模式]時，進入加分"變數節點"，並與前面"回覆節點"一起無條件連接到下一題。

![](../../../../../images/docs/image157.png)
![](../../../../../images/docs/image156.png)

20.第二題到第四題重複步驟18-19分別是

第二題

> 下面哪個流類屬於字符的輸入流?
>
> BufferedWriter
>
> FileInputStream
>
> ObjectInputStream
>
> InputStreamReader

有條件[query|等於|constant|InputStreamReader]

第三題

> 下面關於數組聲明和初始化語法哪句有錯誤?
>
> A. int a1[]={3, 4, 5};
>
> B. String a2[] = {"string1", "string1"};
>
> C. String a3[]=new String(3);
>
> D. int[][] a4 = new int[3][3];

有條件[query|等於|constant|C]

第四題

> Java的集合接口有java.util.Collection定義了很多方法。選項中哪個不是其定義?
>
> A. int size()
>
> B. boolean containsAll(Collection c)
>
> C. compareTo(Object obj)
>
> D. boolean remove(Object obj)

有條件[query|等於|constant|C]

21.新增一個回覆節點"總得分"並新增以下文字。

> 你總共得到了 分數為: ${#session.score} / 6分，測驗已結束，我們會再通知您，可否填寫您的email

![](../../../../../images/docs/image158.png)

22.新增變數節點儲存email

![](../../../../../images/docs/image159.png)

23.並在最後新增回覆節點，文字如下，且必須關閉"等待用戶回覆"。關閉等待用戶回覆目的是這句話算是結束，如果開啟則會等待用戶問話。

> 感謝您的填寫，我們會盡快給你答覆。

![](../../../../../images/docs/image160.png)

### 完成

做完以上流程，就大概完成招募機器人的基本設置。

當完成設置後，別忘了點選[1]儲存或[2]更新。

![](../../../../../images/docs/image161.png)

並打開保存->編輯->勾選是否發布->更新，完成後就可以進行對話測試了。

![](../../../../../images/docs/image162.png)

開始測試。

![](../../../../../images/docs/image163.png)

# 接著讀
- [日誌](/products/dmflow/tutorials/docs/bot-log.html)