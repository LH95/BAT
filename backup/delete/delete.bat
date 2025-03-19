@echo off
rem 删除文件夹内容示例

rem 定义源文件夹
set source_folder=%cd%

rem 删除文件夹内容
del /q "%source_folder%\*"

echo Deletion completed successfully.

rem 等待用户按任意键继续
pause
