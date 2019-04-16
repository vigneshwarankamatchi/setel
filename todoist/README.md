# Please read this first.
===========================================
## Pre Requsite

- RobotFramework 
-Genymotion (Emulator)

## About this repo
- This is repo where have files automation for **Todoist** App, 
- **todoist.robot** is a full file contains all comments, 
- We use 5 file **todoist.robot**, **Keywords.robot**, **Variables.robot**, **Settings.robot** and **GeneralKeywords.robot** for running automation.

---
## Command to execute all cases:
 

On **Windows**, use this command:
> C:\Users\vignesh\Desktop\todotest\todoist>```robot --nostatusrc -d Reports --timestampoutputs --log mylog.ht
ml --report report.html  -i mob -v remote_url:None -V vars/todo.yaml Tests/Todoist.robot```

Note:
- We use UserName1 for student2 and UserName2 for student1 because TC-FP-06 will switch account.
- For test in other environment, change "IOT" to "STG", or "PDC".

## App install
We used these file to run automation test, it was uploaded in this repo.
- On emulator device, use apk **fTodoist_v12.8_apkpure.com.apk**

---
## Usage
Use these file fo run automation:
- ~~**Todoist.robot**: this is main file contains test case.~~
- **Keywords.robot**: contains many tasks that handle each action.
- **Variables.robot**: contains locator for each object in view screen.
- **Settings.robot**: set up library to run automation.
- **GeneralKeywords.robot**: custome keyword, or genaral keyword using in everywhere.

---
## More command line useful
- Check python version: python -V
- Check selenium version: python -c 'import selenium; print selenium.__version__'

---
## Link
- Appium server: http://appium.io/
- Robot framework: http://robotframework.org/


Writen by:
- :scream_cat: vigneshwaran.kamatchi.89@.com