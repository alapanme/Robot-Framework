*** Settings ***
Documentation  Login Functionality
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
Verify Successful Login to OrangeHRM
    [documentation]  This test case verifies that user is able to successfully Login to OrangeHRM
    [tags]  Smoke
    Open Browser  https://opensource-demo.orangehrmlive.com/  Chrome
    Wait Until Element Is Visible  id:txtUsername  timeout=5
    Input Text  id:txtUsername  Admin
    Input Password  id:txtPassword  admin123
    Click Element  id:btnLogin
    Element Should Be Visible  id:welcome  timeout=5
    Close Browser

Verify Successful Login to the-internet.herokuapp
    [documentation]  This test case verifies that user is able to successfully Login to the-internet.herokuapp
    [tags]  Smoke
    Open Browser  https://the-internet.herokuapp.com/login  Chrome
    Wait Until Element Is Visible  id:username  timeout=5
    Input Text  id:username  tomsmith
    Input Password  id:password  SuperSecretPassword!
    Click Element  css:button[type="submit"]
    Element Should Be Visible  css:[href="/logout"]  timeout=5
    Close Browser

*** Keywords ***