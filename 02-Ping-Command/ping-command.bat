@echo off
title Ping Command
set /p adr=Adress : 
ping %adr% -t
pause