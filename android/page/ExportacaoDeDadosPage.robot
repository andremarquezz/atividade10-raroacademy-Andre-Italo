*** Settings ***

Resource    ../../base.robot
Library    XML

*** Variables ***
${TITLE_EXPORT}                     id=br.com.pztec.estoque:id/textView3
${BTN_EXPORT}                       id=br.com.pztec.estoque:id/btn_exportar
${TEXT_PRODUCT_CSV}                 xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/textView4"]
${BTN_GENERATE}                     id=br.com.pztec.estoque:id/btn_gerar
${ALERT_TITLE}                      id=android:id/alertTitle
${POP_MESSAGE}                      id=android:id/message
${OK_BUTTON}                        id=android:id/button1
${DATE_TEXT_EXPORT}                 id=br.com.pztec.estoque:id/datafileprod
${MODAL_OK}                         id=android:id/button1
${DATE_TEXT_ENTRADA}                id=br.com.pztec.estoque:id/datafileent
${DATE_TEXT_SAIDA}                  id=br.com.pztec.estoque:id/datafilesai
${DATE_TEXT_GRUP}                  id=br.com.pztec.estoque:id/datafilegrupo
${SEND_GROUPS}                      id=br.com.pztec.estoque:id/btn_grupo
${SHARE}                            xpath=//android.widget.ScrollView[@resource-id="android:id/contentPanel"]/android.widget.ScrollView
${SHARE_HEADER}                     id=android:id/chooser_header
${SHARE_SAID}                       id=br.com.pztec.estoque:id/btn_ent
${TOAST_SHARE}                      id=xpath=//android.widget.Toast[@text="O arquivo PDF ainda não foi gerado!"]

*** Keywords ***

Verifica data na listagem de exportação 
    [Arguments]    ${Element}
    ${day} =     Acessa e formata data atual
    Element Should Contain Text    ${Element}    ${day}

Dado que o usuario acessa o menu do aplicativo
    Aguarda e clica no elemento    ${BTN_MENU}
    Aguarda e verifica que o elemento esta visivel    ${BTN_EXPORT}

Dado que o usuario realize a exportação de produtos 
    Adiciona produto ao estoque    Produto Teste    UN    10     10.00    123456
    Aguarda e clica no elemento                                        ${BTN_MENU}
    Aguarda e clica no elemento                                        ${BTN_EXPORT}
    Aguarda e clica no elemento                                        ${BTN_GENERATE}
    Aguarda e clica no elemento                                        ${MODAL_OK}  
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${DATE_TEXT_EXPORT}    produtos.csv
    Selecionar na barra do celular a opção de voltar
    Selecionar na barra do celular a opção de voltar

Dado que existem registros de produtos no sistema
    Adiciona produto ao estoque    Produto Teste    UN    10     10.00    123456

Dado que existem registros de entrada no sistema
    Adiciona produto ao estoque    Produto Teste    UN    10     10.00    123456
    Wait Until Element Is Visible                         ${TABLE_PRODUCT}
    Aguarda e clica no elemento                           ${BTN_ADD_STOCK}   
    Aguarda e insere o texto no elemento                  ${INPUT_ADD_STOCK}    50          
    Aguarda e clica no elemento                           ${BTN_UPDATE}
    Aguarda e verifica que o elemento esta visivel        ${BTN_MENU}

Dado que existem registros de saida no sistema 
    Adiciona produto ao estoque    Produto Teste    UN    10     10.00    123456
    Wait Until Element Is Visible                         ${TABLE_PRODUCT}
    Wait Until Element Is Visible                         ${TABLE_PRODUCT}
    Aguarda e clica no elemento                           ${BTN_REMOVE_STOCK}
    Aguarda e insere o texto no elemento                  ${INPUT_REMOVE_STOCK}    5
    Aguarda e clica no elemento                           ${BTN_UPDATE}
    Aguarda e verifica que o elemento esta visivel        ${BTN_MENU}

