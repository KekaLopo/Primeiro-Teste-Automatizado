*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}  gc 
${URL}  http://automationpractice.com/index.php  
${Search}  css:input[id='search_query_top']
${Botao_Busca}   css:button[name='submit_search']
*** Keywords ***
### Setup e Teardown
Abrir navegador
  Open Browser  about:blank  ${BROWSER}

Fechar navegador
  Close Browser

### Passo a Passo
Dado que estou na Pagina home do Site 
  SeleniumLibrary.Go To 	 ${URL}
  Title Should Be 	 My Store

Quando eu pesquisar pelo produto "${Produto}"
  input text  ${Search}  ${Produto}
  Sleep   1s
  SeleniumLibrary.Click Element 	${Botao_Busca} 
  Sleep   1
Então o Produto "${Produto}" deve ser listado na página de resultado de Busca
  Page Should Contain Link 	 xpath=//*[@id="center_column"]//a [@class="product-name"][contains(text(),"${Produto}")]

Então a pagina deve exibir a mensagem "${Mensagem}"
  Wait Until Element Is Visible 	 xpath=//*[@id="center_column"]/p [@class="alert alert-warning"]
  Element Text Should Be 	 xpath=//*[@id="center_column"]/p [@class="alert alert-warning"]    ${Mensagem}

Quando eu passar o mouse por cima da categotia "Woman" no menu principal superior de categorias
  Mouse Over 	 xpath=//*[@id="block_top_menu"]/ul/li[1]
  
Então Clicar na sub categoria "Summer Dresses" 
  Click Element 	 xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Então Clicar no botao "Add to cart" do Produto
  Click Element 	 xpath=//*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]
  Sleep  2s
E Clicar no Botao "Proceed to Checkout"
  Wait Until Element Is Visible  xpath=//*[@id="layer_cart"]/div[1]/div[2]
  Click Element  xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a