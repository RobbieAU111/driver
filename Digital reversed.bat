@echo off
title Digital Cleaner Script
echo [!] Requesting Administrative Privileges...
:: Check for permissions
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [OK] Running as Admin.
) else (
    echo [!] ERROR: Please run this script as Administrator.
    pause
    exit /B
)

echo.
echo [+] Cleaning Registry Keys...
:: Based on your A8C90 and A8CE8 strings
reg delete "HKCU\Software\Epic Games" /f >nul 2>&1
reg delete "HKCU\Software\EasyAntiCheat" /f >nul 2>&1
reg delete "HKLM\SYSTEM\MountedDevices" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f >nul 2>&1

echo [+] Clearing AppData & Cache...
:: Epic Games Launcher Cache
rmdir /s /q "%LOCALAPPDATA%\EpicGamesLauncher\Saved\webcache_4430" >nul 2>&1
rmdir /s /q "%LOCALAPPDATA%\EpicGamesLauncher\Saved\Data" >nul 2>&1
rmdir /s /q "%LOCALAPPDATA%\EpicGamesLauncher\Intermediate" >nul 2>&1

:: Fortnite Game Logs and Bundles
rmdir /s /q "%LOCALAPPDATA%\FortniteGame\Saved\PersistentDownloadDir\InstalledBundles" >nul 2>&1
rmdir /s /q "%LOCALAPPDATA%\FortniteGame\Saved\Logs\NGX" >nul 2>&1

:: Unreal Engine & EAC
rmdir /s /q "%LOCALAPPDATA%\UnrealEngine\5.8\Saved\Config" >nul 2>&1
rmdir /s /q "%APPDATA%\EasyAntiCheat" >nul 2>&1

:: System Temp & ProgramData
rmdir /s /q "%PROGRAMDATA%\Epic\EpicOnlineServices" >nul 2>&1
del /s /q "%TEMP%\*.*" >nul 2>&1

echo.
echo [+] Cleanup Complete!
echo [!] Note: Some HWID strings (UUID, VolumeSerialNumber) require a spoofer, not just a cleaner.
pause