@echo off
setlocal

echo Checking Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed or not in your PATH.
    echo Please install Python 3.8 or higher.
    pause
    exit /b 1
)

echo Installing dependencies...
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo Failed to install dependencies.
    pause
    exit /b 1
)

echo Starting JULES Client...
cd client
python main.py
if %errorlevel% neq 0 (
    echo Application exited with error.
    pause
    exit /b 1
)

endlocal
