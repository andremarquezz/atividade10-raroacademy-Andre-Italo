*** Settings ***

Resource     ../utils/config.robot

Test Setup    Abrir App
Test Teardown    Teardown

*** Test Cases ***

# CT001 - Exportar registros para um arquivo .csv
#   Dado que existem registros de produtos no sistema
#   Quando o usuário acessa a página de exportação de dados
#   E o usuário clica no botão "Exportar"
#   Então o sistema gera um arquivo .csv na pasta "Estoque"
#   E o sistema exibe a mensagem "Dados exportados com sucesso"

# CT002 - Importar novos produtos a partir de um arquivo .csv
#   Dado que o arquivo "novos_produtos.csv" está na pasta "Estoque"
#   Quando o usuário acessa a página de importação de dados
#   E o usuário seleciona o arquivo "novos_produtos.csv"
#   E o usuário clica no botão "Importar"
#   Então o sistema importa os produtos do arquivo
#   E o sistema exibe a mensagem "Produtos importados com sucesso"