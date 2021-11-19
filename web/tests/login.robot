*** Settings ***
Resource        ../resources/base_tests.robot
Resource        ../resources/acesso.robot 
Resource        ../resources/acesso_welcome.robot          

Test Setup          Nova sessão
Test Teardown       Encerra sessão    
#Test Timeout        30 second       #tempo máximo para seu teste ser executado


*** Test Cases ***

Cenário 01.001: Validar que sistema não permite login quando o usuário não está cadastrado 
   
    Dado que acesso a tela de login e cadastro      
    Quando informo email não cadastrado            
    Então o sistema não permite login e exibe mensagem de erro              

Cenário 01.002: Validar que sistema não permite login quando o usuário errar sua senha
    
    Dado que acesso a tela de login e cadastro      
    Quando o usuario cadastrado erra a senha            
    Então o sistema não permite login e exibe mensagem de erro                  

Cenário 01.003: Validar que sistema permite login de usuário cadastrado
    [tags]      teste
    Dado que acesso a tela de login e cadastro      
    Quando o usuario cadastrado informa seus dados corretamente             
    Então o usuário acessa sua conta 
    


                 
