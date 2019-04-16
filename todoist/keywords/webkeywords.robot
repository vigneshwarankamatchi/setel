*** Settings ***
Resource	../Keywords/Resource.robot

*** Variables ***
${loginpage_login_button}    //a[@class="td-header__action-link sel_login"]
${loginpage_title}    Todoist – The Best To Do List App & Task Manager
${loginpage_username}	//*[@id="email"]
${loginpage_password}	//*[@id="password"]
${modal_login_button}	//*[@id="login_form"]/a[text()='Log in']
${homepage_Today_title}	//*[@id="agenda_view"]/div[1]/div/h2/a[text()='Today']
${homepage_addproject_button}	//*[@id="projects_list_manager"]/div[1]/a[text()="Add Project"]
${homepage_addproject_redbutton}	//*[@id="projects_list"]/li[3]/form/table[2]/tbody/tr/td[1]/a[1]/span[text()="Add Project"]
${loginframe_modal}    //*[@id="GB_window"]/div/div[2]/iframe
${homepage_nameyuorproj_text}    //*[@id="projects_list"]//div[@placeholder="Name your project"]
${modaliframe}    //*[@id="GB_frame"]

*** Keywords ***
login to the system
	[Arguments]	${url}	${email}	${password}
	Test Case Setup 	${platform}	${env}
	webkeywords.Access Login Page	${url}
	Landing Page
	Click Login button on homepage
	Sleep    5
	Get Window Handles
	Switch To iFrame
	Switch To login iFrame
	Sleep    1
	Enter Credential	${email}	${password}
	Click Login button on modal
	Home Page Element Visibility



Home Page Element Visibility
	Run Keyword And Continue On Failure	Selenium2Library.Wait Until Element Is Visible   ${homepage_Today_title}
	Run Keyword And Continue On Failure	Selenium2Library.Wait Until Element Is Visible   ${homepage_addproject_button}


Click on add project
	Run Keyword And Continue On Failure	Selenium2Library.Wait Until Element Is Visible   ${homepage_addproject_button}
	Run Keyword And Continue On Failure	Wait Until Keyword Succeeds    3x    300ms    Selenium2Library.Click Element	${homepage_addproject_button}
	Run Keyword And Continue On Failure	Selenium2Library.Wait Until Element Is Visible   ${homepage_nameyuorproj_text}

Click on add project red button
	Run Keyword And Continue On Failure	Selenium2Library.Wait Until Element Is Visible   ${homepage_addproject_redbutton}
	Run Keyword And Continue On Failure	Selenium2Library.Click Element	${homepage_addproject_redbutton}

Confirm projected added
	[Arguments]	${projname}
	Run Keyword And Continue On Failure	Selenium2Library.Wait Until Element Is Visible   //*[@id="projects_list"]//li/table/tbody/tr/td[2]/span[text()="${projname}"]

name your project
	[Arguments]	${projname}
	Run Keyword And Continue On Failure	Selenium2Library.Wait Until Element Is Visible   ${homepage_nameyuorproj_text}
	Run Keyword And Continue On Failure	Selenium2Library.Input Text	${homepage_nameyuorproj_text}	${projname}



Access Login Page
	[Arguments]	${url}
	Go To	${url}

Landing Page
	Title Should Be	${loginpage_title}
	Selenium2Library.Wait Until Element Is Visible	${loginpage_login_button}

Enter Credential
	[Arguments]	${email}	${password}
	Run Keyword And Continue On Failure	Selenium2Library.Wait Until Element Is Visible   ${loginpage_username}
	Run Keyword And Continue On Failure	Selenium2Library.Input Text	${loginpage_username}	${email}
	Run Keyword And Continue On Failure	Selenium2Library.Wait Until Element Is Visible   ${loginpage_password}
	Run Keyword And Continue On Failure	Selenium2Library.Input Text	${loginpage_password}	${password}

Click Login button on modal
	Run Keyword And Continue On Failure	Selenium2Library.Wait Until Element Is Visible   ${modal_login_button}
	Run Keyword And Continue On Failure	Selenium2Library.Click Element	${modal_login_button}

Click Login button on homepage
	Run Keyword And Continue On Failure	Selenium2Library.Wait Until Element Is Visible   ${loginpage_login_button}
	Run Keyword And Continue On Failure	Selenium2Library.Click Element	${loginpage_login_button}

Switch To iFrame
	Run Keyword And Continue On Failure	Selenium2Library.Wait Until Page Contains Element    ${loginframe_modal}    timeout=5
	Run Keyword And Continue On Failure	Selenium2Library.Select Frame    ${loginframe_modal}

Switch To login iFrame
	Run Keyword And Continue On Failure	Selenium2Library.Wait Until Page Contains Element    ${modaliframe}    timeout=5
	Run Keyword And Continue On Failure	Selenium2Library.Select Frame    ${modaliframe}

