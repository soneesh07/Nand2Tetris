@echo off
setlocal EnableDelayedExpansion

if "%~2"=="" (
    echo Usage: run_test.bat Project1 nand
    echo        run_test.bat Project2 halfadder
    exit /b 1
)

set PROJECT=%~1
set CHIP=%~2

echo.
echo ========================================
echo Testing %PROJECT% - %CHIP%
echo ========================================
echo.

if not exist "%PROJECT%\src" (
    echo [ERROR] Source directory not found:
    echo %PROJECT%\src
    exit /b 1
)

if not exist "%PROJECT%\tb\%CHIP%_tb.v" (
    echo [ERROR] Testbench not found:
    echo %PROJECT%\tb\%CHIP%_tb.v
    exit /b 1
)

if not exist "%PROJECT%\sim" (
    mkdir "%PROJECT%\sim"
)

echo Compiling...

set SOURCES=

rem ------------------------------------------------
rem Project 1
rem ------------------------------------------------
if /I "%PROJECT%"=="Project1" (
    for %%F in ("%PROJECT%\src\*.v") do (
        set SOURCES=!SOURCES! "%%F"
    )
)

rem ------------------------------------------------
rem Project 2
rem Include Project 1 + Project 2 source files
rem ------------------------------------------------
if /I "%PROJECT%"=="Project2" (
    for %%F in ("Project1\src\*.v") do (
        set SOURCES=!SOURCES! "%%F"
    )

    for %%F in ("Project2\src\*.v") do (
        set SOURCES=!SOURCES! "%%F"
    )
)

iverilog -o "%PROJECT%\sim\%CHIP%_sim" %SOURCES% "%PROJECT%\tb\%CHIP%_tb.v"

if errorlevel 1 (
    echo.
    echo [ERROR] Compilation failed.
    exit /b 1
)

echo.
echo Compilation successful.
echo Running simulation...
echo.

vvp "%PROJECT%\sim\%CHIP%_sim"

if errorlevel 1 (
    echo.
    echo [ERROR] Simulation failed.
    exit /b 1
)

echo.
echo ========================================
echo Test completed.
echo ========================================
echo.

endlocal