# 個別意圖內容
## 預約會議
首先，我們先進入"預約會議"，點選"詳情"。
![](../../../../../images/intro/image005.png)
我們先依照下圖建立五個領域詞槽分別是"成員"、"會議室"、"會議主旨"、"結束時間"以及"開始時間"。
![](../../../../../images/intro/image004.png)
並在詞槽新建四個詞槽組，分別是start_time、end_time、meeting_subject以及meeting_room
![](../../../../../images/intro/image006.png)
新增以下對話不限於以下"預約{meeting_room}的會議室"、"我要預約會議"、"我想預約{start_time}到{end_time}的會議"
![](../../../../../images/intro/image007.png)
在"完成"欄位仿照下填寫。即可完畢預約會議的意圖。
![](../../../../../images/intro/image008.png)
## 取消會議
進入"取消會議"，點選"詳情"。
![](../../../../../images/intro/image013.png)
並在詞槽新建兩個詞槽組，分別是start_time以及meeting_room
![](../../../../../images/intro/image022.png)
新增以下對話不限於以下"我要取消{start_time}開始在{meeting_room}的會議"、"我要取消{start_time}開始的會議"、"我要取消會議"
![](../../../../../images/intro/image023.png)
在"完成"欄位仿照下填寫。即可完畢"取消會議"的意圖。
![](../../../../../images/intro/image024.png)

## 邀請成員
進入"邀請成員"，點選"詳情"。
![](../../../../../images/intro/image014.png)
並在詞槽新建三個詞槽組，分別是start_time、meeting_room以及team_members
![](../../../../../images/intro/image015.png)
新增以下對話不限於以下"邀請{asking_person}參加{start_time}的會議"、"我想邀請{asking_person}參加會議"
![](../../../../../images/intro/image016.png)
在"完成"欄位仿照下填寫。即可完畢邀請成員的意圖。
![](../../../../../images/intro/image017.png)

## 修改會議時間
進入"修改會議時間"，點選"詳情"。
![](../../../../../images/intro/image018.png)
觸發條件需要滿足"會議主題已填充"如下圖。
![](../../../../../images/intro/image019.png)
並在詞槽新建兩個詞槽組，分別是start_time以及end_time
![](../../../../../images/intro/image020.png)
在"完成"欄位仿照下填寫。即可完畢"修改會議時間"的意圖。
![](../../../../../images/intro/image021.png)

# 下一步
- [發布並測試](/products/dmflow/tutorials/intro/deploy-test.html)
