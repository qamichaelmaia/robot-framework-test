*** Settings ***
Library    SeleniumLibrary    timeout=10
Suite Setup       Setup Screenshot On Failure
Suite Teardown    Remove Screenshot Listener
Library           SeleniumLibrary
Library           Screenshot


*** Keywords ***
Setup Screenshot On Failure
    Register Keyword To Run On Failure    Capture Page Screenshot

Remove Screenshot Listener
    Register Keyword To Run On Failure    None


*** Variables ***
${URL}            https://www.saucedemo.com/
${BROWSER}        chrome
${VALID_USER}     standard_user
${VALID_PASS}     secret_sauce
${INVALID_USER}   fake_user
${INVALID_PASS}   wrong_pass

*** Test Cases ***

Login Com Sucesso
    [Documentation]    Verifica se o login é realizado com sucesso com credenciais válidas.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${VALID_USER}
    Input Text    id=password     ${VALID_PASS}
    Click Button  id=login-button
    Wait Until Page Contains    Products
    Capture Page Screenshot
    Close Browser

Login Com Senha Inválida
    [Documentation]    Verifica se o sistema mostra erro com senha incorreta.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${VALID_USER}
    Input Text    id=password     ${INVALID_PASS}
    Click Button  id=login-button
    Wait Until Page Contains Element    css=.error-message-container
    Page Should Contain    Epic sadface: Username and password do not match
    Capture Page Screenshot
    Close Browser

Login Com Usuário Inválido
    [Documentation]    Verifica se o sistema bloqueia login com usuário inexistente.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${INVALID_USER}
    Input Text    id=password     ${VALID_PASS}
    Click Button  id=login-button
    Wait Until Page Contains Element    css=.error-message-container
    Page Should Contain    Epic sadface: Username and password do not match
    Capture Page Screenshot
    Close Browser

Login Com Campos Vazios
    [Documentation]    Verifica se o sistema exige preenchimento dos campos obrigatórios.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Button  id=login-button
    Wait Until Page Contains Element    css=.error-message-container
    Page Should Contain    Epic sadface: Username is required
    Capture Page Screenshot
    Close Browser

Logout Após Login
    [Documentation]    Verifica se o usuário pode deslogar com sucesso após o login.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${VALID_USER}
    Input Text    id=password     ${VALID_PASS}
    Click Button  id=login-button
    Wait Until Page Contains    Products

    # Abre menu e faz logout
    Click Element    id=react-burger-menu-btn
    Wait Until Element Is Visible    id=logout_sidebar_link
    Click Element    id=logout_sidebar_link

    Wait Until Element Is Visible    id=login-button
    Capture Page Screenshot
    Close Browser

Verificar Elementos Pós Login
    [Documentation]    Confirma que elementos da página de produtos estão visíveis após login.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=user-name    ${VALID_USER}
    Input Text    id=password     ${VALID_PASS}
    Click Button  id=login-button
    Wait Until Page Contains    Products

    Page Should Contain Element    xpath=//div[@class='inventory_list']
    Page Should Contain Element    xpath=//span[@class='title' and text()='Products']
    Page Should Contain Element    xpath=//div[contains(@class, 'inventory_item')]

    Capture Page Screenshot
    Close Browser
