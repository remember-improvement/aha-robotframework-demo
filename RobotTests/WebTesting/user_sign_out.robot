*** Settings ***
Resource    user_keyword.robot
Library     Selenium2Library
# Test Setup    User Already Sign In 
Test Teardown    Close Browser
*** Variables ***
${SETTING_ICON}        //a[@data-testid='menu-setting']
${LOGOUT_BUTTON}        //button[@class='MuiButtonBase-root css-163vojy']
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
    Sleep    10s
    AND Click Logout Button
    Sleep    2s
    AND Check Logout
    Sleep    2s
    THEN Logout Successfully

