*** Settings ***
Library  SeleniumLibrary
Variables  variables.py
*** Keywords ***
Input username
    [Arguments]  ${username}
    Click Element  ${username_input}
    Input text  ${username_input}  ${username}
Input password
    Click Element  ${password_input}
    Input text  ${password_input}  ${password}
Click login button
    Click Element  ${login_button}
I login as a standard user
    Input username  ${standard_username}
    Input password
    Click login button
I login as a locked user
    Input username  ${locked_username}
    Input password
An error appears on the login page
    ${text}=  Get Text  ${login_error}
    Element Should Contain  ${login_error}  Epic sadface: Sorry, this user has been locked out.
Logout
    Click Element  ${menu}
    Wait Until Element Is Visible  ${logout}
    Click Element  ${logout}