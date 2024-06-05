*** Settings ***

Resource    ../../base.robot

*** Variables ***
${BTN_RELATORIO}                    id=br.com.pztec.estoque:id/btn_relatorios
${TITLE_RELATORIO}                  id=br.com.pztec.estoque:id/lbl_titulo
${BTN_INVETARIO}                    id=br.com.pztec.estoque:id/inventario
${BTN_ENTRADA}                      id=br.com.pztec.estoque:id/relentrada
${BTN_SAIDA}                        id=br.com.pztec.estoque:id/relsaida
${TEXT_RELATORIO}                   id=br.com.pztec.estoque:id/datafile
${OPEN_PDF}                         id=br.com.pztec.estoque:id/btn_abrir
${SEND_EMAIL}                       id=br.com.pztec.estoque:id/btn_email
${INIT_DATE}                        id=br.com.pztec.estoque:id/data1
${FINISH_DATE}                      id=br.com.pztec.estoque:id/data2

*** Keywords ***
Dado que o usuario acessa a area de relatorios
    Aguarda e clica no elemento    ${BTN_MENU}
    Aguarda e clica no elemento    ${BTN_RELATORIO}

E seleciona a opção de "Inventário de Estoque"
    Aguarda e clica no elemento    ${BTN_INVETARIO}

E seleciona a opção de "Saidas do Estoque"
    Aguarda e clica no elemento    ${BTN_SAIDA}

E seleciona a opção de "Entradas no Estoque"
    Aguarda e clica no elemento    ${BTN_ENTRADA} 

E deve ser possivel visualizar o PDF
    Aguarda e clica no elemento    ${OPEN_PDF}
    Selecionar na barra do celular a opção de voltar

E deve ser possivel enviar o PDF
    Aguarda e clica no elemento    ${SEND_EMAIL} 
    Selecionar na barra do celular a opção de voltar

E informa data inicial e data final
    Aguarda e clica no elemento    ${INIT_DATE}
    Aguarda e clica no elemento    ${MODAL_OK}
    Aguarda e clica no elemento    ${FINISH_DATE} 
    Aguarda e clica no elemento    ${MODAL_OK}

Quando selecionar o botão "Gerar PDF"
    Aguarda e clica no elemento    ${BTN_GENERATE}

Quando o usuário acessa a página de relatorio
    Aguarda e clica no elemento    ${BTN_RELATORIO}
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${TITLE_RELATORIO}     Relatórios

Então deve visualizar as opções para visualizar os relatorios
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${BTN_INVETARIO}    INVENTÁRIO DE ESTOQUE
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${BTN_ENTRADA}      ENTRADAS NO ESTOQUE
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${BTN_SAIDA}        SAÍDAS DO ESTOQUE
    
Então a messagem de pdf do arquivo de inventario com a data deve ser gerado 
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${TEXT_RELATORIO}    inventario.pdf gerado em 
    Verifica data na listagem de exportação                            ${TEXT_RELATORIO}
    
Então a messagem de pdf do arquivo de estoque com a data deve ser gerado
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${TEXT_RELATORIO}    relatentrada.pdf gerado em 
    Verifica data na listagem de exportação                            ${TEXT_RELATORIO}

Então a messagem de pdf do arquivo de saida com a data deve ser gerado
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${TEXT_RELATORIO}    relatsaida.pdf gerado em 
    Verifica data na listagem de exportação                            ${TEXT_RELATORIO}

Então deve receber o modal de mensagem para informar um período de datas
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${MESSAGE_MODAL}    Por favor selecione um período de datas.