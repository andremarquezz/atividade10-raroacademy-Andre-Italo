*** Settings ***

Resource     ../utils/config.robot

Test Setup    Abrir App
Test Teardown    Teardown

*** Test Cases ***

CT001 - Realizar backup dos dados do sistema
  Dado que existem produtos cadastrados
  Quando o usuário acessa o menu 
  E clica no botão "Backup" e gera um arquivo de backup
  Então o sistema exibe a mensagem que o backup foi realizado com sucesso

# CT002 - Restaurar backup dos dados do sistema
#   Dado que o usuário acessa a página de manutenção
#   E o arquivo de backup está na pasta "Estoque"
#   Quando o usuário clica no botão "Restore"
#   E o usuário seleciona o arquivo de backup
#   Então o sistema restaura os dados do backup
#   E o sistema exibe a mensagem "Restaurado com sucesso"