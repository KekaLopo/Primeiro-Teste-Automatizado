***Settings***
Resource  ../resources/bdd.resource
Test Setup  Abrir navegador
Test Teardown  Fechar navegador

***Variables***

*** Test Cases ***
Cenario 01: Pesquisar produto existente
  Dado que estou na Pagina home do Site 
  Quando eu pesquisar pelo produto "Blouse"
  Então o Produto "Blouse" deve ser listado na página de resultado de Busca
Cenario 02: Pesquisar produto não existente
  Dado que estou na Pagina home do Site 
  Quando eu pesquisar pelo produto "itemNaoExistente"
  Então a pagina deve exibir a mensagem "No results were found for your search "itemNaoExistente""
Cenario 03: Listar Produtos
  Dado que estou na Pagina home do Site
  Quando eu passar o mouse por cima da categotia "Woman" no menu principal superior de categorias
  Então Clicar na sub categoria "Summer Dresses"
Cenario 04: Adicionar produtos no Carrinho
  Dado que estou na Pagina home do Site 
  Quando eu pesquisar pelo produto "t-shirt"  
  Então Clicar no botao "Add to cart" do Produto
  E Clicar no Botao "Proceed to Checkout"
