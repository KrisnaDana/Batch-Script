@echo off
title Wifi Configuration Static

for /F "tokens=14" %%i in ('ipconfig ^| findstr IPv4') do set _IPaddress=%%i
echo %_IPaddress%

for /F "tokens=15" %%j in ('ipconfig ^| findstr Subnet') do set _SubnetMask=%%j
echo %_SubnetMask%

for /F "tokens=13" %%k in ('ipconfig ^| findstr Default') do set _DefaultGateway=%%k
echo %_DefaultGateway%

netsh int ip set address "Wi-Fi" static %_IPaddress% %_SubnetMask% %_DefaultGateway%
netsh int ip set dns name="Wi-Fi" static 8.8.8.8
netsh int ip add dns name="Wi-Fi" addr=8.8.4.4 index=2

echo DONE
pause

