*** Settings ***
Documentation  Database Testing in Robot Framework
Library  DatabaseLibrary

*** Variables ***
${DBName}  database-name
${DBUser}  username
${DBPassword}  password
${DBHost}  db4free.net
${DBPort}  3306

*** Test Cases ***
Verify Successful creation of Table
    [documentation]  This test case verifies that user is able to create a table successfully
    Connect DB
    ${output}=  Execute SQL String  CREATE TABLE Persons (PersonID int, FirstName varchar(255), Address varchar(255), City varchar(255));
    Should Be Equal As Strings  ${output}  None

Verify Data Insertion in Table
    [documentation]  This test case verifies that user is able to insert data in the table successfully
    ${output}=  Execute SQL Script  ./Resources/DB Data/insert.sql
    Should Be Equal As Strings  ${output}  None

Verify Data Update in Table
    [documentation]  This test case verifies a user can Update a Table record
    ${output}=  Execute SQL String  UPDATE Persons SET FirstName = "Kevin" WHERE City="Vantaa";
    Should Be Equal As Strings  ${output}  None

Verify a certain record is present or Not
    [documentation]  This test case verifies that in Persons Table we have the data for Dwight
    Check If Exists In Database  SELECT PersonID FROM Persons WHERE FirstName="Dwight"

Verify a Table is present or Not
    [documentation]  This test case verifies whether Persons table exist in the database or not
    Table Must Exist  Persons

Verify that the row count is 1
    [documentation]  This test case verifies that there is only one row in table where the city is Espoo
    Row Count Is Equal To X  SELECT PersonID FROM Persons WHERE CITY="Espoo"  1

Verify that you can Delete a Table
    [documentation]  This test case verifies that a user can delete a Table
    ${output}=  Execute SQL String  DROP TABLE Persons;
    Should Be Equal As Strings  ${output}  None
    Disconnect DB

*** Keywords ***
Connect DB
    Connect To Database  pymysql  ${DBName}  ${DBUser}  ${DBPassword}  ${DBHost}  ${DBPort}

Disconnect DB
    Disconnect From Database