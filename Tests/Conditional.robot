*** Settings ***
Documentation  Wikipedia Conditional Testing
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
Verify that if you find Wikivoyage on the page, then click on it and validate (Go to If)
    [documentation]  This test case verifies if we find Wikivoyage on the page, then we click on it.
    [tags]  Regression
    Open Browser  https://www.wikipedia.org/  Chrome
    ${count}=  Get Element Count  css:[data-jsl10n="wikivoyage.name"]
    Run Keyword If  ${count} > 0  Click Wikivoyage  # If the element is present we will get the value of count as 1
    ...  ELSE  Click Wiktionary
    Title Should Be  Wikivoyage  timeout=5
    Close Browser

Verify that if you don't find Wikivoyage on the page, then click on Wiktionary and validate (Go to Else)
    [documentation]  This test case verifies if we don't find Wikivoyage on the page, then we click on Wiktionary.
    [tags]  Regression
    Open Browser  https://www.wikipedia.org/  Chrome
    ${count}=  Get Element Count  css:wrong locator  # Intentionally given wrong locator to make sure control goes to Else
    Run Keyword If  ${count} > 0  Click Wikivoyage  # If the element is not present we will get the value of count as 0
    ...  ELSE  Click Wiktionary
    Title Should Be  Wiktionary  timeout=5
    Close Browser

*** Keywords ***
Click Wikivoyage
    Click Element  css:[data-jsl10n="wikivoyage.name"]

Click Wiktionary
    Click Element  css:[data-jsl10n="wiktionary.name"]