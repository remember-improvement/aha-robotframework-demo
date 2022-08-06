*** Settings ***
Resource    user_keyword.robot
Library     Selenium2Library
# Test Setup    User Already Sign In 
Test Teardown    Close Browser
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
${PROFILE_ICON}        //a[@id='nav-profile']
${GOOGLE_OAUTH_BUTTON}    xpath:/html/body/div/main/section/div/div/div/div[3]/form/button/span[2]
${GOOGLE_ACCOUNT_FIELD}        name:identifier
${GOOGLE_PASSWORD_FIELD}        name:password
${SETTING_ICON}        xpath=/html/body/div[1]/div[2]/div[1]/div[1]/div/div[1]/div[2]/div/div/div/div[2]/a[2]/div
${LOGOUT_BUTTON}        xpath:/html/body/div[1]/div[2]/div[1]/div[2]/div/div[1]/div[2]/div/div/div/div/div[2]/button
${CHECK_LOGOUT}        xpath:/html/body/div[1]/div[1]/div/div/div/div[2]
${CHECK_LOGOUT_BUTTON}    xpath:/html/body/div[1]/div[1]/div/div/div/div[3]/div/button[1]
***Keywords***

*** Test Case ***

TC_001 User Sign Out 
    GIVEN User Already Sign In 
    Sleep    2s
    WHEN Click Profile Icon
    Sleep    2s
    AND Click Setting Icon
    Sleep    2s
    AND Click Logout Button
    Sleep    2s
    AND Check Logout
    Sleep    2s
    THEN Logout Successfully

