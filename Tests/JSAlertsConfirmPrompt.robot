*** Settings ***
Documentation  Hanlde JS Aerts, JS Confirm, JS Prompt in Robot Framework
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
Handle JS Alerts
    [documentation]  This test case verifies that the user is able to Accept a JS Alert
    ...  and also verify its text
    [tags]  Smoke
    Open Browser  https://the-internet.herokuapp.com/javascript_alerts  Chrome
    Wait Until Element Is Visible  tag:button  timeout=5
    Click Element  css:li:nth-child(1) > button
    ${message}=  Handle Alert
    Should Be Equal  ${message}  I am a JS Alert
    Element Text Should Be  id:result  You successfully clicked an alert
    Close Browser

Handle JS Confirm
    [documentation]  This test case verifies that the user is able to Accept/Dismiss a JS Confirm
    ...  and also verify its text
    [tags]  Smoke
    Open Browser  https://the-internet.herokuapp.com/javascript_alerts  Chrome
    Wait Until Element Is Visible  tag:button  timeout=5
    Click Element  css:li:nth-child(2) > button
    ${message}=  Handle Alert  action=DISMISS  #Click on 'Cancel' button
    Should Be Equal  ${message}  I am a JS Confirm
    Element Text Should Be  id:result  You clicked: Cancel
    Click Element  css:li:nth-child(2) > button
    Handle Alert  action=ACCEPT
    Element Text Should Be  id:result  You clicked: Ok
    Close Browser

Handle JS Prompt
    [documentation]  This test case verifies that the user is able to input text, Accept/Dismiss a JS Confirm
    ...  and also verify its text
    [tags]  Smoke
    Open Browser  https://the-internet.herokuapp.com/javascript_alerts  Chrome
    Wait Until Element Is Visible  tag:button  timeout=5
    Click Element  css:li:nth-child(3) > button
    ${message}=  Handle Alert  action=DISMISS  #Click on 'Cancel' button without inputting text
    Should Be Equal  ${message}  I am a JS prompt
    Element Text Should Be  id:result  You entered: null
    Click Element  css:li:nth-child(3) > button
    Input Text Into Alert  Testersdock  action=ACCEPT  #Click 'OK' after inputting the text
    Element Text Should Be  id:result  You entered: Testersdock
    Close Browser

*** Keywords ***