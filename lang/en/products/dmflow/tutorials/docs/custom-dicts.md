---
title: DMflow Custom Dictionaries| DMflow
description: Custom dictionaries are used to store standard terms, synonyms, and regular expressions for general vocabulary.
---

# Dictionary - Custom Dictionaries

Custom dictionaries are used to store standard terms, synonyms, and regular expressions for general vocabulary.

## Standard Terms

Standard terms include individual words and synonyms used for table queries or specific words that need to be covered.

For example:

If you want to include a beverage that is not covered by the system's built-in dictionary, you can add the beverage name "tea" and include its corresponding synonyms to maintain its dictionary content.

## Regular Expressions

Regular expressions are powerful text processing tools used to search, match, and manipulate text patterns. They consist of a series of special characters and metacharacters used to define the text pattern to be matched.

Here are some common metacharacters used in regular expressions:

### Character Matching:

- .：Matches any single character except a newline.
- \w：Matches any letter, digit, or underscore.
- \d：Matches any digit character.
- \s：Matches any whitespace character, such as space or tab.

### Repetition Matching:

- *：Matches the preceding element zero or more times.
- +：Matches the preceding element one or more times.
- ?：Matches the preceding element zero or one time.
- {n}：Matches the preceding element exactly n times.
- {n,}：Matches the preceding element at least n times.
- {n,m}：Matches the preceding element at least n times but not more than m times.

### Character Classes:

- [abc]：Matches any one of the characters a, b, or c.
- [^abc]：Matches any character except a, b, or c.
- [0-9]：Matches any digit character.
- [a-zA-Z]：Matches any alphabetic character.

### Anchors:

- ^：Matches the start of the text.
- $：Matches the end of the text.
- \b：Matches a word boundary.

### Usage

For example:

If you need a dictionary for email addresses, which cannot be represented by a single word, you can use the following regular expression to extract email addresses.

```
^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$
```

# Continue Reading
- [Knowledge Base Introduction](../../tutorials/docs/qa-intro.html)

## Contact Information

Email: <service@dmflow.chat>

DMflow.chat Official website: [DMflow.chat](https://www.dmflow.chat/en/)
(We changed our domain to www.dmflow.chat on 2024-05-18)