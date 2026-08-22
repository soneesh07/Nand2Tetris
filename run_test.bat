@echo off

if "%~1"=="" (
    echo Usage: run_test.bat Project1 chip_name
    exit /b 1
)

if "%~2"=="" (
    echo Usage: run_test.bat Project1 chip_name
    exit /b 1
)

set PROJECT=%~1
set CHIP=%~2

echo.
echo ========================================
echo Testing %PROJECT% - %CHIP%
echo ========================================
echo.

iverilog -o "%PROJECT%/sim/%CHIP%_sim" %PROJECT%/src/*.v %PROJECT%/tb/%CHIP%_tb.v

if errorlevel 1 (
    echo.
    echo [ERROR] Compilation failed.
    exit /b 1
)

echo.
echo Compilation successful.
echo Running simulation...
echo.

vvp "%PROJECT%/sim/%CHIP%_sim"

if errorlevel 1 (
    echo.
    echo [ERROR] Simulation failed.
    exit /b 1
)

echo.
echo ========================================
echo Test completed.
echo ========================================