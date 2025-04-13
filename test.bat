@echo off
setlocal enabledelayedexpansion
title ִ��log�ύgithub����

:: ��������ѭ����־
:main_loop

:: ɾ��֮ǰ�ļ�¼
del /q "D:\phpstudy_pro\WWW\git\log\git_log\*.*" >nul 2>&1

REM ��ȡ��ǰ���ں�ʱ��
for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set datetime=%%a

REM ��ȡ������ʱ����
set "year=!datetime:~0,4!"
set "month=!datetime:~4,2!"
set "day=!datetime:~6,2!"
set "hour=!datetime:~8,2!"
set "minute=!datetime:~10,2!"
set "second=!datetime:~12,2!"

REM ָ��Ŀ��Ŀ¼
set "target_dir=D:\phpstudy_pro\WWW\git\log\git_log\"

REM �����ļ���������
set "filename=%year%%month%%day%_%hour%.txt"
set "filecontent=%year%-%month%-%day% %hour%:%minute%:%second%"

REM �����ļ�
echo %filecontent% > "%target_dir%\%filename%"

:: �������
call :print_separator
echo �ļ��Ѵ�����%target_dir%\%filename%
call :print_separator

:: ִ��Git�ύ
cd /d "D:\phpstudy_pro\WWW\git\log"
echo ��ʼִ��: %CD%

git add . 
git commit -m "�ύ; %date:~0,4%-%date:~5,2%-%date:~8,2%; %time:~0,8%"
git push -f origin master

:: ������
if %errorlevel% neq 0 (
    call :print_separator
    echo �ύʧ����鿴����ԭ��
    call :print_separator
    
    :: �ȴ�5�������
    timeout /t 5 >nul
    goto main_loop
) 

:: �ɹ����
call :print_separator
echo ��ִ����� %CD%
call :print_separator

:: ��ȡ3600-3000�����
set /a "randomNumber=%random% %% 600 + 3000"

call :print_separator
echo �´�ִ�н��� %randomNumber% ���
echo ��ǰʱ��: %time%
call :print_separator

:: �����(3600-3000)��ִ��һ��
timeout /t %randomNumber% >nul 

:: ѭ��ִ��
goto main_loop

:: �ָ����ӳ���
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