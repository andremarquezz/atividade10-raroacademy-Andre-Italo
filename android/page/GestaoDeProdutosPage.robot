*** Settings ***

Resource    ../../base.robot

*** Variables ***

#BTN
${BTN_NEW}              id=br.com.pztec.estoque:id/Button1
${BTN_SAVE}             id=br.com.pztec.estoque:id/btn_gravar_assunto
${BTN_MENU}             id=br.com.pztec.estoque:id/Button3
#TEXT
${TEXT_PRODUCT}         id=br.com.pztec.estoque:id/textView3
${TEXT_PRODUCT_REGISTRATION}     xpath=//android.widget.TextView[@text="Cadastro de Produto"]
${TEXT_CODE}            xpath=//android.widget.TextView[@text="Código"]
${TEXT_DESCRIPTION}     xpath=//android.widget.TextView[@text="Descrição"]
${TEXT_UNIT}            xpath=//android.widget.TextView[@text="Unidade"]
${TEXT_QUANTITY}        xpath=//android.widget.TextView[@text="Quantidade"]
${TEXT_PRICE}           xpath=//android.widget.TextView[@text="Val.Unit."]
${TEXT_LOTE}            xpath=//android.widget.TextView[@text="Lote"]
#INPUT
${CODE}           id=br.com.pztec.estoque:id/txt_codigo
${DESCRIPTION}    id=br.com.pztec.estoque:id/txt_descricao
${UNIT}           id=br.com.pztec.estoque:id/txt_unidade    
${QUANTITY}       id=br.com.pztec.estoque:id/txt_quantidade
${PRICE}          id=br.com.pztec.estoque:id/txt_valunit
${LOTE}           id=br.com.pztec.estoque:id/txt_lote



*** Keywords ***

Dado que o usuário acessa a página de cadastro de produto
    Wait Until Element Is Visible    ${BTN_NEW}
    Click Element                    ${BTN_NEW}
    Wait Until Element Is Visible    ${TEXT_PRODUCT}
    Element Should Be Visible        ${TEXT_PRODUCT}
    Element Should Be Visible        ${TEXT_CODE}
    Element Should Be Visible        ${TEXT_DESCRIPTION}
    Element Should Be Visible        ${TEXT_UNIT}
    Element Should Be Visible        ${TEXT_QUANTITY}    
    Element Should Be Visible        ${TEXT_PRICE}
    Element Should Be Visible        ${TEXT_LOTE}

Quando o usuário preenche as informações do produto
    Input Text                       ${CODE}           123
    Input Text                       ${DESCRIPTION}    Produto Teste
    Input Text                       ${UNIT}           UN
    Input Text                       ${QUANTITY}       10
    Input Text                       ${PRICE}          10.00
    Input Text                       ${LOTE}           123456

E o usuário clica no botão "Salvar"
    Click Element                    ${BTN_SAVE}

Então o produto está listado no inventário
    Wait Until Element Is Visible    ${BTN_MENU}
    Element Should Be Visible        ${BTN_MENU}
    Element Should Contain Text      ${CODE}          123
    Element Should Contain Text      ${DESCRIPTION}   Produto Teste
    Element Should Contain Text      ${UNIT}          UN
    Element Should Contain Text      ${QUANTITY}      10
    Element Should Contain Text      ${PRICE}         10,00
    Element Should Contain Text      ${LOTE}          123456
