*** Settings ***
Resource        ../resources/base_tests.robot
Resource        ../resources/acesso.robot       

Test Setup          Nova sessão
Test Teardown       Encerra sessão    
#Test Timeout        30 second       #tempo máximo para seu teste ser executado


*** Test Cases ***

Cenário 01.001: Validar que sistema não permite login quando o usuário não está cadastrado    
    Dado que acesso a tela de login e cadastro      
    Quando informo email "narcisa.na@gmail.com" e senha "123na"            
    Então o sistema não permite login e exibe mensagem de erro              

Cenário 01.002: Validar que sistema não permite login quando o usuário errar sua senha
    Dado que acesso a tela de login e cadastro      
    Quando informo email "testerenner1@gmail.com" e senha "123errada"            
    Então o sistema não permite login e exibe mensagem de erro                  

Cenário 01.003: Validar que sistema permite login de usuário cadastrado
    [tags]      teste
    Dado que acesso a tela de login e cadastro      
    Quando informo email "testerenner1@gmail.com" e senha "Mudar123"            
    Então o usuário acessa sua conta 
    


                 
