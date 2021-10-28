*** Settings ***
Resource        base_tests.robot
#Resource        home.robot

*** Variables ***
${CLIENTE_ELEMENT_TITLE}        xpath://*[@id="pedidos"]
${CLIENTE_TEXT_TITULO}          Área do Cliente - YouCom
${CLIENTE_WELCOME}              xpath://*[@id="content-wrapper"]/div/div[2]/div/div[2]/div/div/h2/span
${CLIENTE_EXPECTED_NAME}        oi, marcone!!
