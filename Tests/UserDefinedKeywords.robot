*** Settings ***
Documentation  Login Functionality
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
Verify Successful Login to OrangeHRM
    [documentation]  This test case verifies that the user is able to successfully log in to OrangeHRM
    [tags]  Smoke
    Start Test
    Login
    End Test

*** Keywords ***
Start Test
    Open Browser  https://opensource-demo.orangehrmlive.com/  Chrome
    Maximize Browser Window
Login
    Wait Until Element Is Visible  id:txtUsername  timeout=5
    Input Text  id:txtUsername  Admin
    Input Password  id:txtPassword  admin123
    Click Element  id:btnLogin
    Element Should Be Visible  id:welcome  timeout=5
End Test
    Close Browser



