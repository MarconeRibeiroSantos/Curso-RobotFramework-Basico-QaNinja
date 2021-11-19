*** Settings ***
Resource        base_tests.robot


*** Variables ***
${PAGE_TITLE_IS_AREA_DO_CLIENTE}            Área do Cliente - YouCom

${ACESSO_WELCOME_GET_USER}                  div[class='col-lg-9 welcome p-0'] span:nth-child(1)
${ACESSO_WELCOME_EXPECTED_USER}             oi, marcone!!      

${ACESSO_WELCOME_GET_USER_HEADER}           //*[@id="header"]/div[4]/div[1]/div/div[2]/div[3]/div/div/div/span/div/ul/li[1]/a/span
${ACESSO_WELCOME_EXPECTED_USER_HEADER}      Marcone!

*** Keywords ***



############Steps
Verificar o título da página de boas vindas
    Title Should Be                         ${PAGE_TITLE_IS_AREA_DO_CLIENTE} 

###Então 
              
