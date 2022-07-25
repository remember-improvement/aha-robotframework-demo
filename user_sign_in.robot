** Settings ***

Library     Selenium2Library

*** Variables ***
${HOMEPAGE}     https://app.earnaha.com
${TMP_PATH}                 /tmp
${LOGIN_BUTTON}     xpath:/html/body/div[1]/div[3]/div[1]/div[3]/div[2]/div/button[2]
${LOGIN_FORM}       xpath:/html/body/div/main/section/div/div/div/form
${LOGIN_CONTINUE_BUTTON}   xpath:/html/body/div/main/section/div/div/div/form/div[2]/button
${GOOGLE_LOGIN_BUTTON}      xpath:/html/body/div/main/section/div/div/div/div[3]/form/button
${EMAIL_FIELD}          xpath:/html/body/div/main/section/div/div/div/form/div[1]/div/div[1]/div/input
${PASSWORD_FIELD}       xpath:/html/body/div/main/section/div/div/div/form/div[1]/div/div[2]/div/input
*** Keywords ***
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
    Click Element       ${LOGIN_BUTTON}

Login Form Is Interactive
    Wait Until Element Is Visible   ${LOGIN_FORM}       timeout=5s
    Wait Until Element Is Enabled   ${LOGIN_CONTINUE_BUTTON}    timeout=2s
    Wait Until Element Is Enabled   ${GOOGLE_LOGIN_BUTTON}      timeout=2s
    Wait Until Element Is Enabled   ${EMAIL_FIELD}          timeout=2s
    Wait Until Element Is Enabled   ${PASSWORD_FIELD}       timeout=2s
Input Username And Password
    [Arguments]     ${email}     ${password}

    Wait Until Element Is Enabled     ${EMAIL_FIELD_FIELD}
    Input Text                        ${EMAIL_FIELD_FIELD}       ${email}
    Wait Until Element Is Enabled     ${PASSWORD_FIELD}
    Input Text                        ${PASSWORD_FIELD}       ${password}
*** Test Cases ***

TC_001 Login Page Element
    GIVEN Open Home Page Using Chrome Browser
    WHEN Click Login Button
    THEN Login Form Is Interactive



