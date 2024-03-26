*** Settings ***
Library    SeleniumLibrary
Variables  variables.py

*** Keywords ***
I Open Browser
    Run Keyword If   "${browser}" == "headless"    Open Browser Headless
    ...  ELSE
    ...  Open Chrome Browser
Open Browser Headless
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method     ${options}    add_argument    --headless
    Call Method     ${options}    add_argument     --disable-gpu
    Call Method     ${options}    add_argument     --no-sandbox
    Call Method     ${options}    add_argument     --disable-dev-shm-usage
    Create Webdriver     Chrome    chrome_options=${options}
    Set Window Size   1600  900
    Go To    ${url}
Open Chrome Browser
    Open Browser    ${url}   ${browser}
I Close All Browsers
    Close All Browsers


