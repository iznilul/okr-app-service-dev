@echo off 
setlocal enabledelayedexpansion
::��ϵͳ��ʱ
set /a b=0
dir /b/od
::��ʱ��˳����ʾ��ǰ�ļ����µ������ļ���
pause
::���㷴��ʱ��
for /f "delims=" %%f in ('dir /b/od *.*') do (
  if not "%%f"=="%~nx0" (
           set /a b+=1 
           ren "%%f" "!b!%%~xf"
           echo. !b!%%~xf
)
)
pause