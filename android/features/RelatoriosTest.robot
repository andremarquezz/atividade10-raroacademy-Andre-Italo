*** Settings ***

Resource     ../utils/config.robot

Test Setup    Abrir App
Test Teardown    Teardown

*** Test Cases ***

# CT001 - Emitir relatório de inventário
#   Dado que o usuário acessa a página de relatórios
#   Quando o usuário clica na opção "Relatório de Inventário"
#   Então o sistema gera o relatório de inventário em PDF
#   E o sistema exibe a mensagem "Relatório gerado com sucesso"
#   E o relatório está disponível para visualização

# CT002 - Emitir relatório de movimentação por período
#   Dado que o usuário acessa a página de relatórios
#   Quando o usuário seleciona o período de "01/01/2024" a "31/01/2024"
#   E o usuário clica na opção "Relatório de Movimentação"
#   Então o sistema gera o relatório de movimentação em PDF
#   E o sistema exibe a mensagem "Relatório gerado com sucesso"
#   E o relatório está disponível para visualização e envio por e-mail