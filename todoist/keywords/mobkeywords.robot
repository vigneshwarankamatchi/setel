*** Settings ***
Resource	../Keywords/Resource.robot

#robot --nostatusrc -d Reports --timestampoutputs --log mylog.html --report report.html  -i hub -V vars/todo.yaml Tests/Todoist.robot


*** Variables ***
${todoist_continuewithemail_button}    //android.widget.Button[@text='Continue with email']
${todoist_noneoftheabove_button}    //android.widget.Button[@text='None of the above']

${todoist_email_textfield}        //android.widget.EditText[@resource-id='com.todoist:id/email_exists_input']

${todoist_email_id}        //android.widget.TextView[@text='vignesh.frogasia@gmail.com']

${todoist_continue_button}    //android.widget.Button[@text='Continue']
${todoist_agreetoterms_button}    //android.widget.Button[@text='Agree to Terms']
${todoist_signup_button}    //android.widget.Button[@text='Sign up']


*** Keywords ***
Handle todoist welcome page loading
	Run Keyword And Continue On Failure	Wait Until Element Is Visible 	${todoist_continuewithemail_button}	timeout=15

click on continue with email button
	Run Keyword And Continue On Failure	Wait Until Element Is Visible 	${todoist_continuewithemail_button}	timeout=15
	Run Keyword And Continue On Failure	Click Element 	${todoist_continuewithemail_button}
	Run Keyword And Continue On Failure	Wait Until Element Is Visible 	${todoist_noneoftheabove_button}|${todoist_email_textfield}	timeout=15

click on continue with email
	Run Keyword And Continue On Failure	Wait Until Element Is Visible 	${todoist_continuewithemail_button}	timeout=15
	Run Keyword And Continue On Failure	Click Element 	${todoist_continuewithemail_button}
	Run Keyword And Continue On Failure	Wait Until Element Is Visible 	${todoist_signup_button}	timeout=15

input email address
    [Arguments]     ${email}
	Run Keyword And Continue On Failure	Wait Until Element Is Visible 	${todoist_email_textfield}
	Run Keyword And Continue On Failure	Input Text	${todoist_email_textfield}   ${email}

handle none of the above
    [Arguments]     ${email}=None
	${match}=    Get Matching Xpath Count    ${todoist_noneoftheabove_button}
	Run Keyword If    ${match1}>0 and '${activity}'=='None'	Run Keyword And Continue On Failure	Click Element 	${todoist_noneoftheabove_button}
	Run Keyword if    ${match2}>0 and '${activity}'!='None'	Click Choose Exist Account 	${email}

Click Choose Exist Account
    [Arguments]     ${email}
	Run Keyword And Continue On Failure	Click Element    //android.widget.TextView[@text='${email}'']

click on signup
	Run Keyword And Continue On Failure	Wait Until Element Is Visible 	${todoist_signup_button}	timeout=15
	Run Keyword And Continue On Failure	Click Element 	${todoist_signup_button}
	Run Keyword And Continue On Failure	Wait Until Element Is Visible 	${todoist_agreetoterms_button}	timeout=15

click on agree to terms
	Run Keyword And Continue On Failure	Wait Until Element Is Visible 	${todoist_agreetoterms_button}	timeout=15
	Run Keyword And Continue On Failure	Click Element 	${todoist_agreetoterms_button}
	Run Keyword And Continue On Failure	Wait Until Element Is Visible 	${todoist_continue_button}	timeout=15
















