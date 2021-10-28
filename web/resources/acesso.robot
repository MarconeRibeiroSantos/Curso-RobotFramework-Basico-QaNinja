*** Settings ***
Resource        base_tests.robot
Resource        home.robot
Resource        painel_cliente.robot

*** Variables ***
${ACESSO_ABA_TITULO}            Login - YouCom
${ACESSO_BREADCRUMP}            Identificação 


${ACESSO_FIELD_USERNAME}        id:widget75-email
${ACESSO_FIELD_PASSWORD}        id:widget75-password  
${ACESSO_BTN_LOGIN}             xpath://*[@id="widget75-submit"]

  

*** Keywords ***

### Dado
que acesso a tela de login e cadastro

    Click Element                      ${HOME_BTN_ENTREOUCADASTRE}  
    Title Should Be                    ${ACESSO_ABA_TITULO} 
    Page Should Contain Element        ${ACESSO_BTN_LOGIN} 
    Page Should Contain                ${ACESSO_BREADCRUMP}        

### Quando                 
informo email "${USER_NAME}" e senha "${PASSWORD}"      

    Input Text                          ${ACESSO_FIELD_USERNAME}         ${USER_NAME} 
    Input Text                          ${ACESSO_FIELD_PASSWORD}         ${PASSWORD}
    Click Element                       ${ACESSO_BTN_LOGIN}
    #       painel do cliente     60s
    

### Então
o sistema não permite login e exibe mensagem de erro
    Title Should Be                    ${ACESSO_ABA_TITULO}

#TODO: validar mensagem de erro

o usuário acessa sua conta
    Wait Until Element Is Visible       ${CLIENTE_ELEMENT_TITLE}            30s
    ${TITLE}=                           Get Title
    Log                                 ${TITLE}
    Should Be Equal                     ${TITLE}                    ${CLIENTE_TEXT_TITULO}                      
     

    ${GET_TEXT}=                        Get Text                    ${CLIENTE_WELCOME}
    Log                                 ${GET_TEXT}        
    Should Be Equal                     ${GET_TEXT}                 ${CLIENTE_EXPECTED_NAME}

###############DESABLE*******************
##Então o sistema informa "mensagem a digitar"
##      o sistema informa "${HOME_MESSAGE}"

    #${MESSAGE}=                 Get Text            ${locator}  
    #Log To Console              ${MESSAGE}
    #Should Be Equal             ${MESSAGE}                      ${HOME_MESSAGE}

#${locator}                      id:widget75-submit 
#${attribute name}               content

  


