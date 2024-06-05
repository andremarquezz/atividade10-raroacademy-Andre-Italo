*** Settings ***

Resource    ../../base.robot
Library    XML

*** Variables ***

${BTN_IMPORT}                id=br.com.pztec.estoque:id/btn_importar
${TITLE_IMPORT}              xpath=//android.widget.TextView[@text="Importar dados"]
${REST_PROD}                 id=br.com.pztec.estoque:id/btn_produtos
${REST_ENT}                  id=br.com.pztec.estoque:id/btn_entradas
${REST_SAI}                  id=br.com.pztec.estoque:id/btn_saidas
${REST_GRUOP}                id=br.com.pztec.estoque:id/btn_grupos
${SELECT_CSV}                xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="Estoque"]
${SELECT_PROD_CSV}           xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="produtos.csv"]
${SELECT_ENT_CSV}            xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="entradas.csv"]
${SELECT_SAI_CSV}            xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="saidas.csv"]
${SELECT_GRUOP_CSV}          xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="grupos.csv"]
${MODAL_OK}                  id=android:id/button1
${MESSAGE_MODAL}             id=android:id/message
${DESC_GROUP}                id=br.com.pztec.estoque:id/descricao

*** Keywords ***

Dado que o usuário acessa a página de importação
    Aguarda e clica no elemento    ${BTN_MENU}
    Aguarda e clica no elemento    ${BTN_IMPORT}
    
Quando o usuário acessa a página de importação
    Aguarda e clica no elemento    ${BTN_MENU}
    Aguarda e clica no elemento    ${BTN_IMPORT}

E seleciona a opção de restaurar produtos
    Aguarda e clica no elemento    ${REST_PROD}

E seleciona a opção de restaurar entrada
    Aguarda e clica no elemento    ${REST_ENT}

E seleciona a opção de restaurar saida
    Aguarda e clica no elemento    ${REST_SAI}

E selecionar a opção de restaurar grupos
    Aguarda e clica no elemento    ${REST_GRUOP} 
    
E o produto importado deve ser visualizado na página de produtos
    Selecionar na barra do celular a opção de voltar
    Selecionar na barra do celular a opção de voltar
    Aguarda e verifica que o elemento esta visivel                         ${BTN_MENU}
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${DESCRIPTION}   Produto Teste    
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${UNIT}          UN    
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${QUANTITY}      10
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${PRICE}         10,00
    Aguarda e verifica que o elemento esta visivel e contem o texto        ${LOTE}          123456

E realiza uma saida com o mesmo valor da entrada após a geração do relatorio 
    Wait Until Element Is Visible                         ${TABLE_PRODUCT}
    Wait Until Element Is Visible                         ${TABLE_PRODUCT}
    Aguarda e clica no elemento                           ${BTN_REMOVE_STOCK}
    Aguarda e insere o texto no elemento                  ${INPUT_REMOVE_STOCK}    50
    Aguarda e clica no elemento                           ${BTN_UPDATE}
    Aguarda e verifica que o elemento esta visivel        ${BTN_MENU}

E realiza uma entrada com o mesmo valor da saida após a geração do relatorio 
    Wait Until Element Is Visible                                      ${TABLE_PRODUCT}
    Aguarda e clica no elemento                                        ${BTN_ADD_STOCK}   
    Aguarda e insere o texto no elemento                               ${INPUT_ADD_STOCK}    5         
    Aguarda e clica no elemento                                        ${BTN_UPDATE}
    Wait Until Element Is Visible                                      ${TABLE_PRODUCT}

E apenas o grupo existente antes da importação deve ser exibido
    Selecionar na barra do celular a opção de voltar
    Aguarda e clica no elemento                                                 ${GROUP_MENU}
    Aguarda e verifica que o elemento esta visivel e contem o texto             ${DESC_GROUP}    Geral

Então deve visualizar as opções para importar um relatorio 
    Aguarda e verifica que o elemento esta visivel                     ${TITLE_IMPORT}
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${REST_PROD}       RESTAURAR PRODUTOS  
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${REST_ENT}        RESTAURAR ENTRADAS
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${REST_SAI}        RESTAURAR SAÍDAS
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${REST_GRUOP}      GRUPO DE PRODUTOS

Então deve ser possivel selecionar o arquivo de produto exportado anteriormente e importar ele novamente
    Selecionar arquivo e importar                                               ${SELECT_PROD_CSV}

Então deve ser possivel selecionar o arquivo de entrada exportado anteriormente e importar ele novamente 
    Selecionar arquivo e importar    ${SELECT_ENT_CSV} 

Então deve ser possivel selecionar o arquivo de saida exportado anteriormente e importar ele novamente 
    Selecionar arquivo e importar    ${SELECT_SAI_CSV} 

Então deve ser possivel selecionar o arquivo de grupos exportado anteriormente e importar ele novamente
    Selecionar arquivo e importar    ${SELECT_GRUOP_CSV}










