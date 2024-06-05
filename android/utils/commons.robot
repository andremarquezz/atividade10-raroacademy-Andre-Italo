*** Settings ***

Resource   ../../base.robot

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
    FOR    ${TEXT_DESCRIPTION}    ${TEXT_UNIT}    ${TEXT_QUANTITY}    ${TEXT_PRICE}    ${TEXT_LOTE}    IN    @{PRODUCTS}
        Adiciona produto ao estoque    ${TEXT_DESCRIPTION}    ${TEXT_UNIT}    ${TEXT_QUANTITY}    ${TEXT_PRICE}    ${TEXT_LOTE}
    END

Seleciona elemento e formata para data atual 
    Run Keyword And Return    Get Current Date    result_format=%d/%m/%Y

Aguarda e verifica data da exportação
    [Arguments]    ${element}
    ${day}=    Seleciona elemento e formata para data atual 
    Element Should Contain Text    ${element}    ${day}

Acessa e formata data atual
    Run Keyword And Return    Get Current Date    result_format=%d/%m/%Y

Selecionar na barra do celular a opção de voltar
    Press Keycode    4

Selecionar arquivo e importar 
    [Arguments]    ${element}
    Swipe By Percent   10    90    80    10    1000
    Aguarda e clica no elemento                                        ${SELECT_CSV} 
    Aguarda e clica no elemento                                        ${element}
    Aguarda e clica no elemento                                        ${MODAL_OK} 
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${MESSAGE_MODAL}     1 registros inseridos.
    Aguarda e clica no elemento                                        ${MODAL_OK} 