*** Settings ***
Resource	../Keywords/Resource.robot

***Variables***

***Keywords***
Scroll And Check    [Arguments]    ${myLocator}
	:For    ${index}    In Range    3
#	\    ${passed}=    Run Keyword And Return Status    Page Should Contain Element    ${myLocator}
#	\    Run Keyword If    ${passed}    Exit For Loop    ELSE    Swipe    300    650    300    250    1000
	\    ${count}=    Get Matching Xpath Count    ${myLocator}
	\    Run Keyword If    '${count}'>='1'    Exit For Loop    ELSE    Swipe    300    750    300    350    1000
	Page Should Contain Element    ${myLocator}

Scroll To    [Arguments]    ${myLocator}
	:For    ${index}    In Range    20
#	\    ${passed}=    Run Keyword And Return Status    Page Should Contain Element    ${myLocator}
#	\    Run Keyword If    ${passed}    Exit For Loop    ELSE    Swipe    300    600    300    400    1000
	\    ${count}=    Get Matching Xpath Count    ${myLocator}
	\    Run Keyword If    '${count}'>='1'    Exit For Loop    ELSE    Swipe    300    600    300    400    1000
	Page Should Contain Element    ${myLocator}
	Swipe    300    600    300    400    1000

Scroll And Find by Vertical from Position to Position    [Arguments]    ${fromPosX}    ${fromPosY}    ${toPosX}    ${toPosY}    ${locatorToFind}
#I	Swipe to the up
	:FOR    ${index}    IN RANGE    2
	\    ${count}=    Get Matching Xpath Count    ${locatorToFind}
	\    Run Keyword If    ${count}>=1    Exit For Loop    ELSE    Swipe    ${fromPosX}    ${fromPosY}    ${toPosX}    ${toPosY}    1000

Scroll And Find by Horizonal from Position to Position    [Arguments]    ${fromPosX}    ${fromPosY}    ${toPosX}    ${toPosY}    ${locatorToFind}
#I	Swipe to the right
	:FOR    ${index}    IN RANGE    2
	\    ${count}=    Get Matching Xpath Count    ${locatorToFind}
	\    Return From Keyword If    ${count}>=1
	\    Swipe    ${fromPosX}    ${fromPosY}    ${toPosX}    ${toPosY}    1000
#I	Swipe to the left
	:FOR    ${index}    IN RANGE    2
	\    ${count}=    Get Matching Xpath Count    ${locatorToFind}
	\    Return From Keyword If    ${count}>=1
	\    Swipe    ${toPosX}    ${toPosY}    ${fromPosX}    ${fromPosY}    1000

Get X position    [Arguments]    ${locator}
	${position}=    Get Element Location    ${locator}
	[Return]    ${position["x"]}

Get Y position    [Arguments]    ${locator}
	${position}=    Get Element Location    ${locator}
	[Return]    ${position["y"]}

Get Width Element    [Arguments]    ${locator}
	${size}=    Get Element Size    ${locator}
	[Return]    ${size["width"]}

Get Height Element    [Arguments]    ${locator}
	${size}=    Get Element Size    ${locator}
	[Return]    ${size["height"]}

Get X Center Element    [Arguments]    ${locator}
	${fromX}=    Get X position    ${locator}
	${width}=    Get Width Element    ${locator}
	${centerPosition}=    Evaluate   ${fromX}+${width}/2
	[Return]    ${centerPosition}

Get Y Center Element    [Arguments]    ${locator}
	${fromY}=    Get Y position    ${locator}
	${height}=    Get Height Element    ${locator}
	${centerPosition}=    Evaluate   ${fromY}+${height}/2
	[Return]    ${centerPosition}

Move Item        [Arguments]    ${from_locator}    ${to_locator}
	${fromCenterX}=    Get X Center Element    ${from_locator}
	${fromCenterY}=    Get Y Center Element    ${from_locator}
	${toCenterX}=    Get X Center Element    ${to_locator}
	${toCenterY}=    Get Y Center Element    ${to_locator}
	Long Press    ${from_locator}
	Swipe    ${fromCenterX}    ${fromCenterY}    ${toCenterX}    ${toCenterY}    1000
	Sleep    1

Long Press on Element by Percent        [Arguments]    ${locator}    ${x}    ${y}
	${fromX}=    Get X position    ${locator}
	${width}=    Get Width Element    ${locator}
	${elementPositionX}=    Evaluate   ${fromX}+${x}*${width}/100
	${fromY}=    Get Y position    ${locator}
	${height}=    Get Height Element    ${locator}
	${elementPositionY}=    Evaluate   ${fromY}+${y}*${height}/100
	Swipe    ${elementPositionX}    ${elementPositionY}    ${elementPositionX}    ${elementPositionY}    4000

Get Item Smaller Position    [Arguments]    ${ListAnswer}    ${target}
	${targetPosX} =    Get X position    ${target}
	${targetPosY} =    Get Y position    ${target}
#	${targetPosX} =    Get X position    ${AutomationQuizOne_MatchPair_ImageZoom}
#	${targetPosY} =    Get Y position    ${AutomationQuizOne_MatchPair_ImageZoom}
	:FOR    ${index}    IN    @{ListAnswer}
	\    ${count} =    Get Matching Xpath Count    ${index}
	\    Continue For Loop If    ${count}<1
	\    ${itemPosX} =    Get X position    ${index}
	\    ${itemPosY} =    Get Y position    ${index}
	\    Return From Keyword If    ${itemPosX}<=${targetPosX} and ${itemPosy}<=${targetPosy}    ${index}

Go Back to Home Page
	:For    ${index}    In Range    10
	\    ${count_ok}    Get Matching Xpath Count    ${General_OK}
	\    Run Keyword If    ${count_ok}==1    Click Element    ${Summary_Confirm}
	\    Run Keyword If    ${count_ok}==1    Sleep    2
	\    ${count}    Get Matching Xpath Count    ${Home_Page_Button_Revise}
	\    Return From Keyword If    ${count}>=1    ${index}
	\    Go Back
	\    Sleep    2