*** Settings ***
Library    AppiumLibrary

*** Variables ***
${setupScript}		lambda-status=passed

*** Keywords ***

Close test
    Execute Script    ${setupScript}    
    Close Application