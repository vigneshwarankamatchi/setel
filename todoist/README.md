# Please read this first.
===========================================
## About this repo
- This is repo where have files automation for **FrogPlay** App, written by FrogRead Team.
- FrogPlay App will be still updating, so this repo will update too.
- **TC-FP-master.robot** is a full file contains all comments, ~~FrogPlayMobile.robot is a minium file extract from TC-FP-master.robot~~
- We use 5 file **FrogPlayMobile.robot**, **Keywords.robot**, **Variables.robot**, **Settings.robot** and **GeneralKeywords.robot** for running automation.
- Link to FrogPlay Automation scenarios https://frogeducation.atlassian.net/wiki/spaces/MA/pages/114167753/FrogPlay+Mobile+App

---
## Command to execute all cases:
On **MAC**, use this command:
> pybot -i stable -v Env:"IOT" -v school02_URL:frog903-iot.1bestarinet.net -v UserName1:frogmestudent1@yes1.my -v UserName2:frogmestudent2@yes1.my -v UserNameNon:frogmeadmin1@yes1.my -v Password:frogtest -v QuizzName:"automation quiz one" -v QuizzGroupName:"automation quiz" -v QuizzNameRubbish:"automation quiz rubbish" -v Different_school_URL:frog902-iot.1bestarinet.net -v UserName3:frogmestudent3@yes1.my -v UserNameTeacher:Teacher.Duc@portaldev.ytlcomms.my TC-FP-Master.robot

On **Windows**, use this command:
> python -m robot -i stable -v Env:"IOT" -v school02_URL:frog903-iot.1bestarinet.net -v UserName1:frogmestudent1@yes1.my -v UserName2:frogmestudent2@yes1.my -v UserNameNon:frogmeadmin1@yes1.my -v Password:frogtest -v QuizzName:"automation quiz one" -v QuizzGroupName:"automation quiz" -v QuizzNameRubbish:"automation quiz rubbish" -v Different_school_URL:frog902-iot.1bestarinet.net -v UserName3:frogmestudent3@yes1.my -v UserNameTeacher:Teacher.Duc@portaldev.ytlcomms.my TC-FP-Master.robot

Note:
- We use UserName1 for student2 and UserName2 for student1 because TC-FP-06 will switch account.
- For test in other environment, change "IOT" to "STG", or "PDC".

---
## URL and account for testing
For difference environment, we use diference URL and difference user account:
> IOT:
- IOT url: frog903-iot.1bestarinet.net
- Student account: frogmestudent1@yes1.my, frogmestudent2@yes1.my and frogmestudent3@yes1.my
- Admin account: frogmeadmin1@yes1.my
- Teacher account: Teacher.Duc@portaldev.ytlcomms.my
- Parent account: frogplayfatherone@portaldev.ytlcomms.my, frogplaymotherone@portaldev.ytlcomms.my

> STG:
- STG url: ytlschool02-stg-web02.1bestarinet.net
- Student account: AOstudent@portalpreprod.ytlcomms.my, atstudent@portalpreprod.ytlcomms.my
- Student account bonus: L.Issac@portalpreprod.ytlcomms.my, Lim.Duc@portalpreprod.ytlcomms.my
- Admin account: aoadmin@portalpreprod.ytlcomms.my
- Teacher account: vigneshstaff@portalpreprod.ytlcomms.my

> PDC:
- PDC url: frogasiatraining3.1bestarinet.net
- Student account: FlorStuOne@yes.my, FlorStuTwo@yes.my
- Admint account: florenceadmin@yes.my

 Default pass for all account: frogtest


---
## App install
We used these file to run automation test, it was uploaded in this repo.
- On real device, use apk **frogplay-v0.9.25-qa-arm.apk**
- On virtual divice use apk **frogplay-v0.9.25-qa-x86.apk**
- ~~Link to download and install: https://drive.google.com/drive/folders/0BwLpY7TOP7zUb3pyWmQ1ZUVmSTA~~
- New link for download and install: https://git.frogeducation.com/titan/frog-play/pipelines

---
## Usage
Use these file fo run automation:
- ~~**FrogPlayMobile.robot**: this is main file contains test case.~~
- ~~**TC-FP-Master.robot**: not only contains test case like **FrogPlayMobile.robot**, but also have comment. Run this will faster **FrogPlayMobile.robot**.~~
- **TC-FP-Master.robot**: this is main file contains test case.
- **Keywords.robot**: contains many tasks that handle each action.
- **Variables.robot**: contains locator for each object in view screen.
- **Settings.robot**: set up library to run automation.
- **GeneralKeywords.robot**: custome keyword, or genaral keyword using in everywhere.

---
## Special Keywords
In Frog Play, we have some custome special case:
>**Handle Loading to Main Screen** | ${launch_values}

- ${launch_values} can be string in set of values: **TC**, **home**, **exist** or **any strings**.
- If we put **any strings value**, it goes to check generally and take more a bit time (less than 1 second).

>**Login to 1BN** | ${school_link} | ${user_name} | ${pass_word} | ${type_of_accout}

- ${type_of_accout} is string in set of values: **new**, **non**.
- **new** value uses for new student account.
- **non** value uses for non-student account.

---
## Annotation
I put a signal in every comment line to annotate more infomation:
- **#C**: means this notation is a "`C`ommand line" to run any test case. If it appear very early, using for run test all case; if it appear before each Test Case, using only for that case.
- **#I**: means "`I`nfomation". It provide more infomation for Tester.
- **#E**: means "`E`xtra command". The line has #E signal is a **Keywords** and can put in there to run or not depend on Tester, this keyword was used in previous test case and not need to run.
- **#N**: means "`N`eed but currenly has error", using for **Keywords**. Because of this **Keywords** should exist here but can not run for some special reason, so i must comment it.
- **#S**: means "`S`kip", using for **Keywords**. This Keywords should be skipped because it no longer suitable for purpose of this test case.
- **#W**: means "`W`aiting", using for **Keywords**. Because of having something wrong in current version, it will be uncomment in next version.

---
## Issue & Resolve
- [x] In some case using web to do something, automation is not working on virtual device, so we switch to real device.
- [x] On **Windows** use this cmd to run: **python -m robot**, on **MAC** os use this cmd: **pybot**
- [x] When use Keywords "Hide Keyboard" on virtual device. Sometimes it make click event fail.

---
## Answer & Question
- New appium server will better?__
Yes, it use new automation engine, see https://github.com/appium/appium/blob/master/docs/en/writing-running-appium/caps.md to choose a sutable parameter, having many config to run automation better.
\
- Where to read document about keyword?__
You can go here https://github.com/robotframework/robotframework to read document.
\
- Why does my automation running slow?__
Oh, I finded out the reason. It come from react-native code, any component was changed state consecutively. You must fix that bug.
\
- Why does my app launch slowly?__
Please **remove all old appium server**, then install the lastest one.

---
## More command line useful
- Check python version: python -V
- Check selenium version: python -c 'import selenium; print selenium.__version__'

---
## Link
- Appium server: http://appium.io/
- Robot framework: http://robotframework.org/
- Nodejs: https://nodejs.org/en/

---
## Contributing
Thank to:
- :sunglasses: yogi.herdian@frogasia.com
- :ship: frog team.

Writen by:
- :scream_cat: hoang.nguyent@titancorpvn.com