Quando o usuário acessa a página de exportação   
    Aguarda e clica no elemento                       ${BTN_EXPORT}
    Aguarda e verifica que o elemento esta visivel    ${TEXT_PRODUCT_CSV} 

Quando o usuário acessa a página de exportação de dados
    Aguarda e clica no elemento    ${BTN_MENU}
    Aguarda e clica no elemento    ${BTN_EXPORT}

Quando fechar o pop-up de sucesso
    Aguarda e clica no elemento    ${MODAL_OK} 

E exclua o produto exportado
    Aguarda e clica no elemento                           ${BTN_DELETE}
    Aguarda e clica no elemento                           ${MODAL_OK}   
    Aguarda e verifica que o elemento esta visivel        ${BTN_MENU}
    Page Should Not Contain Element                       ${CODE}
    Page Should Not Contain Element                       ${DESCRIPTION}
    Page Should Not Contain Element                       ${UNIT}
    Page Should Not Contain Element                       ${QUANTITY}
    Page Should Not Contain Element                       ${PRICE}
    Page Should Not Contain Element                       ${LOTE}

E o usuário clica no botão "Exportar"
    Aguarda e clica no elemento    ${BTN_GENERATE}

E o nome do arquivo com a data de exportação são retornados na listagem
    Aguarda e clica no elemento                                        ${MODAL_OK}  
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${DATE_TEXT_EXPORT}    produtos.csv
    Verifica data na listagem de exportação                            ${DATE_TEXT_EXPORT}  

E o nome do arquivo de saida com a data de exportação são retornados na listagem
    Aguarda e clica no elemento                                        ${MODAL_OK}
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${DATE_TEXT_SAIDA}    saidas.csv
    Verifica data na listagem de exportação                            ${DATE_TEXT_SAIDA}

E o nome do arquivo de entrada com a data de exportação são retornados na listagem
    Aguarda e clica no elemento                                        ${MODAL_OK}  
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${DATE_TEXT_ENTRADA}    entradas.csv
    Verifica data na listagem de exportação                            ${DATE_TEXT_ENTRADA}

E selecionar o botão de enviar de um arquivo que foi gerado 
    Aguarda e clica no elemento    ${SEND_GROUPS}  

E seleciona o botão de enviar um arquivo que ainda não foi gerado
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${DATE_TEXT_SAIDA}    O arquivo PDF ainda não foi gerado!
    Aguarda e clica no elemento                                        ${SHARE_SAID} 

E apenas o aquivo de grupos.csv com a data de exportação são retornados na listagem
    Aguarda e clica no elemento                                        ${MODAL_OK}  
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${DATE_TEXT_SAIDA}       O arquivo PDF ainda não foi gerado!
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${DATE_TEXT_EXPORT}      O arquivo PDF ainda não foi gerado!
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${DATE_TEXT_ENTRADA}     O arquivo PDF ainda não foi gerado!
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${DATE_TEXT_GRUP}        grupos.csv 

# Então deve receber a mensagem de que o PDF não foi gerado
    # ${toast_text}=    Wait Until Element Is Visible    xpath=//android.widget.Toast    timeout=10s
    # Should Contain    ${toast_text}    O arquivo PDF ainda não foi gerado!

Então deve visualizar as opções para exportar o relatorio 
    Aguarda e verifica que o elemento esta visivel    ${TEXT_PRODUCT_CSV}  
    Aguarda e verifica que o elemento esta visivel    ${BTN_GENERATE}     
    Aguarda e verifica que o elemento esta visivel    ${TITLE_EXPORT} 

Então o pop-up de sucesso da operação é exibido
    Aguarda e verifica que o elemento esta visivel    ${ALERT_TITLE}           
    Aguarda e verifica que o elemento esta visivel    ${POP_MESSAGE}
    Aguarda e verifica que o elemento esta visivel    ${OK_BUTTON} 
    
Então deve visualizar as opções de compartilhamento    
    Aguarda e verifica que o elemento esta visivel    ${SHARE_HEADER}
    

    
