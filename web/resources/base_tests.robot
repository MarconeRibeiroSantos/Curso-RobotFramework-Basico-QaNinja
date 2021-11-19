*** Settings ***
Library         SeleniumLibrary
Resource        acesso_welcome.robot
Resource        painel_cliente.robot
Resource        home.robot
Resource        acesso.robot



*** Variables ***
${BROWSER}       chrome
${HOME_URL}      https://youcom.core-hlg.dcg.com.br/


*** Keywords ***

Nova sessão
    Open Browser                       ${HOME_URL}        ${BROWSER}
    Set Window Size	                    1366                  924	                    


Encerra sessão    
    Close Browser
    


### Gherkin Potuguês config ###
Dado ${keyword}
    Run keyword     ${keyword}

Quando ${keyword}
    Run keyword     ${keyword}

Então ${keyword}
    Run keyword     ${keyword}

E ${keyword}
    Run keyword     ${keyword} 


