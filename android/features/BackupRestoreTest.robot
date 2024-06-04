*** Settings ***

Resource     ../utils/config.robot

Test Setup    Abrir App
Test Teardown    Teardown


*** Test Cases ***

CT001 - Realizar backup dos dados do sistema
  Dado que existem produtos cadastrados
  E o usuário acessa o menu 
  Quando clica no botão "Backup" 
  E clica no botão para gerar um arquivo de backup
  Então o sistema exibe a mensagem que o backup foi realizado com sucesso

CT002 - Restaurar backup dos dados do sistema
  Dado que um backup foi realizado
  E o usuário acessa o menu 
  Quando clica no botão "Restore"
  E o usuário seleciona o arquivo de backup
  Então o sistema exibe a mensagem que foi restaurado com sucesso