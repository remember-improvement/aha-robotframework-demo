*** Settings ***
Resource    user_keyword.robot
Library     Selenium2Library
Test Teardown     Close Browser
*** Variables ***
${BIRTHDAY_INPUT}   //input[@placeholder='MM/dd/yyyy']
${PICK_YEAR}        //button[@title='Pick year']
${YEAR}         //button[@data-year='1993']
${DATE}          //p[contains(text(),'24')]
${CHECK_DATE}    //button[contains(text(),'OK')]
${SUBMIT_BUTTON}    //button[@type='submit']
*** Keywords ***
Click Birthday Input 
    Wait Until Element Is Visible    ${BIRTHDAY_INPUT}     timeout=10s
    Click Element    ${BIRTHDAY_INPUT}

    
Click Pick Year 
    Wait Until Element Is Enabled    ${PICK_YEAR}     timeout=10s
    Click Element    ${PICK_YEAR}
Select Year
    Wait Until Element Is Enabled    ${YEAR}     timeout=10s
    Click Element    ${YEAR}
Select Date
    Wait Until Element Is Enabled    ${DATE}     timeout=10s
    Click Element    ${DATE}
Check Date
    Wait Until Element Is Enabled    ${CHECK_DATE}     timeout=10s
    Click Element    ${CHECK_DATE}
Click Submit Button
    Wait Until Element Is Enabled    ${SUBMIT_BUTTON}     timeout=10s
    Click Element    ${SUBMIT_BUTTON}
Interact With Birthday Calendar
    Click Birthday Input 
    Click Pick Year 
    Select Year
    Select Date
    Check Date
*** Test Case ***
TC_001 Edit User Profile
    GIVEN User Already Sign In 
    
    WHEN Click Profile Icon
    Sleep    2s
    AND Interact With Birthday Calendar
    Sleep    2s
    AND Click Submit Button