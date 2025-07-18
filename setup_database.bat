@echo off
echo ===============================================
echo Employee Management System - Database Setup
echo ===============================================
echo.

REM Check if MySQL is installed
mysql --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: MySQL is not installed or not in PATH
    echo Please install MySQL Server and add it to your PATH
    pause
    exit /b 1
)

echo MySQL detected. Setting up database...
echo.

REM Prompt for MySQL root password
set /p password="Enter MySQL root password: "

echo.
echo Creating database and tables...
mysql -u root -p%password% < database_schema.sql

if %errorlevel% equ 0 (
    echo.
    echo ===============================================
    echo Database setup completed successfully!
    echo ===============================================
    echo.
    echo Database: employee_db
    echo Table: employees
    echo Sample data has been inserted.
    echo.
    echo Next steps:
    echo 1. Configure ODBC Data Source (MySQL_DSN)
    echo 2. Open EmployeeManagement.vbp in Visual Basic 6.0
    echo 3. Run the application
    echo.
    echo See Setup_Instructions.md for detailed instructions.
) else (
    echo.
    echo ===============================================
    echo Database setup failed!
    echo ===============================================
    echo.
    echo Please check:
    echo 1. MySQL server is running
    echo 2. Root password is correct
    echo 3. database_schema.sql file exists
)

echo.
pause