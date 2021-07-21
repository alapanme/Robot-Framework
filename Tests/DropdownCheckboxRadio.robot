*** Settings ***
Documentation  Handling Dropdown, Checkbox, and Radio Buttons in Robot Framework
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
Validate user can select items from the dropdown
    [documentation]  This test case verifies that the user can select values from the dropdown and verify it
    [tags]  Smoke
    Open Browser  https://the-internet.herokuapp.com/dropdown  Chrome
    Wait Until Element Is Visible  id:dropdown  timeout=5
    Select From List By Index  id:dropdown  1
    List Selection Should Be  id:dropdown  Option 1
    Select From List By Value  id:dropdown  2
    List Selection Should Be  id:dropdown  Option 2
    Close Browser

Validate user can check and uncheck checkboxes
    [documentation]  This test case verifies that the user can check and uncheck checkboxes and verify it
    [tags]  Smoke
    Open Browser  https://the-internet.herokuapp.com/checkboxes  Chrome
    Wait Until Element Is Visible  id:checkboxes  timeout=5
    Page Should Contain Checkbox  tag:input
    Checkbox Should Not Be Selected  css:input:nth-child(1)  #Checking checkbox 1 is not selected
    Checkbox Should Be Selected  css:input:nth-child(3)  #Checking checkbox 2 is selected
    Select Checkbox  css:input:nth-child(1)  #select checkbox 1
    Unselect Checkbox  css:input:nth-child(3)  #unselect checkbox 2
    Checkbox Should Be Selected  css:input:nth-child(1)  #Checking checkbox 1 is selected
    Checkbox Should Not Be Selected  css:input:nth-child(3)  #Checking checkbox 2 is not selected
    Close Browser

Validate user can select radio buttons
    [documentation]  This test case verifies that the user can select radio buttons and verify it
    [tags]  Smoke
    Open Browser  https://www.seleniumeasy.com/test/basic-radiobutton-demo.html  Chrome
    Wait Until Element Is Visible  tag:input  timeout=10
    Page Should Contain Radio Button  tag:input
    Radio Button Should Not Be Selected  optradio
    Select Radio Button  optradio  Male
    Radio Button Should Be Set To  optradio   Male
    Select Radio Button  optradio  Female
    Radio Button Should Be Set To  optradio   Female
    Close Browser

*** Keywords ***