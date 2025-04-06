*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${URL}            http://automationpractice.com/index.php
${BROWSER}        chrome
${SEARCH_TERM}    dress

*** Test Cases ***
Buscar E Adicionar Produto Ao Carrinho
    [Documentation]    
    Open Browser    ${URL}    ${BROWSER}    
    Maximize Browser Window                 
    Wait Until Element Is Visible    id=search_query_top    
    Input Text    id=search_query_top    ${SEARCH_TERM}      
    Click Button    name=submit_search                         
    Wait Until Page Contains    ${SEARCH_TERM}                 
    Click Element    xpath=//ul[contains(@class,"product_list")]//a[@class="product-name"]    
    Wait Until Element Is Visible    id=add_to_cart    
    Click Button    id=add_to_cart                     
    Wait Until Page Contains    Product successfully added to your shopping cart   
    Capture Page Screenshot                                          

    Close Browser    
