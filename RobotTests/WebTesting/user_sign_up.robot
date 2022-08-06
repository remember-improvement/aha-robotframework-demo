*** Settings ***
Library     Selenium2Library
Resource     user_keyword.robot
Library     libraries.py
Library    String 
Library    ImapLibrary2
Test Teardown    Close Browser
*** Variable ***
${SIGNUP_BUTTON}    xpath=/html/body/div[1]/div[3]/div[1]/div[3]/div[2]/div/button[1]
${RESEND_BUTTON}    xpath=/html/body/div[1]/div[3]/div[1]/div[3]/div[2]/div/button[1]
${VERIFY_TITLE}     xpath=/html/body/div[1]/div[3]/div[1]/div[3]/div[2]/h3
${VERIFY_MAIL}    xpath=/html/body/div[2]/div/div/table/tbody/tr
${VERIFY_LINK}     //a[contains(text(),'https://cmsapi.earnaha.com/v1')]
${CHANGE_TYPE_BUTTON}    xpath=//*[@class='dropdown-standalone dropdown-outlined']
${TEXT_TYPE}    xpath=//li[.//text()='Text']
*** Keywords ***
Generate Random Data
    ${VALID_RANDOM_EMAIL}=     generate_random_email
    Set Global Variable     ${VALID_RANDOM_EMAIL}
    ${VALID_RANDOM_PASSWORD}=          generate_random_password
    Set Global Variable     ${VALID_RANDOM_PASSWORD}
Click Signup Button 
    Wait Until Element Is Enabled   ${SIGNUP_BUTTON}     timeout=10s
    Sleep    2s
    Click Element       ${SIGNUP_BUTTON}
Email Has Been Sent
    Wait Until Element Is Visible    ${VERIFY_TITLE}    timeout=10s
    ${title}=     Get Text    ${VERIFY_TITLE}
    Should Be Equal As Strings    ${title}    Verify Email
    Wait Until Element Is Enabled    ${RESEND_BUTTON}    timeout=10s
Go To Email Server
    ${EMAIL_ACCOUNT}=    Fetch From Left    ${VALID_RANDOM_EMAIL}[:8]    @
    Open Browser    https://disposeamail.com/mail/${EMAIL_ACCOUNT}   chrome
    Maximize Browser Window
Click Subject
    Wait Until Element Is Enabled    ${VERIFY_MAIL}    timeout=10s
    Click Element    ${VERIFY_MAIL}
Click Verify Link 
    Select Frame    //iframe
    Click Link     ${VERIFY_LINK}
    # Wait Until Element Is Visible    ${VERIFY_LINK}    timeout=10s
    # Click Link    ${VERIFY_LINK}
    
*** Test Case ***
TC_001 Sign Up Email Has Been Sent
    [Setup]    Generate Random Data
    GIVEN Open Home Page Using Chrome Browser
    Sleep    2s
    WHEN Click Signup Button 
    Sleep    2s
    AND Input Username And Password        ${VALID_RANDOM_EMAIL}    ${VALID_RANDOM_PASSWORD}
    Sleep    2s
    AND Click Continue Button
    Sleep    2s
    THEN Email Has Been Sent

TC_002 Verify Email 
   
    Given Go To Email Server
    Sleep    2s
    WHEN Click Subject
    Sleep     2s
    AND Click Verify Link
    

