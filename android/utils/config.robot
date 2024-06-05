*** Settings ***

Resource     ../../base.robot


*** Variables ***

${ANDROID_AUTOMATION_NAME}      UIAutomator2
${ANDROID_PLATFORM_NAME}        Android
${ANDROID_PLATFORM_VERSION}     12
${ANDROID_APP_PACKAGE}          br.com.pztec.estoque
${ANDROID_APP_ACTIVITY}         .Inicio
${AUTO_GRANT_PERMISSIONS}       true

*** Keywords ***
Abrir App
    Open Application     http://127.0.0.1:4723    automationName=${ANDROID_AUTOMATION_NAME}    platformName=${ANDROID_PLATFORM_NAME}    
    ...    platformVersion=${ANDROID_PLATFORM_VERSION}     appPackage=${ANDROID_APP_PACKAGE}    appActivity=${ANDROID_APP_ACTIVITY}   
    ...    autoGrantPermissions=${AUTO_GRANT_PERMISSIONS}

Teardown
    [Arguments]
    Run Keyword If Test Failed    Capture Page Screenshot
    Close All Applications