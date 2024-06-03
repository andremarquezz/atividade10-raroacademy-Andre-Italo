*** Settings ***

Resource     ../utils/config.robot

Test Setup    Abrir App
Test Teardown    Teardown

*** Test Cases ***
CT001 - Cadastrar novo produto
    Dado que o usuário acessa a página de cadastro de produto
    Quando preenche as informações do produto
    E clica no botão "Salvar"
    Então o produto está listado no inventário

CT002 - Editar produto existente
    Dado que o usuário acessa a página de inventário
    E existe um produto cadastrado
    Quando clica em "Editar"
    E edita a quantidade em estoque para "120"
    E clica no botão "Salvar"
    Então o produto está listado no inventário com o novo estoque

CT003 - Excluir produto
    Dado que o usuário acessa a página de inventário
    E existe um produto cadastrado
    Quando clica no botão "Deletar"
    E confirma a exclusão
    Então o produto não está listado no inventário

CT004 - Adicionar quantidade ao estoque
    Dado que o usuário acessa a página de inventário
    E existe um produto cadastrado
    Quando clica em "Entrada"
    E adiciona em estoque "50"  
    E clica no botão para atualizar
    Então o produto está listado no inventário com a quantidade atualizada

CT005 - Reduzir quantidade do estoque
    Dado que o usuário acessa a página de inventário
    E existe um produto cadastrado
    Quando clica em "Saida"
    E diminui em estoque "5"  
    E clica no botão para atualizar
    Então o produto está listado no inventário com a quantidade reduzida em 5

CT006 - Tenta atualizar o estoque em valor negativo
    Dado que o usuário acessa a página de inventário
    E existe um produto cadastrado
    Quando clica em "Saida"
    E diminui em estoque "20"  
    E clica no botão para atualizar
    Então o sistema exibe uma mensagem de erro informando que a quantidade não pode ser negativa