*** Settings ***
Resource    user_keyword.robot
Library     Selenium2Library
#Test Teardown     Close Browser
*** Variables ***
${HOMEPAGE}     https://app.earnaha.com
${TMP_PATH}                 /tmp
${LOGIN_BUTTON}     xpath:/html/body/div[1]/div[3]/div[1]/div[3]/div[2]/div/button[2]
${LOGIN_FORM}       xpath:/html/body/div/main/section/div/div/div/form
${LOGIN_CONTINUE_BUTTON}   xpath:/html/body/div/main/section/div/div/div/form/div[2]/button
${GOOGLE_LOGIN_BUTTON}      xpath:/html/body/div/main/section/div/div/div/div[3]/form/button
${EMAIL_FIELD}          xpath:/html/body/div/main/section/div/div/div/form/div[1]/div/div[1]/div/input
${PASSWORD_FIELD}       xpath:/html/body/div/main/section/div/div/div/form/div[1]/div/div[2]/div/input
${VALID_EMAIL}        aha@disposeamail.com
${VALID_PASSWORD}      ahaAHA1qaz@WSX
${PROFILE_ICON}        xpath:/html/body/div[1]/div[2]/div[2]/div/a[4]
${GOOGLE_OAUTH_BUTTON}    xpath:/html/body/div/main/section/div/div/div/div[3]/form/button/span[2]
${GOOGLE_ACCOUNT_FIELD}        name:identifier
${GOOGLE_PASSWORD_FIELD}        name:password
${BIRTHDAY_INPUT}   xpath=/html/body/div[1]/div[2]/div[1]/div[2]/div/div[1]/div[2]/div/div/div/div/div/form/div[2]/div[7]/div/div/div
${PICK_YEAR}    //button[@class='MuiButtonBase-root css-163vojy']
${YEAR}         //button[@data-year='1993']
${DATE}          xpath=/html/body/div[3]/div[3]/div/div[2]/div/div[2]/div[1]/div/div[5]/div[3]/button
${CHECK_DATE}    xpath=/html/body/div[3]/div[3]/div/div[3]/button[2]
${SUBMIT_BUTTON}    //button[@type='submit']
*** Keywords ***
Click Birthday Input 
    Wait Until Element Is Enabled    ${BIRTHDAY_INPUT}     timeout=10s
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
TC_001 Test
    GIVEN User Already Sign In 
    WHEN Click Profile Icon
    AND Interact With Birthday Calendar
    AND Click Submit Button