@echo off
setlocal

set PROJECT=%1
set MODULE=%2

echo ========================================
echo Testing %PROJECT% - %MODULE%
echo ========================================
echo.
echo [%TIME%] Starting compilation...
echo.

powershell -NoProfile -Command ^
"$start=Get-Date; ^
$p=Start-Process -FilePath 'iverilog' -ArgumentList '-o simulation.vvp Project1\src\*.v Project3\src\dff.v Project3\src\bit.v Project3\src\reg.v Project3\src\ram8.v Project3\src\ram64.v Project3\src\ram512.v Project3\src\ram4k.v Project3\src\ram16k.v Project3\tb\%MODULE%_tb.v' -NoNewWindow -PassThru -Wait; ^
$e=(Get-Date)-$start; ^
Write-Host ('Compilation elapsed time: {0:00}:{1:00}:{2:00}' -f [int]$e.TotalHours,$e.Minutes,$e.Seconds); ^
exit $p.ExitCode"

if errorlevel 1 (
    echo.
    echo ========================================
    echo COMPILATION FAILED
    echo ========================================
    exit /b 1
)

echo.
echo [%TIME%] Compilation successful.
echo.
echo [%TIME%] Starting simulation...
echo.

vvp simulation.vvp

echo.
echo [%TIME%] Simulation finished.
echo.
echo ========================================
echo Test completed.
echo ========================================

del simulation.vvp 2>nul

endlocal
