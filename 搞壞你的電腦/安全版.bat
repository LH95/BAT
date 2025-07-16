@echo off
setlocal enabledelayedexpansion

set max=2

:start
REM 取得目前 cmd.exe 視窗數量
for /f %%A in ('tasklist /FI "IMAGENAME eq cmd.exe" /FO CSV ^| find /c "cmd.exe"') do set current=%%A

REM tasklist 會包含 header 行，減 1 才是實際視窗數
set /a current-=1

echo 目前 cmd.exe 視窗數：!current!

if !current! lss %max% (
    start "" cmd /c "timeout /t 10 >nul"
    timeout /t 1 >nul
    goto start
) else (
    echo 達到最大數量 %max%，準備關閉所有 cmd.exe 視窗
    taskkill /f /im cmd.exe /t >nul
    timeout /t 2 >nul
    goto start
)
