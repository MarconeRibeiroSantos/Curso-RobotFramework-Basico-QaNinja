*** Settings ***
Resource        ../resources/base_tests.robot
Resource        ../resources/pdp.robot       

Test Setup          Nova sessão
Test Teardown       Encerra sessão    
#Test Timeout        30 second       #tempo máximo para seu teste ser executado


*** Test Cases ***

Cenário 01.001: Validar que a seleção de cor não vem pré-selecionada    
    Dado que acesso a PDP de um produto      
    Quando não seleciono o tamanho do produto             
    Então o sistema não permite seguir com a compra