*** Settings ***

Resource     ../utils/config.robot

Test Setup    Abrir App
Test Teardown    Teardown

*** Test Cases ***

CT001 - Acessar area de exportar dados com sucesso
    Dado que o usuario acessa o menu do aplicativo
    Quando o usuário acessa a página de exportação 
    Então deve visualizar as opções para exportar o relatorio 

CT002 - Exportar registros com sucesso 
   Dado que existem registros de produtos no sistema
   Quando o usuário acessa a página de exportação de dados
   E o usuário clica no botão "Exportar"
   Então o pop-up de sucesso da operação é exibido
   E o nome do arquivo com a data de exportação são retornados na listagem

CT003 - Exportar registros de entrada com sucesso  
   Dado que existem registros de entrada no sistema 
   Quando o usuário acessa a página de exportação de dados
   E o usuário clica no botão "Exportar"
   Então o pop-up de sucesso da operação é exibido
   E o nome do arquivo de entrada com a data de exportação são retornados na listagem

CT004 - Exportar registros de saida com sucesso  
   Dado que existem registros de saida no sistema 
   Quando o usuário acessa a página de exportação de dados
   E o usuário clica no botão "Exportar"
   Então o pop-up de sucesso da operação é exibido
   E o nome do arquivo de saida com a data de exportação são retornados na listagem

CT005 - Exporta registros e selecionar opção de compartilhar 
   Dado que existem registros de produtos no sistema
   Quando o usuário acessa a página de exportação de dados
   E o usuário clica no botão "Exportar"
   Quando fechar o pop-up de sucesso 
   E selecionar o botão de enviar de um arquivo que foi gerado 
   Então deve visualizar as opções de compartilhamento 

CT006 - Acessar area de exportar e selecionar opção de compartilhar um arquivo que não foi gerado
   Dado que o usuario acessa o menu do aplicativo
   Quando o usuário acessa a página de exportação 
   E seleciona o botão de enviar um arquivo que ainda não foi gerado
   Então deve receber a mensagem de que o PDF não foi gerado

CT007 - Realizar exportação sem registros de novos produtos, entrada ou saida
   Dado que o usuario acessa o menu do aplicativo
   Quando o usuário acessa a página de exportação
   E o usuário clica no botão "Exportar"
   Então o pop-up de sucesso da operação é exibido
   E apenas o aquivo de grupos.csv com a data de exportação são retornados na listagem 
