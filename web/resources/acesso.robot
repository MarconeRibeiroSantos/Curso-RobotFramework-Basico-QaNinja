*** Settings ***
Resource        base_tests.robot


*** Variables ***
${ACESSO_ABA_TITULO}            Login - YouCom
${ACESSO_BREADCRUMP}            Identificação 


${ACESSO_FIELD_USERNAME}        id:widget75-email
${ACESSO_FIELD_PASSWORD}        id:widget75-password  
${ACESSO_BTN_LOGIN}             xpath://*[@id="widget75-submit"]

${email_nao_cadastrado}         narcisa.na@gmail.com
${senha_não_cadastrada}         123na
  

*** Keywords ***

### Dado
que acesso a tela de login e cadastro
    Clicar no botão de 'entre ou cadastre-se' 
    Verificar o título da página de login
    Verificar se a página contém elemento da tela de login
    Capturar screenshot

### Quando                 
informo email não cadastrado       
    Preencher o campo 'email' e 'senha' da tela de login
    Clicar no botão 'entrar'
    Capturar screenshot
        

### Então
o sistema não permite login e exibe mensagem de erro
    Verificar que o usuário não logou
    Capturar screenshot

    #TODO: validar mensagem de erro


o usuário acessa sua conta
    Verificar o título da página de welcome 
    Capturar screenshot                    
     
   

###############Steps
  
Clicar no botão de 'entre ou cadastre-se'
    Click Element                      ${HOME_BTN_ENTRE_OU_CADASTRE} 

Verificar o título da página de login
    Title Should Be     ${ACESSO_ABA_TITULO} 

Verificar que o usuário não logou  
    sleep  15s
    Verificar o título da página de login
    
Verificar se o usuário logou  
    ${GET_TEXT}=                        Get Text                    ${ACESSO_WELCOME_GET_USER} 
    Log                                 ${GET_TEXT}        
    Should Be Equal                     ${GET_TEXT}                 ${ACESSO_WELCOME_EXPECTED_USER}
    Capturar screenshot 

Verificar se a página contém elemento da tela de login
    Page Should Contain Element        ${ACESSO_BTN_LOGIN} 
    Page Should Contain                ${ACESSO_BREADCRUMP}

Capturar screenshot
    Capture Page Screenshot        

Preencher o campo 'email' e 'senha' da tela de login
    Input Text                          ${ACESSO_FIELD_USERNAME}         ${email_nao_cadastrado}    
    Input Text                          ${ACESSO_FIELD_PASSWORD}         ${senha_não_cadastrada}

Clicar no botão 'entrar'
    Click Element                       ${ACESSO_BTN_LOGIN}

Aguardar carregamento da página de welcome
    Wait Until Element Is Visible       ${CLIENTE_ELEMENT_TITLE}            30s
    
