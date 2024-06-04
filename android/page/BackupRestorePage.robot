*** Settings ***

Resource    ../../base.robot


*** Variables ***
${BTN_MENU_BACKUP}         id=br.com.pztec.estoque:id/btn_backup
${BTN_GENERATE_BACKUP}     id=br.com.pztec.estoque:id/btn_gerar
${BTN_RESTORE}             id=br.com.pztec.estoque:id/btn_restore
${BTN_SELECT_FILE}         id=br.com.pztec.estoque:id/btn_procurar
${FILE_STOCK}              xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="Estoque"]
${ANDROID_ALERT_TITLE}     id=android:id/alertTitle
${BACKUP_ONE}              xpath=//android.widget.TextView[@resource-id="android:id/text1"][2]

${BTN_CONFIRM}             id=android:id/button1

@{PRODUCTS}    [Product1, UN, 10, 10.5, LOT1]
...            [Product2, UN, 20, 20.5, LOT2]
...            [Product3, UN, 30, 30.5, LOT3]

*** Keywords ***

Dado que existem produtos cadastrados
    Adiciona produtos ao estoque   @{PRODUCTS}

Dado que um backup foi realizado
    Adiciona produtos ao estoque   @{PRODUCTS}
    Aguarda e clica no elemento    ${BTN_MENU}
    Aguarda e clica no elemento    ${BTN_MENU_BACKUP}
    Aguarda e clica no elemento    ${BTN_GENERATE_BACKUP}
    Aguarda e clica no elemento    ${BTN_CONFIRM}
    Go Back
    Go Back

Quando clica no botão "Backup" 
    Aguarda e clica no elemento    ${BTN_MENU_BACKUP}

Quando clica no botão "Restore"
    Aguarda e clica no elemento    ${BTN_RESTORE}

E clica no botão para gerar um arquivo de backup
    Aguarda e clica no elemento    ${BTN_GENERATE_BACKUP}

E o usuário seleciona o arquivo de backup
    Aguarda e clica no elemento    ${BTN_SELECT_FILE}
    Swipe    550    1500    550    1300
    Aguarda e clica no elemento    ${FILE_STOCK}
    Click Element                  ${BACKUP_ONE}
    Aguarda e clica no elemento    ${BTN_CONFIRM}

E o usuário acessa o menu 
    Aguarda e clica no elemento    ${BTN_MENU}

Então o sistema exibe a mensagem que o backup foi realizado com sucesso
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${ANDROID_ALERT_TITLE}       Operação concluída!

Então o sistema exibe a mensagem que foi restaurado com sucesso
    Aguarda e verifica que o elemento esta visivel e contem o texto    ${ANDROID_MESSAGE}           Operação concluída!