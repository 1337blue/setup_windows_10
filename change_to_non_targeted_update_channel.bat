@echo off

mkdir "%windir%\BatchGotAdmin"
if '%errorlevel%' == '0' (
rmdir "%windir%\BatchGotAdmin" & goto gotAdmin
) else ( goto UACPrompt )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute %0, "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"

reg add HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings /v BranchReadinessLevel /t reg_dword /d 32 /f


echo --------------------------
echo Entry successfully changed
echo --------------------------

pause
