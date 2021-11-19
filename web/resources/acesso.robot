*** Settings ***
Resource        base_tests.robot


*** Variables ***
${PAGE_TITLE_IS_LOGIN_YOUCOM}             Login - YouCom

${ACESSO_FIELD_USERNAME}                  id:widget75-email
${ACESSO_FIELD_PASSWORD}                  id:widget75-password  
${ACESSO_BTN_LOGIN}                       xpath://*[@id="widget75-submit"]


*** Keywords ***

### Dado
que acesso a tela de login e cadastro
    Clicar no botão de 'entre ou cadastre-se' 
    Verificar o título da página de login
    Verificar se a página contém elemento da tela de login
    Capturar screenshot

### Quando                 
informo email não cadastrado       
    Preencher o campo email "narcisa.na@gmail.com" e senha "123na" da tela de login
    Clicar no botão 'entrar'
    Capturar screenshot

o usuario cadastrado erra a senha 
    Preencher o campo email "testerenner1@gmail.com" e senha "123na" da tela de login
    Clicar no botão 'entrar'
    Capturar screenshot  

o usuario cadastrado informa seus dados corretamente 
    Preencher o campo email "testerenner1@gmail.com" e senha "Mudar123" da tela de login
    Clicar no botão 'entrar'
    Capturar screenshot              

### Então
o sistema não permite login e exibe mensagem de erro
    Verificar que o usuário não logou
    Capturar screenshot

    #TODO: validar mensagem de erro


o usuário acessa sua conta
    Verificar o título da página de boas vindas
    #Verificar mensagem de boas vindas
    #Verificar o título da página de welcome     
    Capturar screenshot                    
     
   

###############Steps
  
Clicar no botão de 'entre ou cadastre-se'
    Click Element                      ${HOME_BTN_ENTRE_OU_CADASTRE} 

Verificar o título da página de login
    Title Should Be                     ${PAGE_TITLE_IS_LOGIN_YOUCOM}  

Verificar que o usuário não logou  
    Verificar o título da página de login
    
Verificar mensagem de boas vindas 
    ${GET_WELCOME_TEXT}=                Get Text                        ${ACESSO_WELCOME_GET_USER} 
    Log                                 ${GET_WELCOME_TEXT}      
    Should Be Equal                     ${GET_WELCOME_TEXT}             ${ACESSO_WELCOME_EXPECTED_USER}
    Capturar screenshot 

Verificar nome de usuário logado no header
    ${GET_USERNAMETEXT_HEADER}=         Get Text                        ${ACESSO_WELCOME_GET_USER_HEADER} 
    Log                                 ${GET_USERNAMETEXT_HEADER}        
    Should Contain                      ${GET_USERNAMETEXT_HEADER}      ${ACESSO_WELCOME_EXPECTED_USER_HEADER}
    Capturar screenshot 

Verificar se a página contém elemento da tela de login
    Page Should Contain Element        ${ACESSO_BTN_LOGIN} 
    Page Should Contain                ${ACESSO_BREADCRUMP}

Capturar screenshot
    Capture Page Screenshot        

Preencher o campo email "${email}" e senha "${senha}" da tela de login
    Input Text                          ${ACESSO_FIELD_USERNAME}         ${email}    
    Input Text                          ${ACESSO_FIELD_PASSWORD}         ${senha}
    log                                 ${email}
    log                                 ${senha}

Clicar no botão 'entrar'
    Click Element                       ${ACESSO_BTN_LOGIN}
    sleep                               3s

Recarregar a pagina
    
    
