@echo off
echo Master Data Management System - Database Setup
echo =============================================
echo.
echo This script will help you setup the MySQL database for the VB6 application.
echo.
echo Prerequisites:
echo - MySQL Server must be installed and running
echo - MySQL command line client must be in PATH
echo.
pause

echo.
echo Setting up database...
echo.

REM Prompt for MySQL credentials
set /p MYSQL_USER=Enter MySQL username (default: root): 
if "%MYSQL_USER%"=="" set MYSQL_USER=root

set /p MYSQL_PASSWORD=Enter MySQL password: 

echo.
echo Creating database and tables...
echo.

REM Execute the SQL script
mysql -u %MYSQL_USER% -p%MYSQL_PASSWORD% < database_schema.sql

if %ERRORLEVEL% == 0 (
    echo.
    echo Database setup completed successfully!
    echo.
    echo Database: vb6_masters_db
    echo Default user credentials:
    echo   Username: admin
    echo   Password: admin123
    echo.
    echo You can now run the VB6 application.
    echo Don't forget to update the database connection parameters in modDatabase.bas
    echo.
) else (
    echo.
    echo Database setup failed!
    echo Please check your MySQL credentials and try again.
    echo.
)

pause