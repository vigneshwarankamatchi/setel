*** Settings ***
#robot --nostatusrc -d Reports --timestampoutputs --log mylog.html --report report.html  -i hub -V vars/todo.yaml Tests/Todoist.robot
Library     DebugLibrary

*** Variables ***
${REMOTE_URL}	http://localhost:4723/wd/hub
${PLATFORM_NAME}	Android
${PLATFORM_VERSION}	5.1.1
# ${DEVICE_NAME}    53259b0b
# ${DEVICE_NAME}    192.168.64.102:5555   #emualtor
${DEVICE_NAME}    192.168.64.103:5555
${APP}	<my_bundle_id>
${APP_PACKAGE_TODOIST}	com.todoist
${APP_ACTIVITY_TODOIST}	com.todoist.activity.HomeActivity
${FrogPlay_Blank_FrameLayout}    //android.widget.FrameLayout[@resource-id='android:id/content']
${FrogPlay_text_FROGPLAY}    //android.widget.TextView[@text='FROG PLAY ']


*** Keywords ***
Open App
    Open Application    http://localhost:4723/wd/hub
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE_TODOIST}
    ...    appActivity=${APP_ACTIVITY_TODOIST}
    # ...    isHeadless=true




