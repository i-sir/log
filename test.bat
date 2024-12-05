@echo off
setlocal enabledelayedexpansion
title 执行git_log提交github任务


::删除之前的记录
del /q "D:\phpstudy_pro\WWW\git\log\git_log\*.*"



 
 
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


::换行空白符
echo ^.
echo ^..
echo ^...
echo ^....
echo ^.....
echo ^......
echo ^.......
echo ^........
::展示根目录
echo 文件已创建：%target_dir%\%filename%
echo ^........
echo ^......
echo ^.....
echo ^....
echo ^...
echo ^..
echo ^.






::执行Git提交

:: 获取当前脚本的路径  根目录
cd ..
echo 开始执行; %CD%

::进入根目录 ,提交代码
cd /d %~dp0
git add . 
git commit -m "提交; %date:~0,4%-%date:~5,2%-%date:~8,2%; %time:~0,8%"
git push -f origin master

::错误提示一下,不会继续执行
if %errorlevel% neq 0 (  
    echo 提交失败请查看错误原因
    ::循环执行
	cd /d D:\phpstudy_pro\WWW\git\log
	call test.bat
) 
	
::换行空白符
echo ^.
echo ^..
echo ^...
echo ^....
echo ^.....
echo ^......
echo ^.......
echo ^........
::展示根目录
echo 已执行完成 %CD%
echo ^........
echo ^......
echo ^.....
echo ^....
echo ^...
echo ^..
echo ^.



::获取3600-3000随机数
set /a "range=3600-3000+1"
set /a "randomNumber=%random% %% range + 3000"
::换行空白符
echo ^.
echo ^..
echo ^...
echo ^....
echo ^.....
echo ^......
echo ^.......
echo ^........
::随机数
echo 随机数为:%randomNumber%
echo ^........
echo ^......
echo ^.....
echo ^....
echo ^...
echo ^..
echo ^.




::隔随机(3600-3000)秒执行一次
timeout /t %randomNumber% > nul 

::1秒执行一次
::timeout /t 1 > nul 


::循环执行
cd /d D:\phpstudy_pro\WWW\git\log
call test.bat

 
 
