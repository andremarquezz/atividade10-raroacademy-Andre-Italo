*** Settings ***

Resource   ../../base.robot

Library    XML

*** Keywords ***

Aguarda e verifica que o elemento esta visivel
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
    Element Should Be Visible        ${element}

Aguarda e clica no elemento
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
    Click Element                    ${element}

Aguarda e verifica que o elemento esta visivel e contem o texto
    [Arguments]    ${element}    ${text}
    Wait Until Element Is Visible    ${element}
    Element Should Be Visible        ${element}
    Element Should Contain Text      ${element}    ${text} 

Aguarda e insere o texto no elemento
    [Arguments]    ${element}    ${text}
    Wait Until Element Is Visible    ${element}
    Clear Text                        ${element}
    Input Text                       ${element}    ${text}