@echo off

cd "C:\Program Files (x86)\Playdate"
call ".\bin\pdc.exe" %0\..\HelloWorld %0\..\HelloWorld.pdx

echo Done!
pause