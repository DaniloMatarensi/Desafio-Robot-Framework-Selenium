*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${input_user}           id:user-name
${input_pass}           id:password
${input_login}          id:login-button
${button_item1}         id:add-to-cart-sauce-labs-backpack
${button_item2}         id:add-to-cart-sauce-labs-bike-light
${div_cart}             id:shopping_cart_container
${button_checkout}      id:checkout
${input_firstname}      id:first-name
${input_lastname}       id:last-name
${input_postalcode}     name:postalCode
${input_continue}       id:continue
${button_finish}        id:finish
${button_validation}    id:back-to-products


*** Keywords ***
Dado que abro o site    
    Open Browser  https://www.saucedemo.com/  chrome  options=add_experimental_option("detach", True)
    

E preencho login
    Input Text          ${input_user}  standard_user
    Sleep               1s

E preencho senha
    Input Text          ${input_pass}  secret_sauce
    Sleep               1s

Quando realizo o login
    Click Element       ${input_login}
    Sleep               1s

E adiciono o item 1
    Click Element       ${button_item1}
    Sleep               1s

E adiciono o item 2
    Click Element       ${button_item2}
    Sleep               1s

E acesso carrinho
    Click Element       ${div_cart}
    Sleep               1s

E realizo o checkout
    Click Element       ${button_checkout}
    Sleep               1s

E preencho o primeiro nome
    Input Text          ${input_firstname}  Danilo
    Sleep               1s

E preencho segundo nome
    Input Text          ${input_lastname}   Testes  
    Sleep               1s

E preencho codigo postal
    Input Text          ${input_postalcode}  03448015
    Sleep               1s

E clico em continuar
    Click Element       ${input_continue} 
    Sleep               1s

E clico em finalizar
    Click Element       ${button_finish}   
    Sleep               3s 

Então sistema valida que a compra foi realizada com sucesso
    Element Should Be Visible   ${button_validation}

E fecho o browser
    Sleep               1s     
    Close Browser


*** Test Cases ***
Cenário 1: Realizando login no site e finalizando uma compra
    Dado que abro o site 
    E preencho login
    E preencho senha
    Quando realizo o login
    E adiciono o item 1
    E adiciono o item 2
    E acesso carrinho
    E realizo o checkout
    E preencho o primeiro nome
    E preencho segundo nome
    E preencho codigo postal
    E clico em continuar
    E clico em finalizar
    Então sistema valida que a compra foi realizada com sucesso
    E fecho o browser
    

  