*** Settings ***

Resource     ../utils/config.robot

Test Setup    Abrir App
Test Teardown    Teardown

*** Test Cases ***

CT001 - Acessar area de relario com sucesso
    Dado que o usuario acessa o menu do aplicativo
    Quando o usuário acessa a página de relatorio  
    Então deve visualizar as opções para visualizar os relatorios

CT002 - Gerar relatorio de inventario de estoque com sucesso 
    Dado que o usuario acessa a area de relatorios 
    E seleciona a opção de "Inventário de Estoque"
    Quando selecionar o botão "Gerar PDF"
    Então a messagem de pdf do arquivo de inventario com a data deve ser gerado 
    E deve ser possivel visualizar o PDF
    E deve ser possivel enviar o PDF

CT003 - Gerar relatorio de entrada de estoque com sucesso 
    Dado que o usuario acessa a area de relatorios 
    E seleciona a opção de "Entradas no Estoque"
    E informa data inicial e data final 
    Quando selecionar o botão "Gerar PDF"
    Então a messagem de pdf do arquivo de estoque com a data deve ser gerado 
    E deve ser possivel visualizar o PDF
    E deve ser possivel enviar o PDF

CT004 - Gerar relatorio de entrada de saidas com sucesso 
    Dado que o usuario acessa a area de relatorios 
    E seleciona a opção de "Saidas do Estoque"
    E informa data inicial e data final 
    Quando selecionar o botão "Gerar PDF"
    Então a messagem de pdf do arquivo de saida com a data deve ser gerado 
    E deve ser possivel visualizar o PDF
    E deve ser possivel enviar o PDF

CT005 - Gerar relatorio de entrada de estoque sem informar a data de inicio e fim
    Dado que o usuario acessa a area de relatorios 
    E seleciona a opção de "Entradas no Estoque"
    Quando selecionar o botão "Gerar PDF"
    Então deve receber o modal de mensagem para informar um período de datas

CT006 - Gerar relatorio de saida de estoque sem informar a data de inicio e fim
    Dado que o usuario acessa a area de relatorios 
    E seleciona a opção de "Saidas do Estoque"
    Quando selecionar o botão "Gerar PDF"
    Então deve receber o modal de mensagem para informar um período de datas