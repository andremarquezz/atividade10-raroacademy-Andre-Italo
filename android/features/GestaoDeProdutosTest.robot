*** Settings ***

Resource     ../utils/config.robot

Test Setup    Abrir App
Test Teardown    Teardown

*** Test Cases ***

# CT001 - Cadastrar novo produto
#   Dado que o usuário acessa a página de cadastro de produto
#   Quando o usuário preenche a descrição com "Produto A"
#   E o usuário preenche a quantidade em estoque com "100"
#   E o usuário preenche o valor unitário com "10.50"
#   E o usuário clica no botão "Cadastrar"
#   Então o sistema exibe a mensagem "Produto cadastrado com sucesso"
#   E o produto "Produto A" está listado no inventário

# CT002 - Tentar cadastrar produto com estoque negativo
#   Dado que o usuário acessa a página de cadastro de produto
#   Quando o usuário preenche a descrição com "Produto B"
#   E o usuário preenche a quantidade em estoque com "-10"
#   E o usuário preenche o valor unitário com "5.00"
#   E o usuário clica no botão "Cadastrar"
#   Então o sistema exibe a mensagem "A quantidade em estoque não pode ser negativa"

# CT003 - Editar produto existente
#   Dado que o produto "Produto A" está listado no inventário
#   Quando o usuário edita a descrição para "Produto A1"
#   E o usuário edita a quantidade em estoque para "120"
#   E o usuário edita o valor unitário para "11.00"
#   E o usuário clica no botão "Salvar"
#   Então o sistema exibe a mensagem "Produto atualizado com sucesso"
#   E o produto "Produto A1" está listado no inventário

# CT004 - Excluir produto
#   Dado que o produto "Produto A1" está listado no inventário
#   Quando o usuário clica no botão "Excluir" ao lado do produto "Produto A1"
#   E o usuário confirma a exclusão
#   Então o sistema exibe a mensagem "Produto excluído com sucesso"
#   E o produto "Produto A1" não está listado no inventário
