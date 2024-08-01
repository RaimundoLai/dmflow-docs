---
title: DMflow.chat Documentation | DMflow.chat 文檔
description: DMflow.chat Document Language Product DMflow Dialog Management Flow Chatbot | DMflow.chat 文檔 語系 產品 DMflow 對話管理系統 機器人
---

<div>
  <h1 id="myHeader">Communeify Documentation</h1><br>

  <select id="languageSelect" onchange="handleLanguageChange(this.value)">
    <option value="en">English</option>
    <option value="tw">中文</option>
  </select>
  <button id="goButton" onclick="redirectToSelectedLanguage()">Go</button><br>

  <h2 id="support_lang">Support Language</h2><br>

  <ul>
    <li><a href="/en/index.html">DMflow.chat Product Documentation</a></li>
    <li><a href="/tw/index.html">DMflow.chat 產品文檔</a></li>
  </ul>
</div>

<div id="websiteLink">Website Link：<a href='https://www.dmflow.chat/en' target="_blank">https://www.dmflow.chat</a></div>
<div id="websiteLink_tw">提供官網連結：<a href='https://www.dmflow.chat' target="_blank">https://www.dmflow.chat</a></div>
<div id="websiteLink_start">七天免費試用：<a href='https://app.dmflow.chat' target="_blank">https://app.dmflow.chat</a></div>
<div id="websiteLink_start_en">7 Days Free Trial：<a href='https://app.dmflow.chat' target="_blank">https://app.dmflow.chat</a></div>
<div>
  <h2 id="products">Products</h2><br>
  <ul id="product_langs">
    <li><a id="dmflow_link" href="/en/products/dmflow/index.html">DMflow(Direct Marketing flow)</a></li>
	<li id="dmflow_link_tw"><a href="/tw/products/dmflow/index.html">DMflow</a></li>
  </ul>
</div>

<style>
  /* CSS */
  body {
    font-family: Arial, sans-serif;
  }

  #languageSelect {
    padding: 5px;
    margin-bottom: 10px;
  }

  #goButton {
    padding: 5px 10px;
    background-color: #0d47a1;
    color: #fff;
    border: none;
    cursor: pointer;
  }

  #support_lang ul {
    list-style: none;
    padding-left: 0;
  }

  #support_lang ul li {
    margin-bottom: 5px;
  }
</style>
<script>
  var websiteLinkTW = document.getElementById("websiteLink_tw");
  websiteLinkTW.style.display = "none";
  var listProductLangs = document.getElementById("product_langs").getElementsByTagName("li");
  for (var i = 0; i < listProductLangs.length; i++) {
    var currentItem = listProductLangs[i];
	if(currentItem.id === 'dmflow_link_tw') {
	  currentItem.style.display = "none";
	}
  }
  function redirectToSelectedLanguage() {
    var selectedLanguage = document.getElementById('languageSelect').value;
    if (selectedLanguage === 'en') {
      window.location.href = '/en/';
    } else if (selectedLanguage === 'tw') {
      window.location.href = '/tw/';
    }
  }
  function handleLanguageChange(selectedValue) {
    if (selectedValue === 'en') {
	    doTranslate('en-US', false);
    } else if (selectedValue === 'tw') {
	    doTranslate('zh-TW', false);
    }
  }
  var defaultLanguage = navigator.language;
  var supportedLanguages = navigator.languages;
  doTranslate(defaultLanguage, true);
  
  function doTranslate(language, init) {
    var websiteUrl = "https://www.dmflow.chat";
    var websiteLink = document.getElementById("websiteLink");
    var defaultUrl = websiteUrl + "/en";
	var defaultSupportLang = 'Support Language';
	var defaultMyHeader = 'DMflow.chat Documentation';
	var defaultGoButton = 'Go';
	var defaultProducts = 'Products';
	var defaultDMflowLink = '/en/products/dmflow/index.html';
	var defualtDMflowLinkContent = 'DMflow(Direct Marketing flow)';
    websiteLink.innerHTML = "Website Link：<a href='" + defaultUrl + "' target='_blank'>" + websiteUrl + "</a>";
	document.getElementById('support_lang').innerHTML = defaultSupportLang;
    document.getElementById('myHeader').innerHTML = defaultMyHeader;
	document.getElementById("goButton").textContent = defaultGoButton;
	document.getElementById("products").innerHTML = defaultProducts;
	document.getElementById("dmflow_link").setAttribute("href", defaultDMflowLink);
	document.getElementById("dmflow_link").textContent = defualtDMflowLinkContent;
    if (language === 'en-US') {
	  if(init){
        document.getElementById('languageSelect').value = 'en';
	  }
    } else if (language === 'zh-CN' || language === 'zh-TW') {
	  if(init){
        document.getElementById('languageSelect').value = 'tw';
	  }
	  document.getElementById('support_lang').innerHTML = '語系';
      document.getElementById('myHeader').innerHTML = 'DMflow.chat 文檔';
	  document.getElementById("goButton").textContent = "前往";
	  document.getElementById("products").innerHTML = "產品";
	  document.getElementById("dmflow_link").setAttribute("href", "/tw/products/dmflow/index.html");
	  document.getElementById("dmflow_link").textContent = 'DMflow';
	  if(language === 'zh-TW') {
	      defaultUrl = websiteUrl + "/tw";
	  }else {
	      defaultUrl = websiteUrl + "/cn";
	  }
	  websiteLink.innerHTML = "提供官網連結：<a href='" + defaultUrl + "' target='_blank'>" + websiteUrl + "</a>";
    } else {
	  if(init){
        document.getElementById('languageSelect').value = 'en';
	  }
    }
  }
  
</script>