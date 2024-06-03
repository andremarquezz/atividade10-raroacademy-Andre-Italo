*** Settings ***

Resource    ../../base.robot

*** Variables ***

#BTN
${BTN_NEW}              id=br.com.pztec.estoque:id/Button1
${BTN_SAVE}             id=br.com.pztec.estoque:id/btn_gravar_assunto
${BTN_MENU}             id=br.com.pztec.estoque:id/Button3
${BTN_EDIT}             id=br.com.pztec.estoque:id/editar
${BTN_DELETE}           id=br.com.pztec.estoque:id/deletar
${BTN_ADD_STOCK}            id=br.com.pztec.estoque:id/entrada
${BTN_REMOVE_STOCK}           id=br.com.pztec.estoque:id/saida
${BTN_UPDATE}            id=br.com.pztec.estoque:id/btn_salvar
#TEXT
${TEXT_PRODUCT}         id=br.com.pztec.estoque:id/textView3
${TEXT_PRODUCT_REGISTRATION}     xpath=//android.widget.TextView[@text="Cadastro de Produto"]
${TEXT_CODE}            xpath=//android.widget.TextView[@text="Código"]
${TEXT_DESCRIPTION}     xpath=//android.widget.TextView[@text="Descrição"]
${TEXT_UNIT}            xpath=//android.widget.TextView[@text="Unidade"]
${TEXT_QUANTITY}        xpath=//android.widget.TextView[@text="Quantidade"]
${TEXT_PRICE}           xpath=//android.widget.TextView[@text="Val.Unit."]
${TEXT_LOTE}            xpath=//android.widget.TextView[@text="Lote"]
${ERROR_MESSAGE}        id=android:id/message
#INPUT
${INPUT_ADD_STOCK}      id=br.com.pztec.estoque:id/txt_qtdentrada
${INPUT_REMOVE_STOCK}   id=br.com.pztec.estoque:id/txt_qtdsaida


${CODE}           id=br.com.pztec.estoque:id/txt_codigo
${DESCRIPTION}    id=br.com.pztec.estoque:id/txt_descricao
${UNIT}           id=br.com.pztec.estoque:id/txt_unidade    
${QUANTITY}       id=br.com.pztec.estoque:id/txt_quantidade
${PRICE}          id=br.com.pztec.estoque:id/txt_valunit
${LOTE}           id=br.com.pztec.estoque:id/txt_lote
${TABLE_PRODUCT}   id=br.com.pztec.estoque:id/tabela_itens



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

Dado que o usuário acessa a página de inventário
    Wait Until Element Is Visible    ${BTN_MENU}
    Wait Until Element Is Visible    ${BTN_NEW}
    Element Should Be Visible        ${BTN_MENU}
    Element Should Be Visible        ${BTN_NEW}


Quando preenche as informações do produto
    Input Text                       ${CODE}           123
    Input Text                       ${DESCRIPTION}    Produto Teste
    Input Text                       ${UNIT}           UN
    Input Text                       ${QUANTITY}       10
    Input Text                       ${PRICE}          10.00
    Input Text                       ${LOTE}           123456

Quando clica em "Editar"
    Wait Until Element Is Visible    ${BTN_EDIT}
    Click Element                ${BTN_EDIT}

Quando clica no botão "Deletar"
    Wait Until Element Is Visible    ${BTN_DELETE}
    Click Element                ${BTN_DELETE}

Quando clica em "Entrada"
    Wait Until Element Is Visible    ${BTN_ADD_STOCK}
    Click Element               ${BTN_ADD_STOCK}

Quando clica em "Saida"
    Wait Until Element Is Visible    ${BTN_REMOVE_STOCK}
    Click Element               ${BTN_REMOVE_STOCK}

E clica no botão "Salvar"
    Wait Until Element Is Visible    ${BTN_SAVE}
    Click Element                    ${BTN_SAVE}

E clica no botão para atualizar
    Wait Until Element Is Visible    ${BTN_UPDATE}
    Click Element                    ${BTN_UPDATE}

E confirma a exclusão
    Click Element                    id=android:id/button1

