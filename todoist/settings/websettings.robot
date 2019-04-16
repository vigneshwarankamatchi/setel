*** Setting ***

Library	Selenium2Library	run_on_failure=Selenium2Library.CapturePageScreenshot
Library	Collections
Library	XML
Library	String
Library	XvfbRobot
Library	OperatingSystem
Library	DateTime
Library	../keywords/generator.py
# Library	../Script/browsersession.py

*** Variables ***

${DELAY}	0.05
${remote_url}	None
${alias}	None
${blank_page}	about:blank

*** Keywords ***
Test Case Setup	[Arguments]	${platform}	${env}
	Set Selenium Speed	${DELAY}
	Run Keyword If	'${platform}'=='windows'	Setup Windows
	Run Keyword If	'${platform}'=='linux'	Setup Linux
	Run Keyword If	'${platform}'=='mac'	Setup Mac
	Set Global Variable	${env}

Setup Windows
#	Run keyword If	'${remote_url}'=='None'	Open Browser	${blank_page}	${browser}
	Run keyword If  '${remote_url}'=='None'      Launch Chrome Without Bar
	...  ELSE	Open Browser	${blank_page}	${browser}	${alias}	${remote_url}
	Run keyword If  '${remote_url}'=='None'  Maximize Browser Window
	...  ELSE    Set Window Size    1400    900

Setup Linux
	# Start Virtual Display	1400	900
#	Run keyword If	'${remote_url}'=='None'	Open Browser	${blank_page}	${browser}
	Run keyword If  '${remote_url}'=='None'      Launch Chrome Without Bar
	...  ELSE	Open Browser	${blank_page}	${browser}	${alias}	${remote_url}
	Run keyword If  '${remote_url}'=='None'  Maximize Browser Window
	...  ELSE    Set Window Size    1400    900

Setup Mac
	Run keyword If	'${remote_url}'=='None'	Open Browser	${blank_page}	${browser}
	...  ELSE	Open Browser	${login_url01}	${browser}	${alias}	${remote_url}
	Run keyword If  '${remote_url}'=='None'  Maximize Browser Window
	...  ELSE    Set Window Size    1400    900

# Removes the chrome bar at the top which says "Chrome browser controlled by automation software"
Launch Chrome Without Bar
	${options}=	Evaluate	sys.modules['selenium.webdriver'].ChromeOptions()   sys, selenium.webdriver
	${prefs}	Create Dictionary   credentials_enable_service=${false}
	Call Method	${options}	add_experimental_option	prefs	${prefs}
	Call Method	${options}	add_argument	disable-infobars
	Create WebDriver	Chrome	chrome_options=${options}


#	${x}	${y}=	Get Window Position
#	${width}	${height}=	Get Window Size
#	Run Keyword If	${width}<1024 and ${height}>748
#	...	Set Window Size	${1024}	${height}
#	Run Keyword If	${width}>1024 and ${height}<748
#	...	Set Window Size	${width}	768
#	Run Keyword If	${width}<1024 and ${height}<748
#	...	Set Window Size	${1024}	${768}
#	${width}	${height}=	Get Window Size
#	Set Window Position	${x}	${y}