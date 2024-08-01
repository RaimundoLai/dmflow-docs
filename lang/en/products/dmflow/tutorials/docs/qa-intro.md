---
title: DMflow Knowledge Base Introduction | DMflow
description: The knowledge base consists of Question-Answer (QA) pairs and tabular QA. The following will introduce the definitions and applications of both.
---

# Knowledge Base Introduction

The knowledge base consists of Question-Answer (QA) pairs and tabular QA. The following will introduce the definitions and applications of both.

## QA Pairs

QA pairs refer to the combination of questions and corresponding answers. Their main uses include:

- Automated responses to common questions: QA pairs can be used to automatically answer common questions about product features, service details, frequently asked questions, etc. By establishing QA pairs for common questions, the chatbot can quickly and accurately respond to user queries, saving the time of human customer support.

- Information retrieval: QA pairs can provide information retrieval functionality where users can input questions and the chatbot matches them with relevant QA pairs to provide corresponding answers. This allows users to quickly find the information they need without wasting time searching websites or consulting human customer support.

- Information retrieval: QA pairs can provide information retrieval functionality where users can input questions and the chatbot matches them with relevant QA pairs to provide corresponding answers. This allows users to quickly find the information they need without wasting time searching websites or consulting human customer support.

- Education and training: QA pairs also have application value in the field of education and training. They can be used to provide learning materials in a question-and-answer format, helping students in their learning and self-assessment. Teachers or tutors can create QA pairs covering different aspects of the learning content, and students can check their learning progress and understanding by interacting with the chatbot.

In summary, QA pairs have wide-ranging applications in automated responses, information retrieval, technical support, education, and training. They can provide accurate and real-time answers, save manpower costs, and enhance user experience and learning effectiveness.

#### Answer Types

- 1.text :Plain text.
- 2.template:Templates that can inject return values through resources.
- 3.redirect:Redirect to another scene (requires Bot Flow).
- 4.JSON API:Use the platform's JSON to generate responses. Currently supports LINE, Messenger, and Telegram.


#### Template Output Details

- context->Outputs based on the keys of return values.
- extractTime->You can convert time values into strings in specific formats.
- listOutput->You can retrieve return values (must be an array) and generate a list in a specific format. Each item in the list contains specific properties from the values.

context
```
${#context.comfortable}
```
In this example, ${#context.comfortable} represents accessing the value of the key "comfortable" in the return value. You can insert this command wherever you need to retrieve the corresponding return value and output it.

This allows you to conveniently perform operations and presentations based on the keys in the return value.

extracTime

```
${%extractTime(#context.datetime,'yyyy-MM-dd HH:mm','')}
```

In this example, you need to set the first parameter as the time value returned (in seconds). The second parameter is a string that specifies the desired date format, such as 'yyyy-MM-dd HH:mm'. The third parameter is currently not implemented and is intended to specify the time zone, but by default, it will use the time zone of the bot flow.

By using this optimized command, you can easily convert time values into strings that match the specified format to meet your needs.


listOutput

```
${%listOutput(#context.order,'${#br}${#index}:Date: ${#item.date}, Total :${#item.money};' ,'1')}
```

In this example, you need to set the first parameter as the array value returned. The second parameter is a string where ${#br} represents a line break, ${#index} represents the current index of the loop, and ${#item.date} and ${#item.money} represent the date and amount properties of each item, respectively.

By using this optimized command, you can easily generate a list with a specific format for displaying and using the required value information.

Choose the resource through the image below and call the resource to obtain a JSON response.

```
{
  "temperature": 16,
  "datetime": "1665990946",
  "next_d": [
    {
      "rain_per": "100",
      "date": "2022-10-18"
    },
    {
      "rain_per": "10",
      "date": "2022-10-19"
    }
  ],
  "comfortable": "Slightly chilly"
}
```
![Domain resource](../../../../../../images/en/domain-resource-param.png "Domain resource")

Original template output:

> Comfort: ${#context.comfortable}, temperature${#context.temperature}°C
> Time:${%extractTime(#context.datetime,'yyyy-MM-dd HH:mm','')}
> ${%listOutput(#context.next_d,'${#br}${#index}:Date: ${#item.date}, Rain Probability: ${#item.rain_per}%;' ,'1')}

Modified template output:

> Comfort: Slightly chilly, temperature: 16°C
> Time: 2022-10-17 14:48
> 
> 1:Date:2022-10-18, Rain Probability: 100%;
>
> 2:Date:2022-10-19, Rain Probability: 10%; 

If the passed values are not filled or an error occurs, the parameter values will be replaced with empty values.

> Comfort: , temperature: °C
> Time:


## Continue Reading
- [Domain Introduction](../../tutorials/docs/domain-intro.html)

## Contact Information

Email: <service@dmflow.chat>

DMflow.chat Official website: [DMflow.chat](https://www.dmflow.chat/en/)
(We changed our domain to www.dmflow.chat on 2024-05-18)
