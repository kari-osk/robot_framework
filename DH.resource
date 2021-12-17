#Karina Osuka / Turma 01
*** Variables ***
${SITE}                   https://www.digitalhouse.com/br
${NAVEGADOR}              Chrome
${FR_COOKIES}             xpath=/html/body/iframe[2]
${ACEITAR_COOKIES}        xpath=/html/body/div/div/div[1]/div[1]/div[2]/div[1]/div[2]
${BOTAO_CONHECA_CURSOS}   xpath=//a[contains(text(),'Conheça nossos cursos')]

#Data Analytics
${BOTAO_DATA_ANALYTICS}   xpath=//*[@id="__next"]/div/main/section[2]/div/div/div[1]/a/span
${DATA_SUBTITULO}         css=#__next > div > main
${DATA_TEXTO}             Transforme grandes quantidades de dados em insights.
${DATA_PAGE_TEXTO}        manipulação e análise de dados
${BOTAO_INSCREVA}         xpath=(//a[contains(text(),'Inscreva-se')])[2]  
${VALOR}                  xpath=//*[@id="__next"]/div/main/section[2]/div/div[2]/dl/div/div[4]/div/div/span[1]
${DATA_VALOR_TEXTO}       R$ 9.824,00

#Data Science
${BOTAO_SCIENCE}          xpath=//div[@id='__next']/div/main/section[2]/div/div/div[2]/a/span/p  
${SCI_SUBTITULO}          xpath=//*[@id="__next"]/div/main/section/div/div/div[1]/div/div[1]/p
${SCI_TEXTO}              Machine learning, inteligência artificial e tudo mais sobre a ciência de dados
${SCI_PAGE}               processamento e análise de grandes quantidades de dados
${SCI_VALOR_TEXTO}        R$ 11.312,00

#Desenvolvimento Mobile Android
${BOTAO_ANDROID}          xpath=//*[@id="__next"]/div/main/section[2]/div/div/div[3]/a
${ANDROID_SUBTITULO}      xpath=//*[@id="__next"]/div/main/section/div/div/div[1]
${ANDROID_TEXTO}          Crie seu próprio app do zero em até 5 meses
${ANDROID_PAGE}           desenvolver aplicações móveis como um programador profissional

#Desenvolvimento Mobile IOS
${BOTAO_IOS}              xpath=//*[@id="__next"]/div/main/section[2]/div/div/div[4]/a
${IOS_SUBTITULO}          xpath=//*[@id="__next"]/div/main/section/div/div/div[1]/div/div[1]
${IOS_TEXTO}              Aprenda Swift e crie seu próprio app em até 5 meses
${IOS_PAGE}               criar apps estáveis, funcionais e atrativos
${IOS_VALOR_TEXTO}        R$ 8.269,00

#Desenvolvimento Web Full Stack
${BOTAO_FULL}             xpath=//*[@id="__next"]/div/main/section[2]/div/div/div[5]/a
${FULL_SUBTITULO}         xpath=//*[@id="__next"]/div/main/section/div/div/div[1]
${FULL_TEXTO}             Aprenda a criar sites e aplicativos web, do começo ao fim
${FULL_PAGE}              integração do front-end com o back-end
${FULL_VALOR_TEXTO}       R$ 9.824,00

#Certified Tech Developer
${BOTAO_CTD}              xpath=//*[@id="__next"]/div/main/section[2]/div/div/div[10]/a
${CTD_SUBTITULO}          xpath=//*[@id="MyUaLU8yFL50z0GHgU3IrMIwXNvIib7s"]/div
${CTD_TEXTO}              Crie novas formas de viver o mundo
${CTD_PAGE}               Venha desenvolver uma carreira que pode mudar o mundo
${INSCREVA_CTD}           xpath=//*[@id="wIc9FaFLQtAaqfERX7toZ8vOupowTGkN"]/div[1]
${CTD_NOME}               xpath=//*[@id="SPxdIrhGPqy1WTAe5qzVoB7MONOoSOZB"]
${NOME_TEXTO}             Karina
${CTD_SOBRENOME}          xpath=//*[@id="DyESSyoTrg8EZUGtiPbmZmuL5y03FlCN"]
${SOBRENOME_TEXTO}        Osuka
${CTD_EMAIL}              xpath=//*[@id="Lbqhh6B7SmT1OnakIxZ0TBmT2o2IxVNq"]
${EMAIL_TEXTO}            karinaosuka@gmail.com
${CTD_CELULAR}            xpath=//*[@id="zVe3bzxdSNmVk5qFPuJgonal9LqQMlq8"]
${CELULAR_TEXTO}          11900009000
${CTD_CIDADE}             xpath=//*[@id="FhKAsNwtv8stLHRSHxLfxd7lkcUMkiM6"]
${CIDADE_TEXTO}           São Paulo
${CTD_FICOU_SABENDO}      xpath=//*[@id="oNRhffVuMHVvyC4GWZzrJrIGLDmweIxT"]
${FICOU_SABENDO_TEXTO}    Youtube

*** Keywords ***
Abrir o site da DH
  Open Browser                      ${SITE}               ${NAVEGADOR} 
  Maximize Browser Window

Clicar em “Aceitar Cookies”
  Sleep                             5
  Select Frame                      ${FR_COOKIES} 
  Click Element                     ${ACEITAR_COOKIES}
  Unselect Frame

Clicar em “Conheça nossos cursos”
  Wait and Click                    ${BOTAO_CONHECA_CURSOS}
  
#-----1º Caso de Teste: Data Analytics----- 
Selecionar o curso “Data Analytics”
  Execute JavaScript                window.scrollTo(0,350)
  Wait Until Element is Visible     ${BOTAO_DATA_ANALYTICS}
  Wait and Click                    ${BOTAO_DATA_ANALYTICS}

Verificar se o subtitulo do curso corresponde a “Transforme grandes quantidades de dados em insights.”
  Element Should Contain            ${DATA_SUBTITULO}     ${DATA_TEXTO}

Verificar se a página contém o termo “manipulação e análise de dados”
  Page Should Contain               ${DATA_PAGE_TEXTO}  

Clicar em “Inscreva-se”
  Execute JavaScript                window.scrollTo(0,850)
  Wait and Click                    ${BOTAO_INSCREVA}

Validar se o valor do curso é “R$ 9.824,00”
  Execute JavaScript                window.scrollTo(0,550)
  Wait Until Element is Visible     ${VALOR}
  Element Should Contain            ${VALOR}              ${DATA_VALOR_TEXTO}

#-----2º Caso de Teste: Data Science-----
Selecionar o curso “Data Science”
  Execute JavaScript                window.scrollTo(0,350)
  Wait Until Element is Visible     ${BOTAO_SCIENCE}
  Wait and Click                    ${BOTAO_SCIENCE}

Verificar se o subtitulo do curso corresponde a “Machine learning, inteligência artificial e tudo mais sobre a ciência de dados.”
  Wait Until Element is Visible     ${SCI_SUBTITULO}
  Element Should Contain            ${SCI_SUBTITULO}      ${SCI_TEXTO}

Verificar se a página contém o termo “processamento e análise de grandes quantidades de dados”
  Page Should Contain               ${SCI_PAGE}

Validar se o valor do curso é “R$ 11.312,00”
  Execute JavaScript                window.scrollTo(0,450)
  Element Should Contain            ${VALOR}              ${SCI_VALOR_TEXTO}

#-----3º Caso de Teste: Mobile Android -----
Selecionar o curso “Desenvolvimento Mobile Android”
  Execute JavaScript                window.scrollTo(0,350)
  Wait Until Element is Visible     ${BOTAO_ANDROID}
  Wait and Click                    ${BOTAO_ANDROID}

Verificar se o subtitulo do curso corresponde a “Crie seu próprio app do zero em até 5 meses”
  Wait Until Element is Visible     ${ANDROID_SUBTITULO}
  Element Should Contain            ${ANDROID_SUBTITULO}   ${ANDROID_TEXTO}

Verificar se a página contém o termo “desenvolver aplicações móveis como um programador profissional”
  Page Should Contain               ${ANDROID_PAGE}

#-----4º Caso de Teste: Mobile IOS-----
Selecionar o curso “Desenvolvimento Mobile IOS”
  Execute JavaScript                window.scrollTo(0,350)
  Wait Until Element is Visible     ${BOTAO_IOS}
  Wait and Click                    ${BOTAO_IOS}

Verificar se o subtitulo do curso corresponde a “Aprenda Swift e crie seu próprio app em até 5 meses”
  Wait Until Element is Visible     ${IOS_SUBTITULO}
  Element Should Contain            ${IOS_SUBTITULO}       ${IOS_TEXTO}

Verificar se a página contém o termo “criar apps estáveis, funcionais e atrativos”
  Page Should Contain               ${IOS_PAGE}

Validar se o valor do curso é “R$ 8.269,00”
  Execute JavaScript                window.scrollTo(0,350)
  Element Should Contain            ${VALOR}           ${IOS_VALOR_TEXTO}

#-----5º Caso de Teste Web Full Stack-----
Selecionar o curso “Desenvolvimento Web Full Stack”
  Execute JavaScript                window.scrollTo(0,550)
  Wait Until Element is Visible     ${BOTAO_FULL}
  Wait and Click                    ${BOTAO_FULL}

Verificar se o subtitulo do curso corresponde a “Aprenda a criar sites e aplicativos web, do começo ao fim.”
  Wait Until Element is Visible     ${FULL_SUBTITULO}
  Element Should Contain            ${FULL_SUBTITULO}      ${FULL_TEXTO}

Verificar se a página contém o termo “integração do front-end com o back-end”
  Page Should Contain               ${FULL_PAGE}


#-----6º Caso de Teste: Certified Tech Developer-----
Selecionar o curso “Certified Tech Developer”
  Execute JavaScript                window.scrollTo(0,750)
  Wait Until Element is Visible     ${BOTAO_CTD}
  Wait and Click                    ${BOTAO_CTD}

Verificar se o subtitulo do curso corresponde a “Crie novas formas de viver o mundo”
  Wait Until Element is Visible     ${CTD_SUBTITULO}
  Element Should Contain            ${CTD_SUBTITULO}       ${CTD_TEXTO}

Verificar se a página contém o termo “Venha desenvolver uma carreira que pode mudar o mundo”
  Page Should Contain               ${CTD_PAGE}

Clicar em “Inscreva-se ctd”
  Wait and Click                    ${INSCREVA_CTD}

Preencher os campos do formulário “Faça parte do futuro digital”
  Execute JavaScript                window.scrollTo(0,850)
  Set Selenium Speed                0.25
  Input Text                        ${CTD_NOME}            ${NOME_TEXTO}
  Input Text                        ${CTD_SOBRENOME}       ${SOBRENOME_TEXTO}
  Input Text                        ${CTD_EMAIL}           ${EMAIL_TEXTO}
  Input Text                        ${CTD_CELULAR}         ${CELULAR_TEXTO}
  Select From List by Value         ${CTD_CIDADE}          ${CIDADE_TEXTO}
  Select From List by Value         ${CTD_FICOU_SABENDO}   ${FICOU_SABENDO_TEXTO}
  

#---------------------------------------------------------------------------------
Wait and Click
  [Arguments]                       ${ELEMENTO}
  Wait Until Element is Visible     ${ELEMENTO}
  Wait Until Element is Enabled     ${ELEMENTO}
  Scroll Element Into View          ${ELEMENTO}
  Click Element                     ${ELEMENTO}

Wait and Input Text
  [Arguments]                       ${ELEMENTO}             ${TEXTO}
  Wait Until Element is Visible     ${ELEMENTO}
  Wait Until Element is Enabled     ${ELEMENTO}
  Scroll Element Into View          ${ELEMENTO}
  Input Text                        ${ELEMENTO}             ${TEXTO}