*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}      chrome
${URL}          http://automationpractice.com

*** Keywords ***
#### Setup e Teardown
Abrir navegador
  Open Browser    about:blank   ${BROWSER}

Fechar navegador
  Close Browser

  #### Ações
Acessar a página home do site
  Go To               ${URL}
  Wait Until Element Is Visible    xpath=//*[@id="block_top_menu"]/ul

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
  Mouse Over                      xpath=//*[@id="block_top_menu"]/ul/li[2]//a[@title="${CATEGORIA}"]

Clicar na sub categoria "${SUB-CATEGORIA3}"
  Wait Until Element Is Visible   xpath=//*[@id="block_top_menu"]/ul/li[2]//a[@title="${SUB-CATEGORIA3}"]
  Click Element                   xpath=//*[@id="block_top_menu"]/ul/li[2]//a[@title="${SUB-CATEGORIA3}"]

### Conferências
Conferir que a página home do site foi exibida
  Title Should Be     My Store

Conferir que são exibidas as categorias "${SUB-CATEGORIA1}", "${SUB-CATEGORIA2}" e "${SUB-CATEGORIA3}"
  Wait Until Element Is Visible  xpath=//*[@id="block_top_menu"]/ul/li[2]//a[@title="${SUB-CATEGORIA1}"]
  Page Should Contain Element    xpath=//*[@id="block_top_menu"]/ul/li[2]//a[@title="${SUB-CATEGORIA1}"]
  Page Should Contain Element    xpath=//*[@id="block_top_menu"]/ul/li[2]//a[@title="${SUB-CATEGORIA2}"]
  Page Should Contain Element    xpath=//*[@id="block_top_menu"]/ul/li[2]//a[@title="${SUB-CATEGORIA3}"]

Conferir se os produtos da sub-categoria "${SUB-CATEGORIA3}" foram mostrados na página
  Title Should Be     ${SUB-CATEGORIA3} - My Store
  Page Should Contain Element    xpath=//*[@id="center_column"]/h1/span[contains(text(),"${SUB-CATEGORIA3}")]
  Page Should Contain Element    xpath=//*[@id="center_column"]/ul/li[1]/div/div[2]/h5/a[@title="Printed Summer Dress"]
  Page Should Contain Element    xpath=//*[@id="center_column"]/ul/li[2]/div/div[2]/h5/a[@title="Printed Summer Dress"]
  Page Should Contain Element    xpath=//*[@id="center_column"]/ul/li[3]/div/div[2]/h5/a[@title="Printed Chiffon Dress"]
