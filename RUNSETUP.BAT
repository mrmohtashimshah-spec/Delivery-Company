@echo off
TITLE AL WASEEM DELIVERY COMPANY - ERP Launcher
COLOR 0A

echo ========================================================
echo   AL WASEEM DELIVERY COMPANY W.L.L - Fleet ERP Launcher
echo ========================================================
echo.

REM Check if Node.js is installed
node -v >nul 2>&1
if %errorlevel% neq 0 (
echo [ERROR] Node.js is not installed or not in your system PATH!
echo Please install Node.js from https://nodejs.org/ and restart this script.
pause
exit /b
)

echo [1/3] Checking project directory...
if not exist "package.json" (
echo [INFO] Initializing Vite React project setup...
call npm create vite@latest . -- --template react -y
)

echo [2/3] Installing required packages (Lucide icons)...
call npm install
call npm install lucide-react

echo [3/3] Starting development server and opening browser...
echo.
echo ========================================================
echo ERP is running! Opening http://localhost:5173 in browser...
echo Press CTRL+C anytime to stop the server.
echo ========================================================
echo.

REM Start the React dev server in the background and open the browser after 3 seconds
start /b cmd /c "npm run dev"
timeout /t 3 >nul
start http://localhost:5173

pause