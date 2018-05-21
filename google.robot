*** Settings ***
Documentation     A test suite with a single test.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

Suite Setup    Open Browser To Google
Suite Teardown    Close Browser
# Test Setup
# Test Teardown

*** Test Cases ***
Valid Google Index Page
    Google Should Be Open
    Capture Page Screenshot With Date    google-index

Valid Google Search
    Input Keyword    新垣結衣
    Search Keyword
    Wait Until Page Contains Element    css:.med
    Wait Until Page Contains    新垣結衣
    Capture Page Screenshot With Date    google-search-result

*** Keywords ***
Open Browser To Google
    Open Browser With Maximize Window    https://images.google.com.tw/
    Maximize Browser Window

Google Should Be Open
    Title Should Be    Google 圖片

Input Keyword
    [Arguments]    ${keyword}
    Input Text    id:lst-ib    ${keyword}

Search Keyword
    Press Key    id:lst-ib    \\13
