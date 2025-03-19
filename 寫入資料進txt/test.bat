@echo off
chcp 65001 > nul
rem 中文
rem 這個批處理文件用於獲取IP地址、當前登入帳號、日期時間、機器名稱、時區及其寫入txt文件

rem 使用ipconfig命令獲取IPv4地址
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do (
    set ip=%%a
    goto :found
)

:found
rem 去除IP地址前面的空格
set ip=%ip:~1%

rem 獲取當前日期和時間
for /f "tokens=2 delims==" %%i in ('wmic os get localdatetime /value') do set datetime=%%i

set year=%datetime:~0,4%
set month=%datetime:~4,2%
set day=%datetime:~6,2%
set hour=%datetime:~8,2%
set minute=%datetime:~10,2%
set second=%datetime:~12,2%

set formattedDateTime=%year%/%month%/%day% %hour%:%minute%:%second%

rem 獲取當前登入的帳號
for /f %%i in ('whoami') do set username=%%i

rem 使用 PowerShell 獲取當前時區
for /f "delims=" %%z in ('powershell -Command "(Get-TimeZone).DisplayName"') do set timezone=%%z

rem 使用环境变量获取机器名
set machine=%COMPUTERNAME%

rem 將日期時間、機器名稱、時區、IP地址、登入帳號寫入txt文件
echo 時間: %formattedDateTime% %timezone% >> ip_log.txt
echo 機器: %machine% >> ip_log.txt
echo IP: %ip% >> ip_log.txt
echo 帳號: %username% >> ip_log.txt
echo ------------------------- >> ip_log.txt
