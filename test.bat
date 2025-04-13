@echo off
setlocal enabledelayedexpansion
title 执行log提交github任务

:: 设置无限循环标志
:main_loop

:: 删除之前的记录
del /q "D:\phpstudy_pro\WWW\git\log\git_log\*.*" >nul 2>&1

REM 获取当前日期和时间
for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set datetime=%%a

REM 提取年月日时分秒
set "year=!datetime:~0,4!"
set "month=!datetime:~4,2!"
set "day=!datetime:~6,2!"
set "hour=!datetime:~8,2!"
set "minute=!datetime:~10,2!"
set "second=!datetime:~12,2!"

REM 指定目标目录
set "target_dir=D:\phpstudy_pro\WWW\git\log\git_log\"

REM 构造文件名和内容
set "filename=%year%%month%%day%_%hour%.txt"
set "filecontent=%year%-%month%-%day% %hour%:%minute%:%second%"

REM 创建文件
echo %filecontent% > "%target_dir%\%filename%"

:: 美化输出
call :print_separator
echo 文件已创建：%target_dir%\%filename%
call :print_separator

:: 执行Git提交
cd /d "D:\phpstudy_pro\WWW\git\log"
echo 开始执行: %CD%

git add . 
git commit -m "提交; %date:~0,4%-%date:~5,2%-%date:~8,2%; %time:~0,8%"
git push -f origin master

:: 错误处理
if %errorlevel% neq 0 (
    call :print_separator
    echo 提交失败请查看错误原因
    call :print_separator
    
    :: 等待5秒后重试
    timeout /t 5 >nul
    goto main_loop
) 

:: 成功输出
call :print_separator
echo 已执行完成 %CD%
call :print_separator

:: 获取3600-3000随机数
set /a "randomNumber=%random% %% 600 + 3000"

call :print_separator
echo 下次执行将在 %randomNumber% 秒后
echo 当前时间: %time%
call :print_separator

:: 隔随机(3600-3000)秒执行一次
timeout /t %randomNumber% >nul 

:: 循环执行
goto main_loop

:: 分隔符子程序
:print_separator
echo ^.
echo ^..
echo ^...
echo ^....
echo ^.....
echo ^......
echo ^.......
echo ^........
goto :eof