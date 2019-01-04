import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI

WebUI.openBrowser("https://zh.wikipedia.org/wiki/Wikipedia:%E9%A6%96%E9%A1%B5")

Thread.sleep(3000)

WebUI.navigateToUrl("https://ja.wikipedia.org/wiki/%E6%97%A5%E6%9C%AC%E8%AA%9E")

Thread.sleep(3000)

WebUI.navigateToUrl("https://ru.wikipedia.org/wiki/%D0%97%D0%B0%D0%B3%D0%BB%D0%B0%D0%B2%D0%BD%D0%B0%D1%8F_%D1%81%D1%82%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D0%B0")

Thread.sleep(3000)

WebUI.closeBrowser()