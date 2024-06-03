*** Settings ***

Resource    ../../base.robot


*** Variables ***
${BTN_MENU_BACKUP}         id=br.com.pztec.estoque:id/btn_backup
${BTN_GENERATE_BACKUP}     id=br.com.pztec.estoque:id/btn_gerar
${BTN_RESTORE}             id=br.com.pztec.estoque:id/btn_restore
${ALERT_TITLE}             id=android:id/alertTitle

*** Variables ***
@{PRODUTOS}    Produto1  UN  10  10.5  LOTE1
...            Produto2  UN  20  20.5  LOTE2
...            Produto3  UN  30  30.5  LOTE3

*** Keywords ***

Dado que existem produtos cadastrados
    FOR    ${produto}    ${unidade}    ${quantidade}    ${preco}    ${lote}    IN    @{PRODUTOS}
        Adiciona produto ao estoque    ${produto}    ${unidade}    ${quantidade}    ${preco}    ${lote}
    END

Quando o usuário acessa o menu
    Aguarda e clica no elemento    ${BTN_MENU}
    
E clica no botão "Backup" e gera um arquivo de backup
    Aguarda e clica no elemento    ${BTN_MENU_BACKUP}
    Aguarda e clica no elemento    ${BTN_GENERATE_BACKUP}

Então o sistema exibe a mensagem que o backup foi realizado com sucesso
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${ALERT_TITLE}    Operação concluída!