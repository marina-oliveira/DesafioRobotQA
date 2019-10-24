*** Settings ***
Resource            ../resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Case ***

Caso de Teste 01: Listar Produtos
    Acessar a página home do site
    Conferir que a página home do site foi exibida
    Passar o mouse por cima da categoria "Dresses" no menu principal superior de categorias
    Conferir que são exibidas as categorias "Casual Dresses", "Evening Dresses" e "Summer Dresses"
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página
