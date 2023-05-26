<div>
  <h1 id="myHeader">Communeify Documentation</h1><br>

  <select id="languageSelect" onchange="handleLanguageChange(this.value)">
    <option value="en">English</option>
    <option value="tw">繁體中文</option>
  </select>
  <button id="goButton" onclick="redirectToSelectedLanguage()">Go</button><br>

  <h2 id="support_lang">Support Language</h2><br>

  <ul>
    <li><a href="/en/index.html">The English documentation</a></li>
    <li><a href="/tw/index.html">繁體中文文檔</a></li>
  </ul>
</div>

<div id="websiteLink"></div>

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
    var websiteUrl = "https://www.communeify.com";
    var websiteLink = document.getElementById("websiteLink");
    var defaultUrl = websiteUrl + "/lang/en_US";
	var defaultSupportLang = 'Support Language';
	var defaultMyHeader = 'Communeify Documentation';
	var defaultGoButton = 'Go';
    websiteLink.innerHTML = "Website Link：<a href='" + defaultUrl + "'>" + websiteUrl + "</a>";
	document.getElementById('support_lang').innerHTML = defaultSupportLang;
    document.getElementById('myHeader').innerHTML = defaultMyHeader;
	document.getElementById("goButton").textContent = defaultGoButton;
    if (language === 'en-US') {
	  if(init){
        document.getElementById('languageSelect').value = 'en';
	  }
    } else if (language === 'zh-CN' || language === 'zh-TW') {
	  if(init){
        document.getElementById('languageSelect').value = 'tw';
	  }
	  document.getElementById('support_lang').innerHTML = '語系';
      document.getElementById('myHeader').innerHTML = 'Communeify 文檔';
	  document.getElementById("goButton").textContent = "前往";
	  if(language === 'zh-TW') {
	      defaultUrl = websiteUrl + "/lang/zh_TW";
	  }else {
	      defaultUrl = websiteUrl + "/lang/zh_CN";
	  }
	  websiteLink.innerHTML = "提供官網連結：<a href='" + defaultUrl + "'>" + websiteUrl + "</a>";
    } else {
	  if(init){
        document.getElementById('languageSelect').value = 'en';
	  }
    }
  }
  
</script>