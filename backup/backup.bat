@echo off
rem 备份当前目录内容并将 zip 文件保存到上一级目录

rem 获取当前目录
set source_folder=%cd%
rem 获取上一级目录
for %%i in ("%source_folder%") do set "parent_folder=%%~dpi"
set parent_folder=%parent_folder:~0,-1%

rem 定义备份文件路径
set backup_file=%parent_folder%\backup.zip

rem 使用 PowerShell 将文件夹压缩为 zip 文件，添加 -Force 参数以覆盖现有文件
powershell Compress-Archive -Path "%source_folder%\*" -DestinationPath "%backup_file%" -Force

echo Backup completed successfully.

rem 等待用户按任意键继续
pause
