*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.google.com

*** Test Cases ***
Pesquisar No Google
    Open Browser    ${URL}    chrome
    Input Text      name=q    EBAC Cursos
    Press Keys      name=q    ENTER
    Wait Until Page Contains    EBAC
    Capture Page Screenshot
    Close Browser
