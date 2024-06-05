*** Settings ***

Resource    ../../base.robot
Library    XML

*** Variables ***

${BTN_IMPORT}                id=br.com.pztec.estoque:id/btn_importar
${TITLE_IMPORT}              xpath=//android.widget.TextView[@text="Importar dados"]
${REST_PROD}                 id=br.com.pztec.estoque:id/btn_produtos
${REST_ENT}                  id=br.com.pztec.estoque:id/btn_entradas
${REST_SAI}                  id=br.com.pztec.estoque:id/btn_saidas
${REST_GRUP}                 id=br.com.pztec.estoque:id/btn_grupos
${SELECT_CSV}                xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="Estoque"]
${SELECT_PROD_CSV}           xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="produtos.csv"]
${MODAL_OK}                  id=android:id/button1
${MESSAGE_MODAL}             id=android:id/message

*** Keywords ***

Quando o usuário acessa a página de importação
    Aguarda e clica no elemento    ${BTN_MENU}
    Aguarda e clica no elemento    ${BTN_IMPORT}

E seleciona a opção de restaurar produtos
    Aguarda e clica no elemento    ${REST_PROD}

    
E o produto importado deve ser visualizado na página de produtos
    Selecionar na barra do celular a opção de voltar
    Selecionar na barra do celular a opção de voltar
    Aguarda e verifica que o elemento esta visivel                         ${BTN_MENU}
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${DESCRIPTION}   Produto Teste    
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${UNIT}          UN    
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${QUANTITY}      10
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${PRICE}         10,00
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${LOTE}          123456

Então deve visualizar as opções para importar um relatorio 
    Aguarda e verifica que o elemento esta visivel                     ${TITLE_IMPORT}
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${REST_PROD}       RESTAURAR PRODUTOS  
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${REST_ENT}        RESTAURAR ENTRADAS
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${REST_SAI}        RESTAURAR SAÍDAS
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${REST_GRUP}       GRUPO DE PRODUTOS

Então deve ser possivel selecionar o arquivo exportado anteriormente e importar ele novamente 
    Swipe By Percent   10    90    80    10    1000
    Aguarda e clica no elemento                                        ${SELECT_CSV} 
    Aguarda e clica no elemento                                        ${SELECT_PROD_CSV} 
    Aguarda e clica no elemento                                        ${MODAL_OK} 
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${MESSAGE_MODAL}     1 registros inseridos.
    Aguarda e clica no elemento                                        ${MODAL_OK} 






