@echo off
IF EXIST sound.iwd (
	del sound.iwd
)
IF EXIST images.iwd (
	del images.iwd
)
7za.exe a -r -tzip sound.iwd sound
7za.exe a -r -tzip images.iwd images
timeout /T 1 /NOBREAK >nul 2>&1
exit