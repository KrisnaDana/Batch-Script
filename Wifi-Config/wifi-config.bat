@echo off
title Wifi Configuration
:start
echo =========================================
echo           Run As Administrator         
echo =========================================
echo 1. Wifi configuration to automatic (DHCP)
echo 2. Wifi configuration to static
echo 3. Exit
set input= 
set /p input=Enter your input: 
if not '%input%'=='' set input=%input:~0,1%
if '%input%'=='1' goto con1
if '%input%'=='2' goto con2
if '%input%'=='3' goto end
echo "%input%" is not valid, try again
goto start

:con1
netsh int ip set address name = "Wi-Fi" dhcp
netsh int ip set dns name="Wi-Fi" dhcp
echo DONE
goto start

:con2
for /F "tokens=14" %%i in ('ipconfig ^| findstr IPv4') do set _IPaddress=%%i
for /F "tokens=15" %%j in ('ipconfig ^| findstr Subnet') do set _SubnetMask=%%j
for /F "tokens=13" %%k in ('ipconfig ^| findstr Default') do set _DefaultGateway=%%k
netsh int ip set address "Wi-Fi" static %_IPaddress% %_SubnetMask% %_DefaultGateway%
netsh int ip set dns name="Wi-Fi" static 8.8.8.8
netsh int ip add dns name="Wi-Fi" addr=8.8.4.4 index=2
echo DONE
goto start

:end