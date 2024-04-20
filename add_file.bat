@echo off


::删除之前的记录
del /q "D:\phpstudy_pro\WWW\log\git_log\*.*"



REM 获取当前时间戳
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set "dt=%%I"
set "YYYY=%dt:~0,4%"
set "MM=%dt:~4,2%"
set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%"
set "Min=%dt:~10,2%"
set "Sec=%dt:~12,2%"
set "timeStamp=%YYYY%_%MM%_%DD%_%HH%_%Min%_%Sec%"

REM 指定目录
set "targetDirectory=D:\phpstudy_pro\WWW\log\git_log"  REM 将目标目录路径替换为你想要的路径

REM 创建带有当前时间戳作为文件名的文本文件，并写入当前时间戳作为文件内容到指定目录
echo %timeStamp% > "%targetDirectory%\%timeStamp%.txt"


::换行空白符
@echo ^.
@echo ^..
@echo ^...
@echo ^....
@echo ^.....
@echo ^......
@echo ^.......
@echo ^........
::展示根目录
@echo 文件已创建：%targetDirectory%\%timeStamp%.txt，并写入时间戳：%timeStamp%
@echo ^........
@echo ^......
@echo ^.....
@echo ^....
@echo ^...
@echo ^..
@echo ^.