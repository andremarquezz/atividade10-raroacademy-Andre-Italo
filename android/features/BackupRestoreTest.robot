*** Settings ***

Resource     ../utils/config.robot

Test Setup    Abrir App
Test Teardown    Teardown

*** Test Cases ***

# CT001 - Realizar backup dos dados do sistema
#   Dado que o usuário acessa a página de manutenção
#   Quando o usuário clica no botão "Backup"
#   Então o sistema gera um arquivo de backup na pasta "Estoque"
#   E o sistema exibe a mensagem "Backup realizado com sucesso"

# CT002 - Restaurar backup dos dados do sistema
#   Dado que o usuário acessa a página de manutenção
#   E o arquivo de backup está na pasta "Estoque"
#   Quando o usuário clica no botão "Restore"
#   E o usuário seleciona o arquivo de backup
#   Então o sistema restaura os dados do backup
#   E o sistema exibe a mensagem "Restaurado com sucesso"