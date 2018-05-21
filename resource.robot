*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           Selenium2Library

*** Variables ***
${BROWSER}        Firefox
${SCREENOUTPUT}    screenshot
2
*** Keywords ***
Open Browser With Chrome Headless
    [Arguments]    ${url}
    ${chromeOptions}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chromeOptions}   add_argument    headless
    Call Method    ${chromeOptions}   add_argument    disable-gpu
    ${chromedriver}=    Set Variable    ./driver/chromedriver
    Create Webdriver    Chrome    chrome    executable_path=${chromedriver}    chrome_options=${chromeOptions}
    Go To    ${url}

Open Browser With Maximize Window
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}
    # Open Browser With Chrome Headless    ${url}
    Maximize Browser Window

Capture Page Screenshot With Date
    [Arguments]    ${position}
    ${Date}=    Get Time    result_format=%Y-%m-%d
    Capture Page Screenshot    ${SCREENOUTPUT}/${position}/${Date}.png
