***Settings***

Library     AppiumLibrary

***Variables***
${START}        QAX

***Keywords***

Start session
    Open Application	http://localhost:4725
    ...                 platformName=Android		
    ...                 deviceName=Pixel_7_Pro_API_34
    ...                 automationName=UIAutomator2 
    ...                 app=${EXECDIR}/app/yodapp-beta.apk	
    ...                 udid=emulator-5554	
    ...                 autoGrantPermissions=true
    ...                 uiautomator2ServerInstallTimeout=120000
    ...                 newCommandTimeout=300
    Sleep               15
    
Get started
    Wait Until Element Is Visible    ${START}    30
    Click Text                  ${START}    

Navegate to
    [Arguments]         ${item_text}
    ${hamburguer}       Set Variable         xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

    Wait Until Element Is Visible      ${hamburguer}        30
    Click Element                      ${hamburguer}

    ${menu_item}        Set Variable        xpath=//*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="${item_text}"]

    Wait Until Element Is Visible      ${menu_item}         30
    Click Element                      ${menu_item}

Go to item
    [Arguments]                     ${item}     ${checkpoint}
    Wait Until Element Is Visible        ${item}        30
    Click Text                      ${item}
    Wait Until Element Is Visible        ${checkpoint}          30
    


Close session
    Close Application
