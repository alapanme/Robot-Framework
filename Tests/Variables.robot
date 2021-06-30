*** Settings ***
Documentation  Login Functionality
Library  SeleniumLibrary

*** Variables ***
${UserNameHRM}  Admin   #Scalar
${PasswordHRM}  admin123    #Scalar
@{CredentialsTheInternetHerokuApp}  tomsmith  SuperSecretPassword!  #List
&{VisibleElements}  OrangeHRM=id:welcome  InternetHerokuApp=css:[href="/logout"]  #Dictionary

*** Test Cases ***
Verify Successful Login to OrangeHRM
    [documentation]  This test case verifies that the user is able to successfully log in to OrangeHRM
    [tags]  Smoke
    Open Browser  https://opensource-demo.orangehrmlive.com/  Chrome
    Wait Until Element Is Visible  id:txtUsername  timeout=5
    Input Text  id:txtUsername  ${UserNameHRM}
    Input Password  id:txtPassword  ${PasswordHRM}
    Click Element  id:btnLogin
    Element Should Be Visible  ${VisibleElements}[OrangeHRM]  timeout=5
    Close Browser

Verify Successful Login to the-internet.herokuapp
    [documentation]  This test case verifies that user is able to successfully Login to the-internet.herokuapp
    [tags]  Smoke
    Open Browser  https://the-internet.herokuapp.com/login  Chrome
    Wait Until Element Is Visible  id:username  timeout=5
    Input Text  id:username  ${CredentialsTheInternetHerokuApp}[0]
    Input Password  id:password  ${CredentialsTheInternetHerokuApp}[1]
    Click Element  css:button[type="submit"]
    Element Should Be Visible  ${VisibleElements}[InternetHerokuApp]  timeout=5
    Close Browser

Verify Environment variable
    Should Contain  %{PATH}  /Library/Frameworks/Python.framework/  #Environment

*** Keywords ***