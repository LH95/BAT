@echo off
rem 恢复当前目录内容示例

rem 获取当前目录
set source_folder=%cd%
rem 获取上一级目录
for %%i in ("%source_folder%") do set "parent_folder=%%~dpi"
set parent_folder=%parent_folder:~0,-1%

rem 定义备份文件路径
set backup_file=%parent_folder%\backup.zip

rem 使用 PowerShell 将 zip 文件解压缩到文件夹
powershell Expand-Archive -Path "%backup_file%" -DestinationPath "%source_folder%" -Force

echo Restore completed successfully.

rem 等待用户按任意键继续
pause
