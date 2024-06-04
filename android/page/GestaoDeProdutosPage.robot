*** Settings ***

Resource    ../../base.robot

*** Variables ***

#BTN
${BTN_NEW}                       id=br.com.pztec.estoque:id/Button1
${BTN_SAVE}                      id=br.com.pztec.estoque:id/btn_gravar_assunto
${BTN_MENU}                      id=br.com.pztec.estoque:id/Button3
${BTN_EDIT}                      id=br.com.pztec.estoque:id/editar
${BTN_DELETE}                    id=br.com.pztec.estoque:id/deletar
${BTN_ADD_STOCK}                 id=br.com.pztec.estoque:id/entrada
${BTN_REMOVE_STOCK}              id=br.com.pztec.estoque:id/saida
${BTN_UPDATE}                    id=br.com.pztec.estoque:id/btn_salvar
#TEXT
${TEXT_PRODUCT}                  id=br.com.pztec.estoque:id/textView3
${TEXT_PRODUCT_REGISTRATION}     xpath=//android.widget.TextView[@text="Cadastro de Produto"]
${TEXT_CODE}                     xpath=//android.widget.TextView[@text="Código"]
${TEXT_DESCRIPTION}              xpath=//android.widget.TextView[@text="Descrição"]
${TEXT_UNIT}                     xpath=//android.widget.TextView[@text="Unidade"]
${TEXT_QUANTITY}                 xpath=//android.widget.TextView[@text="Quantidade"]
${TEXT_PRICE}                    xpath=//android.widget.TextView[@text="Val.Unit."]
${TEXT_LOTE}                     xpath=//android.widget.TextView[@text="Lote"]
${ERROR_MESSAGE}                 id=android:id/message
#INPUT
${INPUT_ADD_STOCK}               id=br.com.pztec.estoque:id/txt_qtdentrada
${INPUT_REMOVE_STOCK}            id=br.com.pztec.estoque:id/txt_qtdsaida


${CODE}                          id=br.com.pztec.estoque:id/txt_codigo
${DESCRIPTION}                   id=br.com.pztec.estoque:id/txt_descricao
${UNIT}                          id=br.com.pztec.estoque:id/txt_unidade    
${QUANTITY}                      id=br.com.pztec.estoque:id/txt_quantidade
${PRICE}                         id=br.com.pztec.estoque:id/txt_valunit
${LOTE}                          id=br.com.pztec.estoque:id/txt_lote
${TABLE_PRODUCT}                 id=br.com.pztec.estoque:id/tabela_itens



*** Keywords ***

Dado que o usuário acessa a página de cadastro de produto
    Aguarda e clica no elemento                           ${BTN_NEW}
    Aguarda e verifica que o elemento esta visivel        ${TEXT_PRODUCT}
    Aguarda e verifica que o elemento esta visivel        ${TEXT_PRODUCT}
    Aguarda e verifica que o elemento esta visivel        ${TEXT_CODE}
    Aguarda e verifica que o elemento esta visivel        ${TEXT_DESCRIPTION}
    Aguarda e verifica que o elemento esta visivel        ${TEXT_UNIT}
    Aguarda e verifica que o elemento esta visivel        ${TEXT_QUANTITY}    
    Aguarda e verifica que o elemento esta visivel        ${TEXT_PRICE}
    Aguarda e verifica que o elemento esta visivel        ${TEXT_LOTE}

Dado que o usuário acessa a página de inventário
    Aguarda e verifica que o elemento esta visivel        ${BTN_MENU}
    Aguarda e verifica que o elemento esta visivel        ${BTN_NEW}

Quando preenche as informações do produto
    Aguarda e insere o texto no elemento                  ${DESCRIPTION}    RTX 2060
    Aguarda e insere o texto no elemento                  ${UNIT}           UN
    Aguarda e insere o texto no elemento                  ${QUANTITY}       10               
    Aguarda e insere o texto no elemento                  ${PRICE}          10.00
    Aguarda e insere o texto no elemento                  ${LOTE}           123456

Quando clica em "Editar"
    Aguarda e clica no elemento                           ${BTN_EDIT}

