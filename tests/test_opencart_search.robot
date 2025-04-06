*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}            https://demo.opencart.com/
${BROWSER}        chrome
${SEARCH_TERM}    macbook

*** Test Cases ***
Buscar Produto No OpenCart
    [Documentation]    
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=search
    Input Text    name=search    ${SEARCH_TERM}
    Click Element    xpath=//button[@class='btn btn-default btn-lg']
    Wait Until Page Contains    ${SEARCH_TERM}
    Capture Page Screenshot

    Close Browser