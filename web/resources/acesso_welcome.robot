*** Settings ***
Resource        base_tests.robot


*** Variables ***
${ACESSO_WELCOME_GET_USER}             div[class='col-lg-9 welcome p-0'] span:nth-child(1)
${ACESSO_WELCOME_EXPECTED_USER}        oi, marcone!!      

*** Keywords ***

###Então 
              
