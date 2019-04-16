*** Settings ***
Resource	../Keywords/Resource.robot

*** Variables ***

*** Keywords ***
Launch FrogPlay
	Open Application	http://localhost:4723/wd/hub	platformName=${PLATFORM_NAME}	platformVersion=${PLATFORM_VERSION}	deviceName=${DEVICE_NAME}	appPackage=${APP_PACKAGE_PLAY}	appActivity=${APP_ACTIVITY_PLAY}


Launch the FrogPlay app
#	Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=5.1    deviceName=192.168.56.102:5555    appPackage=com.frogeducationsdnbhd.play    appActivity=com.frogeducationsdnbhd.play.MainActivity
	Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=5.1.1    deviceName=5d2bd22c    appPackage=com.frogeducationsdnbhd.play    appActivity=com.frogeducationsdnbhd.play.MainActivity
#	Open Application    http://localhost:4723/wd/hub    automationName=UiAutomator2    platformName=Android    platformVersion=5.1.1    deviceName=5c68d347    noReset=${true}    fullReset=${false}    dontStopAppOnReset=${true}    appPackage=com.frogeducationsdnbhd.play    appActivity=com.frogeducationsdnbhd.play.MainActivity    app=C:\\Users\\hoang.nguyent\\Desktop\\current version\\app-armeabi-v7a-releaseIOT.apk    eventTimings=${true}

Navigate to Login Screen
    [Arguments]     ${activity}=None
	${match1}=    Get Matching Xpath Count    ${locator_AppLogin_button}
	${match2}=    Get Matching Xpath Count    ${Login_ExistAccount_AddAnotherAccount}
	${match3}=    Get Matching Xpath Count    ${Home_Page_Button_Settings}
	${match4}=    Get Matching Xpath Count    ${TC_Page_Title}
	Run Keyword If    ${match1}>0	New Account Login
	Run Keyword if    ${match2}>0 and '${activity}'=='None'	Add Another Account Login
	Run Keyword if    ${match2}>0 and '${activity}'=='choose'	Choose an Existing Account Login
	Run Keyword If    ${match3}>0	Log To Console    Account exist, You're in Home Screen.
	Run Keyword if    ${match4}>0	Log To Console    Account exist, You're in TnC Screen.

Using ADB or Appium, programmatically remove linked account from Android Settings
	self.driver.execute_script("mobile:shell", {'direction': 'down'})

login as admin
	Access Login Page	${url}
	Fill Credential and Login	${admin_id}	${admin_password}

Access Login Page	[Arguments]    ${url}
	Run Keyword And Continue On Failure	Wait Until Element Is Visible 	${Locator_URL_field}	timeout=15
	Input Text    ${Locator_URL_field}    ${url}
	Click Button Next

Fill Credential and Login	[Arguments]    ${UserName}    ${Password}
	Verify 1BN Login Page
	Input Text    ${Locator_userName_field}    ${UserName}
	Input Text    ${Locator_password_field}    ${Password}
	Click Element    ${Locator_1BN_btnLogin}

Accept Term and Condition Visibility
	Welcome Alert Visibility
	Home Page Element Visibility

Load FrogPlay Welcome Page
	Run Keyword And Continue On Failure	Wait Until Element Is Visible 	${FrogPlay_text_FROGPLAY}	timeout=15
	Run Keyword And Continue On Failure	Wait Until Element Is Visible 	${locator_FrogPlay_imageLogo}	timeout=15


New Account Login
	Verify Login Page With No Account
	Click Login Button Home Screen

Add Another Account Login
	Verify Login Page With Exist Account
	Click Add Another Account

Choose an Existing Account Login
	Verify Login Page With Exist Account
	Click Choose Exist Account


