*** Settings ***
Documentation  Keyboard and Mouse Actions in Robot Framework
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
Verify that the user is able to do a Space Key Press
    [documentation]  This test case verifies that a user is able to press Space Key into the input box
    [tags]  Regression
    Open Browser  https://the-internet.herokuapp.com/key_presses  Chrome
    Wait Until Element Is Visible  id:target  timeout=5
    Press Keys  id:target  SPACE
    Element Text Should Be  id:result  You entered: SPACE
    Close Browser

Verify that user is be able to hover over elements
    [documentation]  This test case verifies that a user is able to hover over elements by moving the cursor
    [tags]  Regression
    Open Browser  https://the-internet.herokuapp.com/hovers  Chrome
    Wait Until Element Is Visible  id:content  timeout=5
    Mouse Over  css:div:nth-child(3) > img
    Element Text Should Be  css:div:nth-child(3) > div > h5  name: user1  timeout=5
    Mouse Over  css:div:nth-child(4) > img
    Element Text Should Be  css:div:nth-child(4) > div > h5  name: user2  timeout=5
    Mouse Over  css:div:nth-child(5) > img
    Element Text Should Be  css:div:nth-child(5) > div > h5  name: user3  timeout=5
    Close Browser

Verify that the user can drag and drop elements
    [documentation]  This test case verifies that a user can drag and drop an element from source to destination
    [tags]  Regression
    Open Browser  https://demoqa.com/droppable  Chrome
    Maximize Browser Window
    Wait Until Element Is Visible  css:div.row  timeout=5
    Element Text Should Be  id:droppable  Drop here  timeout=5  #Before Drag and Drop
    Drag And Drop  id:draggable  id:droppable
    Element Text Should Be  id:droppable  Dropped!  timeout=5  #After Drag and Drop
    Close Browser

*** Keywords ***