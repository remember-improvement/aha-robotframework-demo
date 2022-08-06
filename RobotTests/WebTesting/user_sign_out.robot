*** Settings ***
Resource    user_keyword.robot
Library     Selenium2Library
# Test Setup    User Already Sign In 
Test Teardown    Close Browser
*** Variables ***
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

