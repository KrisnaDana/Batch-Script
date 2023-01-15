@echo off
title Wifi Configuration DHCP

netsh int ip set address name = "Wi-Fi" dhcp
netsh int ip set dns name="Wi-Fi" dhcp

pause