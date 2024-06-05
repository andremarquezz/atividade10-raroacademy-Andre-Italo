*** Settings ***

Resource     ../utils/config.robot

Test Setup    Abrir App
Test Teardown    Teardown

*** Test Cases ***

CT001 - Acessar area de importar dados com sucesso 
    Dado que o usuario acessa o menu do aplicativo
    Quando o usuário acessa a página de importação 
    Então deve visualizar as opções para importar um relatorio 

CT002 - Realizar importação dos dados de um produto 
    Dado que o usuario realize a exportação de produtos 
    E exclua o produto exportado 
    Quando o usuário acessa a página de importação 
    E seleciona a opção de restaurar produtos
    Então deve ser possivel selecionar o arquivo exportado anteriormente e importar ele novamente 
    E o produto importado deve ser visualizado na página de produtos

# CT003 - Realizar importação dos dados de uma entrada 
#     Dado que o usuario realize a exportação de entradas 
#     E exclua a entrada exportada
#     Quando acessar a página de importação 
#     E executar a opção de restaurar entradas
#     Então deve ser possivel selecionar o arquivo exportado anteriormente e importar ele novamente 
#     E o produto importado deve ser visualizado na página de produtos

# CT004 - Realizar importação dos dados de uma saida 
#     Dado que o usuario realize a exportação de saidas 
#     E exclua a saida exportada
#     Quando acessar a página de importação 
#     E executar a opção de restaurar saidas
#     Então deve ser possivel selecionar o arquivo exportado anteriormente e importar ele novamente 
#     E o produto importado deve ser visualizado na página de produtos

# CT005 - Realizar importação dos dados de um grupo 
#     Dado que o usuario realize a exportação de um grupo 
#     E edite o nome do grupo anterior 
#     Quando acessar a página de importação 
#     E executar a opção de restaurar grupos
#     Então deve ser possivel selecionar o arquivo exportado anteriormente e importar ele novamente 
#     E o produto importado deve ser visualizado na página de produtos


