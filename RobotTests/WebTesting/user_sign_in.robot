*** Settings ***
Resource     user_keyword.robot
Library     Selenium2Library
Test Teardown     Close Browser
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
   
   
*** Test Cases ***
 
TC_001 Login Page Element
    GIVEN Open Home Page Using Chrome Browser
    Sleep    2s
    WHEN Click Login Button
    Sleep    2s
    THEN Login Form Is Interactive
 
TC_002 Valid Login With Email
    GIVEN Open Home Page Using Chrome Browser
    Sleep    2s
    WHEN Click Login Button
    Sleep    2s
    AND Input Username And Password    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Sleep    2s
    AND Click Continue Button
    Sleep    2s
    THEN Login Successfully
 
TC_003 Valid Login With Google Oauth
    GIVEN Open Home Page Using Chrome Browser
    Sleep    2s
    WHEN Click Login Button
    Sleep    2s
    AND Click Google Oauth Button
    Sleep    2s
    AND Input Google Account        nicklee9176@gmail.com
    AND Input Google Password       1qaz2wsx3edc
    Sleep    2s
    THEN Login Successfully