*** Settings ***

***Variables***
#+---------------+----------------+
#|-----[o GENERAL VARIABLE o]-----|
#+---------------+----------------+

#+-------------+--------------+
#|-----[o LOGIN SCREEN o]-----|
#+-------------+--------------+
${todoist_continuewithemail_button}    //android.widget.Button[@text='Continue with email']
${todoist_noneoftheabove_button}    //android.widget.Button[@text='None of the above']

${todoist_email_textfield}        //android.widget.EditText[@resource-id='com.todoist:id/email_exists_input']

${todoist_email_id}        //android.widget.TextView[@text='vignesh.frogasia@gmail.com']

${todoist_continue_button}    //android.widget.Button[@text='Continue']
${todoist_agreetoterms_button}    //android.widget.Button[@text='Agree to Terms']
${todoist_signup_button}    //android.widget.Button[@text='Sign up']


### Login Screen Exist Account

#+------------+--------------+
#|-----[o HOME SCREEN o]-----|
#+------------+--------------+

#+-----------+--------------+
#|-----[o TnC SCREEN o]-----|
#+-----------+--------------+


#+---------------+----+--------------+
#|-----[o WELCOME INFO SCREEN o]-----|
#+---------------+----+--------------+
### Welcome Info Pages ###
## bottom

#+--------------+------------+
#|-----[o Revise Page o]-----|
#+--------------+------------+


#+--------------+--------------+
#|-----[o PHASES DETAIL o]-----|
#+--------------+--------------+
## Subjects
