# Visual Basic 6.0 Employee Management System with MySQL

## Overview
This is a complete Employee Management System built in Visual Basic 6.0 with MySQL database connectivity. The system provides full CRUD (Create, Read, Update, Delete) operations for employee records.

## Features
- Add new employees
- Update existing employee information
- Delete employees
- Search employees by name, email, or department
- View all employees in a data grid
- Data validation
- Error handling
- Modern GUI interface

## System Requirements

### Software Requirements
1. **Visual Basic 6.0** - Development environment
2. **MySQL Server** - Database server (5.7 or higher recommended)
3. **MySQL ODBC Driver** - For database connectivity
4. **Microsoft Data Access Components (MDAC)** - For ADO support

### Hardware Requirements
- Windows 95/98/ME/NT/2000/XP or higher
- 32 MB RAM minimum (64 MB recommended)
- 50 MB free disk space
- VGA or higher resolution monitor

## Installation Instructions

### 1. Install MySQL Server
1. Download and install MySQL Server from https://dev.mysql.com/downloads/mysql/
2. During installation, set the root password (remember this password)
3. Start MySQL Server service

### 2. Install MySQL ODBC Driver
1. Download MySQL Connector/ODBC from https://dev.mysql.com/downloads/connector/odbc/
2. Install the appropriate version (32-bit for VB6)
3. This creates the ODBC drivers needed for database connectivity

### 3. Create Database
1. Open MySQL Command Line Client or MySQL Workbench
2. Run the SQL script from `database_schema.sql` to create the database and sample data
3. Verify the database was created by running: `SHOW DATABASES;`

### 4. Configure ODBC Data Source
1. Open Windows Control Panel
2. Go to Administrative Tools → Data Sources (ODBC)
3. Click on "System DSN" tab
4. Click "Add" button
5. Select "MySQL ODBC Driver" and click "Finish"
6. Configure the data source:
   - **Data Source Name**: MySQL_DSN
   - **Server**: localhost
   - **User**: root
   - **Password**: [your MySQL root password]
   - **Database**: employee_db
7. Click "Test" to verify connection
8. Click "OK" to save

### 5. Open Visual Basic 6.0 Project
1. Open Visual Basic 6.0
2. Open the project file: `EmployeeManagement.vbp`
3. If prompted about missing references, add them:
   - Microsoft ActiveX Data Objects 2.0 Library
   - Microsoft ADO Data Control 6.0 (OLEDB)
   - Microsoft DataGrid Control 6.0 (OLEDB)

### 6. Compile and Run
1. Press F5 to run the application in debug mode
2. Or go to File → Make EmployeeManagement.exe to create executable

## Project Structure

```
EmployeeManagement/
├── EmployeeManagement.vbp      # VB6 Project file
├── MainForm.frm                # Main application form
├── SearchForm.frm              # Employee search form
├── DatabaseModule.bas          # Database connection module
├── database_schema.sql         # MySQL database schema
└── Setup_Instructions.md       # This file
```

## Database Schema

### employees Table
- `employee_id` (INT, AUTO_INCREMENT, PRIMARY KEY)
- `first_name` (VARCHAR(50), NOT NULL)
- `last_name` (VARCHAR(50), NOT NULL)
- `email` (VARCHAR(100), UNIQUE, NOT NULL)
- `department` (VARCHAR(50), NOT NULL)
- `salary` (DECIMAL(10,2), NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `updated_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)

## Usage Instructions

### Adding Employees
1. Fill in all required fields (First Name, Last Name, Email, Department, Salary)
2. Click "Add" button
3. The new employee will be added to the database and displayed in the grid

### Updating Employees
1. Select an employee from the data grid
2. Modify the information in the text fields
3. Click "Update" button
4. The changes will be saved to the database

### Deleting Employees
1. Select an employee from the data grid
2. Click "Delete" button
3. Confirm the deletion in the dialog box
4. The employee will be removed from the database

### Searching Employees
1. Click "Search" button to open the search form
2. Enter search terms (searches name, email, and department)
3. Click "Search" or press Enter
4. Double-click on a result to select and return to main form

### Other Functions
- **Clear**: Clears all input fields
- **Refresh**: Reloads data from database

## Troubleshooting

### Connection Issues
- Verify MySQL server is running
- Check ODBC Data Source configuration
- Ensure MySQL ODBC driver is properly installed
- Verify database name and credentials

### Missing References
- In VB6, go to Project → References
- Check required references:
  - Microsoft ActiveX Data Objects 2.0 Library
  - Microsoft ADO Data Control 6.0 (OLEDB)
  - Microsoft DataGrid Control 6.0 (OLEDB)

### Runtime Errors
- Ensure all required DLLs are present on target machine
- Install Visual Basic 6.0 Runtime files
- Register required ActiveX controls

## Security Notes
- This example uses basic authentication
- In production, implement proper password hashing
- Use parameterized queries to prevent SQL injection
- Implement user access controls

## Customization
- Modify `DatabaseModule.bas` to change connection parameters
- Add new fields by updating both the database schema and forms
- Extend search functionality in `SearchForm.frm`
- Add data validation rules in the ValidateFields function

## Support
For issues or questions, refer to:
- Visual Basic 6.0 documentation
- MySQL documentation
- ODBC driver documentation