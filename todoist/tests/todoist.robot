*** Settings ***
Resource	../Keywords/Resource.robot
Library	Selenium2Library	run_on_failure=Selenium2Library.CapturePageScreenshot

#robot --nostatusrc -d Reports --timestampoutputs --log mylog.html --report report.html  -i hub -V vars/todo.yaml Tests/Todoist.robot

# Test Setup	Launch Todoist
# Test Setup	Open App
# Test Teardown	Close Application
*** Variables ***
${todoist_continuewithemail_button}    //android.widget.Button[@text='Continue with email']
${todoist_noneoftheabove_button}    //android.widget.Button[@text='None of the above']

${todoist_email_textfield}        //android.widget.EditText[@resource-id='com.todoist:id/email_exists_input']
${todoist_password_textfield}        //android.widget.EditText[@resource-id='com.todoist:id/log_in_password']

${todoist_email_id}        //android.widget.TextView[@text='vignesh.frogasia@gmail.com']
${todoist_login_button}    //android.widget.Button[@text='Log in']
${todoist_yes_button}    //android.widget.Button[@text='YES']
${todoist_burger_button}    //android.widget.ImageButton[@content-desc='Change the current view']
${todoist_project_button}    //android.widget.TextView[@text='Projects']

${todoist_continue_button}    //android.widget.Button[@text='Continue']
${todoist_agreetoterms_button}    //android.widget.Button[@text='Agree to Terms']
${todoist_signup_button}    //android.widget.Button[@text='Sign up']


*** Keywords ***
Handle todoist welcome page loading
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Visible 	${todoist_continuewithemail_button}	timeout=15

click on login button
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Visible 	${todoist_login_button}	timeout=15
	Run Keyword And Continue On Failure	AppiumLibrary.Click Element 	${todoist_login_button}
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Not Visible 	${todoist_login_button}	timeout=15



click on projects button
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Visible 	${todoist_project_button}	timeout=15
	Run Keyword And Continue On Failure	AppiumLibrary.Click Element 	${todoist_project_button}


Confirm if the project displayed
    [Arguments]     ${projectname}
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Visible 	//android.widget.TextView[@text='${projectname}']

click on burger button
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Visible 	${todoist_burger_button}	timeout=15
	Run Keyword And Continue On Failure	AppiumLibrary.Click Element 	${todoist_burger_button}
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Not Visible 	${todoist_burger_button}	timeout=15

click on continue with email button
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Visible 	${todoist_continuewithemail_button}	timeout=15
	Run Keyword And Continue On Failure	AppiumLibrary.Click Element 	${todoist_continuewithemail_button}
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Visible 	${todoist_noneoftheabove_button}|${todoist_email_textfield}	timeout=15

click on continue with email
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Visible 	${todoist_continuewithemail_button}	timeout=15
	Run Keyword And Continue On Failure	AppiumLibrary.Click Element 	${todoist_continuewithemail_button}
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Visible 	${todoist_signup_button}	timeout=15

input email address
    [Arguments]     ${email}
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Visible 	${todoist_email_textfield}
	Run Keyword And Continue On Failure	AppiumLibrary.Input Text	${todoist_email_textfield}   ${email}

input password
    [Arguments]     ${password}
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Visible 	${todoist_password_textfield}
	Run Keyword And Continue On Failure	AppiumLibrary.Input Text	${todoist_password_textfield}   ${password}


handle timezone
	${match}=    AppiumLibrary.Get Matching Xpath Count    ${todoist_yes_button}
	Run Keyword If    ${match1}>0 	Run Keyword And Continue On Failure	AppiumLibrary.Click Element 	${todoist_yes_button}


handle none of the above
    [Arguments]     ${email}=None
	${match}=    AppiumLibrary.Get Matching Xpath Count    ${todoist_noneoftheabove_button}
	Run Keyword If    ${match1}>0 and '${activity}'=='None'	Run Keyword And Continue On Failure	AppiumLibrary.Click Element 	${todoist_noneoftheabove_button}
	Run Keyword if    ${match2}>0 and '${activity}'!='None'	Click Choose Exist Account 	${email}

Click Choose Exist Account
    [Arguments]     ${email}
	Run Keyword And Continue On Failure	AppiumLibrary.Click Element    //android.widget.TextView[@text='${email}'']

click on signup
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Visible 	${todoist_signup_button}	timeout=15
	Run Keyword And Continue On Failure	AppiumLibrary.Click Element 	${todoist_signup_button}
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Visible 	${todoist_agreetoterms_button}	timeout=15

click on agree to terms
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Visible 	${todoist_agreetoterms_button}	timeout=15
	Run Keyword And Continue On Failure	AppiumLibrary.Click Element 	${todoist_agreetoterms_button}
	Run Keyword And Continue On Failure	AppiumLibrary.Wait Until Element Is Visible 	${todoist_continue_button}	timeout=15


*** Test Cases ***
TC-01 - login to todoist in web
	[Tags]    high    tc01    web
	${projname}=	generate project name
	Set Suite Variable	${projname}
	login to the system	${url}	${username}	${password}
	Click on add project
	name your project	${projname}
	Click on add project
	name your project	${projname}
	Click on add project red button
	Confirm projected added	${projname}

TC-01 - login to todoist
	[Tags]    high    tc01    low  mob
	[Documentation]    login to todoist
	Open App
	Reset Application
	Run Keyword And Continue On Failure	Handle todoist welcome page loading
	Run Keyword And Continue On Failure	click on continue with email button
	Run Keyword And Continue On Failure	handle none of the above
	# Run Keyword And Continue On Failure	click on continue with email
	Run Keyword And Continue On Failure	input email address 	${email}
	Run Keyword And Continue On Failure	click on continue with email
	Run Keyword And Continue On Failure	input password 	${password}
	Run Keyword And Continue On Failure	click on login button
	Sleep    1
	handle timezone
	click on burger button
	Confirm if the project displayed	${projname}












