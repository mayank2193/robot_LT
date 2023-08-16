*** Settings ***
Library    AppiumLibrary
Library    Process  
Library    status.py

Resource  common.robot
Test Teardown  Run Keywords  lambda Status  ${Test Status}  AND  Close Application

*** Variables ***
${USERNAME}    %{LT_USERNAME}   #Can specify lambdatest Username directly instead of Environment variable.
${ACCESS_KEY}    %{LT_ACCESS_KEY}    #Can specify lambdatest Accesskey directly instead of Environment variable.
${REMOTE_URL}    https://${USERNAME}:${ACCESS_KEY}@mobile-hub.lambdatest.com/wd/hub


*** Test Cases ***
Appium Test on lambdatest
   	# id=org.wikipedia.alpha:id/search_container
   
    &{LT_Options}    Create Dictionary
    ...    isRealMobile=true
    ...    platformVersion=12
    ...    deviceName=Pixel 6
    ...    app=android_appurl
    ...    w3c=true
    ...    platformName=Android
    &{DESIRED_CAPABILITIES}    Create Dictionary
    ...    LT:Options=&{LT_Options}
    Open Application  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}
	# id=org.wikipedia.alpha:id/search_container
	Click Element    id=org.wikipedia.alpha:id/search_container
	# id=org.wikipedia.alpha:id/search_src_text
	Click Element    id=org.wikipedia.alpha:id/search_src_text
	Input Text    id=org.wikipedia.alpha:id/search_src_text    Lambdatest
	# xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout[2]/android.view.ViewGroup/android.support.v4.view.ViewPager/android.view.ViewGroup/android.widget.FrameLayout/android.support.v7.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.LinearLayout
	Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout[2]/android.view.ViewGroup/android.support.v4.view.ViewPager/android.view.ViewGroup/android.widget.FrameLayout/android.support.v7.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.LinearLayout
	
	
	
	
    # ${AppUrl}    Run Process    curl -u "${USERNAME}:${ACCESS_KEY}" -X POST "https://api-cloud.lambdatest.com/app-automate/upload" -F "file\=@${APP_PATH}"    shell=true    alias=AppUpload       
    # ${AppData}    Evaluate    json.loads("""${AppUrl.stdout}""")    json
    # Log    ${AppUrl.stdout}
    # ${hash_id}    Set Variable     ${AppData['app_url']}
    # Log    ${hash_id}