E adiciona em estoque "50"
    Input Text                       ${INPUT_ADD_STOCK}    50

E diminui em estoque "5" 
    Wait Until Element Is Visible    ${INPUT_REMOVE_STOCK}
    Input Text                       ${INPUT_REMOVE_STOCK}       5

E diminui em estoque "20"  
  Wait Until Element Is Visible    ${INPUT_REMOVE_STOCK}
    Input Text                       ${INPUT_REMOVE_STOCK}       20

E preenche a quantidade em estoque com "-10"
    Clear Text                       ${QUANTITY}
    Input Text                       ${QUANTITY}       -10

E existe um produto cadastrado
    Click Element                    ${BTN_NEW}
    Wait Until Element Is Visible    ${TEXT_PRODUCT}
    Input Text                       ${CODE}           123
    Input Text                       ${DESCRIPTION}    Produto Teste
    Input Text                       ${UNIT}           UN
    Input Text                       ${QUANTITY}       10
    Input Text                       ${PRICE}          10.00
    Input Text                       ${LOTE}           123456
    Click Element                    ${BTN_SAVE}
    Wait Until Element Is Visible    ${TABLE_PRODUCT}

E edita a quantidade em estoque para "120"
    Wait Until Element Is Visible    ${QUANTITY}
    Input Text                       ${QUANTITY}       120

Então o produto está listado no inventário
    Wait Until Element Is Visible    ${BTN_MENU}
    Element Should Be Visible        ${BTN_MENU}
    Element Should Contain Text      ${CODE}          123
    Element Should Contain Text      ${DESCRIPTION}   Produto Teste
    Element Should Contain Text      ${UNIT}          UN
    Element Should Contain Text      ${QUANTITY}      10
    Element Should Contain Text      ${PRICE}         10,00
    Element Should Contain Text      ${LOTE}          123456

Então o produto está listado no inventário com o novo estoque
    Wait Until Element Is Visible    ${BTN_MENU}
    Element Should Be Visible        ${BTN_MENU}
    Element Should Contain Text      ${CODE}          123
    Element Should Contain Text      ${DESCRIPTION}   Produto Teste
    Element Should Contain Text      ${UNIT}          UN
    Element Should Contain Text      ${QUANTITY}      120
    Element Should Contain Text      ${PRICE}         10,00
    Element Should Contain Text      ${LOTE}          123456

Então o produto não está listado no inventário
    Wait Until Element Is Visible      ${BTN_MENU}
    Page Should Not Contain Element    ${CODE}
    Page Should Not Contain Element    ${DESCRIPTION}
    Page Should Not Contain Element    ${UNIT}
    Page Should Not Contain Element    ${QUANTITY}
    Page Should Not Contain Element    ${PRICE}
    Page Should Not Contain Element    ${LOTE}

Então o produto está listado no inventário com a quantidade atualizada
    Wait Until Element Is Visible    ${BTN_MENU}
    Element Should Be Visible        ${BTN_MENU}
    Element Should Contain Text      ${CODE}          123
    Element Should Contain Text      ${DESCRIPTION}   Produto Teste
    Element Should Contain Text      ${UNIT}          UN
    Element Should Contain Text      ${QUANTITY}      60
    Element Should Contain Text      ${PRICE}         10,00
    Element Should Contain Text      ${LOTE}          123456

Então o produto está listado no inventário com a quantidade reduzida em 5
    Wait Until Element Is Visible    ${BTN_MENU}
    Element Should Be Visible        ${BTN_MENU}
    Element Should Contain Text      ${CODE}          123
    Element Should Contain Text      ${DESCRIPTION}   Produto Teste
    Element Should Contain Text      ${UNIT}          UN
    Element Should Contain Text      ${QUANTITY}      5
    Element Should Contain Text      ${PRICE}         10,00
    Element Should Contain Text      ${LOTE}          123456

Então o sistema exibe uma mensagem de erro informando que a quantidade não pode ser negativa
    Wait Until Element Is Visible    ${ERROR_MESSAGE}
    Element Should Be Visible        ${ERROR_MESSAGE}
    Element Should Contain Text      ${ERROR_MESSAGE}    Estoque insuficiente
