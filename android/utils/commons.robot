*** Settings ***

Resource   ../../base.robot

Library    XML

*** Keywords ***

Aguarda e verifica que o elemento esta visivel
    [Arguments]                      ${locator}
    Wait Until Element Is Visible    ${locator}
    Element Should Be Visible        ${locator}

Aguarda e clica no elemento
    [Arguments]                      ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element                    ${locator}

Aguarda e verifica que o elemento esta visivel e contem o texto
    [Arguments]                      ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}
    Element Should Be Visible        ${locator}
    Element Should Contain Text      ${locator}    ${text} 

Aguarda e insere o texto no elemento
    [Arguments]    ${locator}    ${text}
    Wait Until Keyword Succeeds    10    1  Wait Until Element Is Visible      ${locator} 
    Clear Text     ${locator}
    Input Text     ${locator}    ${text}

Adiciona produto ao estoque
    [Arguments]     ${TEXT_DESCRIPTION}  ${TEXT_UNIT}  ${TEXT_QUANTITY}  ${TEXT_PRICE}   ${TEXT_LOTE}
    Aguarda e clica no elemento                           ${BTN_NEW}
    Aguarda e insere o texto no elemento                  ${DESCRIPTION}    ${TEXT_DESCRIPTION}
    Aguarda e insere o texto no elemento                  ${UNIT}           ${TEXT_UNIT}           
    Aguarda e insere o texto no elemento                  ${QUANTITY}       ${TEXT_QUANTITY}                
    Aguarda e insere o texto no elemento                  ${PRICE}          ${TEXT_PRICE}      
    Aguarda e insere o texto no elemento                  ${LOTE}           ${TEXT_LOTE}
    Click Element                                         ${BTN_SAVE}

Adiciona produtos ao estoque
    [Arguments]    @{PRODUCTS}
    FOR    ${PRODUCT}    IN    @{PRODUCTS}
        ${TEXT_DESCRIPTION}=   Set Variable    ${PRODUCT}[0]
        ${TEXT_UNIT}=          Set Variable    ${PRODUCT}[1]
        ${TEXT_QUANTITY}=      Set Variable    ${PRODUCT}[2]
        ${TEXT_PRICE}=         Set Variable    ${PRODUCT}[3]
        ${TEXT_LOTE}=          Set Variable    ${PRODUCT}[4]
        Adiciona produto ao estoque    ${TEXT_DESCRIPTION}    ${TEXT_UNIT}    ${TEXT_QUANTITY}    ${TEXT_PRICE}    ${TEXT_LOTE}
    END