Quando clica no botão "Deletar"
    Aguarda e clica no elemento                           ${BTN_DELETE}

Quando clica em "Entrada"
    Aguarda e clica no elemento                           ${BTN_ADD_STOCK}
  
Quando clica em "Saida"
    Aguarda e clica no elemento                           ${BTN_REMOVE_STOCK}

E clica no botão "Salvar"
    Aguarda e clica no elemento                           ${BTN_SAVE}

E clica no botão para atualizar
    Aguarda e clica no elemento                           ${BTN_UPDATE}

E confirma a exclusão
    Aguarda e clica no elemento                           id=android:id/button1

E adiciona em estoque "50"
    Input Text                                            ${INPUT_ADD_STOCK}    50

E diminui em estoque "5" 
   Aguarda e insere o texto no elemento                   ${INPUT_REMOVE_STOCK}    5

E diminui em estoque "20"  
  Aguarda e insere o texto no elemento                    ${INPUT_REMOVE_STOCK}   20

E preenche a quantidade em estoque com "-10"
  Aguarda e insere o texto no elemento                    ${QUANTITY}       -10

E existe um produto cadastrado
    Adiciona produto ao estoque    RTX 2060    UN    10    10.00    123456
    Wait Until Element Is Visible                         ${TABLE_PRODUCT}

E edita a quantidade em estoque para "120"
    Aguarda e insere o texto no elemento                  ${QUANTITY}       120

Então o produto está listado no inventário
    Aguarda e verifica que o elemento esta visivel                         ${BTN_MENU}
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${DESCRIPTION}   RTX 2060
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${UNIT}          UN
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${QUANTITY}      10
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${PRICE}         10,00
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${LOTE}          123456

Então o produto está listado no inventário com o novo estoque
    Aguarda e verifica que o elemento esta visivel                         ${BTN_MENU}
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${DESCRIPTION}   RTX 2060
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${UNIT}          UN
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${QUANTITY}      120                     
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${PRICE}         10,00
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${LOTE}          123456

Então o produto não está listado no inventário
    Aguarda e verifica que o elemento esta visivel        ${BTN_MENU}
    Page Should Not Contain Element                       ${CODE}
    Page Should Not Contain Element                       ${DESCRIPTION}
    Page Should Not Contain Element                       ${UNIT}
    Page Should Not Contain Element                       ${QUANTITY}
    Page Should Not Contain Element                       ${PRICE}
    Page Should Not Contain Element                       ${LOTE}

Então o produto está listado no inventário com a quantidade atualizada
    Aguarda e verifica que o elemento esta visivel                                            ${BTN_MENU}
    Aguarda e verifica que o elemento esta visivel e contem o texto                           ${DESCRIPTION}   RTX 2060
    Aguarda e verifica que o elemento esta visivel e contem o texto                           ${UNIT}          UN
    Aguarda e verifica que o elemento esta visivel e contem o texto                           ${QUANTITY}      60
    Aguarda e verifica que o elemento esta visivel e contem o texto                           ${PRICE}         10,00
    Aguarda e verifica que o elemento esta visivel e contem o texto                           ${LOTE}          123456

Então o produto está listado no inventário com a quantidade reduzida em 5
    Aguarda e verifica que o elemento esta visivel                                            ${BTN_MENU}
    Aguarda e verifica que o elemento esta visivel e contem o texto                           ${DESCRIPTION}   RTX 2060
    Aguarda e verifica que o elemento esta visivel e contem o texto                           ${UNIT}          UN
    Aguarda e verifica que o elemento esta visivel e contem o texto                           ${QUANTITY}      5
    Aguarda e verifica que o elemento esta visivel e contem o texto                           ${PRICE}         10,00
    Aguarda e verifica que o elemento esta visivel e contem o texto                           ${LOTE}          123456

Então o sistema exibe uma mensagem de erro informando que a quantidade não pode ser negativa
    Aguarda e verifica que o elemento esta visivel                                            ${ERROR_MESSAGE}
    Aguarda e verifica que o elemento esta visivel e contem o texto                           ${ERROR_MESSAGE}    Estoque insuficiente
