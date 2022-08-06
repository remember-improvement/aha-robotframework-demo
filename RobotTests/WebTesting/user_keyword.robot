*** Settings ***
 
Library     Selenium2Library
#Test Teardown     Close Browser
*** Variables ***
${HOMEPAGE}     https://app.earnaha.com
${TMP_PATH}                 /tmp
${LOGIN_BUTTON}     xpath:/html/body/div[1]/div[3]/div[1]/div[3]/div[2]/div/button[2]

${LOGIN_FORM}       xpath:/html/body/div/main/section/div/div/div/form
${LOGIN_CONTINUE_BUTTON}   xpath:/html/body/div/main/section/div/div/div/form/div[2]/button
${GOOGLE_LOGIN_BUTTON}      xpath:/html/body/div/main/section/div/div/div/div[3]/form/button
${EMAIL_FIELD}   //input[@inputmode='email']
${PASSWORD_FIELD}       //input[@id='password']
${VALID_EMAIL}        aha@disposeamail.com
${VALID_PASSWORD}      ahaAHA1qaz@WSX
${PROFILE_ICON}        xpath:/html/body/div[1]/div[2]/div[2]/div/a[4]
${GOOGLE_OAUTH_BUTTON}    xpath:/html/body/div/main/section/div/div/div/div[3]/form/button/span[2]
${GOOGLE_ACCOUNT_FIELD}        name:identifier
${GOOGLE_PASSWORD_FIELD}        name:password
${WRITING_BUTTON}    xpath=/html/body/div[1]/div[2]/div[1]/div[2]/div/div[1]/div[2]/div/div/div/div[1]/div/div[2]/div/button[1]
${READING_BUTTON}    xpath=/html/body/div[1]/div[2]/div[1]/div[2]/div/div[1]/div[2]/div/div/div/div[1]/div/div[2]/div/button[2]
${MATH_CAL_BUTTON}    xpath=/html/body/div[1]/div[2]/div[1]/div[2]/div/div[1]/div[2]/div/div/div/div[1]/div/div[2]/div/button[3]
${MATH_NO_CAL_BUTTON}    xpath=/html/body/div[1]/div[2]/div[1]/div[2]/div/div[1]/div[2]/div/div/div/div[1]/div/div[2]/div/button[4]
***Keywords***
Open Home Page Using Chrome Browser
    # ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    # Call Method  ${options}  add_argument  --no-sandbox
    # ${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    # Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    
    Go To   ${HOME_PAGE}
    Maximize Browser Window
 
Click Login Button
    Wait Until Element Is Enabled   ${LOGIN_BUTTON}     timeout=10s
    Sleep    2s
    Click Element       ${LOGIN_BUTTON}

Login Form Is Interactive
    Wait Until Element Is Visible   ${LOGIN_FORM}       timeout=5s
    Wait Until Element Is Enabled   ${LOGIN_CONTINUE_BUTTON}    timeout=2s
    Wait Until Element Is Enabled   ${GOOGLE_LOGIN_BUTTON}      timeout=2s
    Wait Until Element Is Enabled   ${EMAIL_FIELD}          timeout=2s
    Wait Until Element Is Enabled   ${PASSWORD_FIELD}       timeout=2s
Input Username And Password
    [Arguments]     ${email}     ${password}
 
    Wait Until Element Is Enabled     ${EMAIL_FIELD}
    Input Text                        ${EMAIL_FIELD}       ${email}
    Wait Until Element Is Enabled     ${PASSWORD_FIELD}
    Input Text                        ${PASSWORD_FIELD}       ${password}
Click Continue Button
    Wait Until Element Is Enabled   ${LOGIN_CONTINUE_BUTTON}     timeout=10s
    Click Element       ${LOGIN_CONTINUE_BUTTON}
 
Click Google Oauth Button
    Wait Until Element Is Enabled    ${GOOGLE_OAUTH_BUTTON}    timeout=10s
    Click Element        ${GOOGLE_OAUTH_BUTTON}
 
Input Google Account
    [Arguments]     ${google_email}
    Wait Until Element Is Enabled    ${GOOGLE_ACCOUNT_FIELD}    timeout=10s
    Input Text        ${GOOGLE_ACCOUNT_FIELD}       ${google_email}

Input Google Password
    [Arguments]     ${google_password}
    Wait Until Element Is Enabled    ${GOOGLE_PASSWORD_FIELD}    timeout=10s
    Input Text        ${GOOGLE_PASSWORD_FIELD}       ${google_password}

Login Succesfully
    Wait Until Element Is Enabled    ${READING_BUTTON}        timeout=10s
    Wait Until Element Is Enabled    ${WRITING_BUTTON}        timeout=10s
    Wait Until Element Is Enabled    ${MATH_NO_CAL_BUTTON}        timeout=10s
    Wait Until Element Is Enabled    ${MATH_CAL_BUTTON}        timeout=10s
User Already Sign In 
    Open Home Page Using Chrome Browser
    Click Login Button
    Input Username And Password    ${VALID_EMAIL}    ${VALID_PASSWORD} 
    Click Continue Button
    Login Succesfully

Click Profile Icon 
    Wait Until Element Is Enabled    ${PROFILE_ICON}    timeout=10s
    Click Element    ${PROFILE_ICON}
Click Setting Icon 
    
    Wait Until Element Is Enabled    ${SETTING_ICON}    timeout=10s
    Click Element    ${SETTING_ICON}
Click Logout Button
    Wait Until Element Is Enabled    ${LOGOUT_BUTTON}    timeout=10s
    Click Element    ${LOGOUT_BUTTON}
Check Logout 
    Wait Until Element Is Visible    ${CHECK_LOGOUT}    timeout=5s
    Wait Until Element Is Enabled    ${CHECK_LOGOUT_BUTTON}    timeout=5s
    Click Element    ${CHECK_LOGOUT_BUTTON}
Logout Succesfully
    Wait Until Element Is Visible    ${LOGIN_BUTTON}        timeout=10s