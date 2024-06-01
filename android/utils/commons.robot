*** Settings ***

Resource   ../../base.robot


*** Keywords ***
Aguardar e Clicar no Elemento
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element                    ${locator}

Verificar Texto no Atributo Content-Desc do Elemento
    [Arguments]    ${locator}    ${regex}
    ${desc}=    Get Element Attribute    ${locator}    content-desc
    Should Match Regexp    ${desc}    ${regex}

