@echo off
REM Get the directory where this batch script is located
set "SCRIPT_DIR=%~dp0"

REM Define the path to pylupdate6.exe as a variable
call find_osgeo4w.bat
if not defined OSGeo4W_PATH (
    echo OSGeo4W directory not found
    exit /b 1
)

set PY_LUPDATE_PATH=%OSGeo4W_PATH%/apps/Python312/Scripts/pylupdate6.exe
set PYTHONHOME=%OSGeo4W_PATH%/apps/Python312
set PATH=%PATH%;%OSGeo4W_PATH%/bin;%OSGeo4W_PATH%/apps/Qt6/bin

REM Check if %PY_LUPDATE_PATH% exists at the specified path
if not exist %PY_LUPDATE_PATH% (
    echo Error: %PY_LUPDATE_PATH% not found
    echo Please verify pyqt is installed correctly or modify the path variable
    pause
    exit /b 1
)

REM Switch to the directory where this batch script is located
echo Changing working directory to: %SCRIPT_DIR%
cd /d "%SCRIPT_DIR%" || (
    echo Error: Failed to switch to script directory: %SCRIPT_DIR%
    pause
    exit /b 1
)

REM compile resources using pylupdate6
echo compile resources using pylupdate6...
%PYTHONHOME%/python.exe %PY_LUPDATE_PATH% ^
__init__.py ^
qgisbox_light_color_scheme.py ^
-ts i18n/QgsBoxLightColorScheme_en.ts ^
-ts i18n/QgsBoxLightColorScheme_zh.ts

REM Check the execution result and display appropriate message
if %errorlevel% equ 0 (
    echo ==============================================
    echo Resources compiled with pylupdate6 completed
    echo ==============================================
) else (
    echo =======================================================
    echo pylupdate6 execution failed, error code: %errorlevel%
    echo =======================================================
    pause
    exit /b %errorlevel%
)
    