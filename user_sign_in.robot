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
${EMAIL_FIELD}          xpath:/html/body/div/main/section/div/div/div/form/div[1]/div/div[1]/div/input
${PASSWORD_FIELD}       xpath:/html/body/div/main/section/div/div/div/form/div[1]/div/div[2]/div/input
${VALID_EMAIL}        aha@disposeamail.com
${VALID_PASSWORD}      ahaAHA1qaz@WSX
${PROFILE_ICON}        xpath:/html/body/div[1]/div[2]/div[2]/div/a[4]
${GOOGLE_OAUTH_BUTTON}    xpath:/html/body/div/main/section/div/div/div/div[3]/form/button/span[2]
${GOOGLE_ACCOUNT_FIELD}        name:identifier
${GOOGLE_PASSWORD_FIELD}        name:password
***Keywords***
Open Home Page Using Chrome Browser
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  --no-sandbox
    ${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}
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
    Wait Until Element Is Enabled    ${PROFILE_ICON}        timeout=10s
   
   
*** Test Cases ***
 
TC_001 Login Page Element
    GIVEN Open Home Page Using Chrome Browser
    WHEN Click Login Button
    THEN Login Form Is Interactive
 
TC_002 Valid Login With Email
    GIVEN Open Home Page Using Chrome Browser
    WHEN Click Login Button
    AND Input Username And Password    ${VALID_EMAIL}    ${VALID_PASSWORD}
    AND Click Continue Button
    THEN Login Succesfully
 
TC_003 Valid Login With Google Oauth
    GIVEN Open Home Page Using Chrome Browser
    WHEN Click Login Button
    AND Click Google Oauth Button
    AND Input Google Account        nicklee9176@gmail.com
    AND Input Google Password       1qaz2wsx3edc
    THEN Login Succesfully