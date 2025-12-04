@echo off
setlocal

echo [PumpLaunch] Quick installer
where node >nul 2>&1
if errorlevel 1 (
  echo Node.js not found. Install Node 18+ and rerun this script.
  exit /b 1
)

echo Installing server and client dependencies...
call npm install
if errorlevel 1 (
  echo npm install failed. Check the log above.
  exit /b 1
)

echo Building client bundle...
call npm run client:build
if errorlevel 1 (
  echo Client build failed. Check the log above.
  exit /b 1
)

echo.
echo Installation complete.
echo Next: run "npm start" to serve the API and UI on port 3000.
endlocal
exit /b 0
