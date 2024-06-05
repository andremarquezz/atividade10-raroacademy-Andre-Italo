*** Settings ***

Resource     ../utils/config.robot

Test Setup    Abrir App
Test Teardown    Teardown

*** Test Cases ***

CT001 - Acessar area de importar dados com sucesso 
    Dado que o usuário acessa a página de importação 
    Então deve visualizar as opções para importar um relatorio 

CT002 - Realizar importação dos dados de um produto 
    Dado que o usuario realize a exportação de produtos 
    E exclua o produto exportado 
    Quando o usuário acessa a página de importação 
    E seleciona a opção de restaurar produtos
    Então deve ser possivel selecionar o arquivo de produto exportado anteriormente e importar ele novamente 
    E o produto importado deve ser visualizado na página de produtos

# BUG indentificado, mesmo exportando o valor da entrada, após editar e realizar a importação o valor não é alterado
CT003 - Realizar importação dos dados de uma entrada 
    Dado que o usuario realize a exportação de entradas 
    E realiza uma saida com o mesmo valor da entrada após a geração do relatorio 
    Quando o usuário acessa a página de importação 
    E seleciona a opção de restaurar entrada
    Então deve ser possivel selecionar o arquivo de entrada exportado anteriormente e importar ele novamente 

# BUG indentificado, mesmo exportando o valor da saida, após editar e realizar a importação o valor não é alterado
CT004 - Realizar importação dos dados de uma saida 
    Dado que o usuario realize a exportação de saidas 
    E realiza uma entrada com o mesmo valor da saida após a geração do relatorio 
    Quando o usuário acessa a página de importação 
    E seleciona a opção de restaurar saida
    Então deve ser possivel selecionar o arquivo de saida exportado anteriormente e importar ele novamente  

CT005 - Realizar importação dos dados de um grupo 
    Dado que o usuario realize a exportação de um grupo 
    E insira um novo grupo de produtos 
    Quando o usuário acessa a página de importação  
    E selecionar a opção de restaurar grupos
    Então deve ser possivel selecionar o arquivo de grupos exportado anteriormente e importar ele novamente 
    E apenas o grupo existente antes da importação deve ser exibido 


