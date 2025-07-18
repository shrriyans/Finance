# Visual Basic 6.0 Customer Management System with MySQL

## Overview
This is a complete Customer Management System built in Visual Basic 6.0 with MySQL database connectivity. The system provides comprehensive management of customers, cities, references, and states with full CRUD (Create, Read, Update, Delete) operations.

## Features
- **User Authentication**: Secure login system with multiple user accounts
- **Customer Master**: Complete customer information management with address, contact details, and references
- **City Master**: Manage cities with state associations and activation status
- **Reference Master**: Manage reference contacts with hierarchical referral system
- **State Master**: Pre-configured states with codes for address management
- **Data Validation**: Comprehensive field validation and error handling
- **Search Functionality**: Search customers and references by name, email, or mobile number
- **Modern GUI Interface**: User-friendly forms with data grids and combo boxes

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
5. Select "MySQL ODBC 8.0 ANSI Driver" (or available version)
6. Click "Finish"
7. Configure the connection:
   - **Data Source Name**: MySQL_DSN
   - **TCP/IP Server**: localhost
   - **Port**: 3306
   - **User**: root
   - **Password**: [your MySQL root password]
   - **Database**: CustomerManagement
8. Click "Test" to verify connection
9. Click "OK" to save

### 5. Open VB6 Project
1. Open Visual Basic 6.0
2. Open the project file `CustomerManagement.vbp`
3. The project will load with all forms and modules

### 6. Run the Application
1. Press F5 or click the Run button in VB6
2. The login form will appear
3. Use default credentials: **admin** / **admin123**
4. Click Login to access the main menu

## Database Schema

### Tables
- **StateMaster**: States with codes and activation status
- **CityMaster**: Cities linked to states
- **ReferenceMaster**: Reference contacts with hierarchical structure
- **CustomerMaster**: Main customer information with references
- **Users**: System users for authentication

### Key Features
- **Foreign Key Relationships**: Maintains data integrity
- **Audit Fields**: Created and updated timestamps
- **Soft Delete**: IsActive flag for safe record deactivation
- **Hierarchical References**: References can refer other references

## Usage Instructions

### Login
- Start the application
- Enter username and password
- Default users: admin/admin123, user1/user123, manager/manager123

### Main Menu
- **Customer Master**: Manage customer information
- **City Master**: Manage cities and states
- **Reference Master**: Manage reference contacts
- **Exit**: Close the application

### Customer Master
- Add new customers with complete information
- Update existing customer details
- Delete customers (soft delete - sets IsActive to false)
- Search customers by name, email, or mobile number
- Select city and state from dropdown lists
- Assign references from existing reference list

### City Master
- Add new cities with state association
- Update city information and activation status
- Delete cities (permanent deletion)
- Manage short codes for cities

### Reference Master
- Add new references with complete contact information
- Create hierarchical reference structure (references can refer other references)
- Update reference details and activation status
- Search references by name, email, or mobile number
- Soft delete references

## Troubleshooting

### Common Issues

1. **Database Connection Error**
   - Verify MySQL server is running
   - Check ODBC DSN configuration
   - Ensure correct username/password
   - Verify database exists

2. **Login Failed**
   - Check if Users table has data
   - Verify username/password combination
   - Ensure user IsActive = 1

3. **Form Loading Issues**
   - Check if all required tables exist
   - Verify foreign key relationships
   - Ensure sample data is loaded

4. **ODBC Driver Issues**
   - Install correct version (32-bit for VB6)
   - Use ANSI driver version
   - Configure system DSN (not user DSN)

### Database Maintenance
- Regular backup of CustomerManagement database
- Monitor database size and performance
- Clean up old records if needed
- Update user passwords periodically

## Technical Details

### Project Structure
- **LoginForm.frm**: User authentication
- **MainForm.frm**: Main menu navigation
- **CustomerMasterForm.frm**: Customer management
- **CityMasterForm.frm**: City management
- **ReferenceMasterForm.frm**: Reference management
- **DatabaseModule.bas**: Database connectivity and common functions
- **CustomerManagement.vbp**: Main project file

### Database Connection
- Uses ADO (ActiveX Data Objects) for database connectivity
- ODBC connection through MySQL ODBC driver
- Connection string configured in DatabaseModule.bas
- Automatic connection management with error handling

### Data Validation
- Field length validation based on database constraints
- Required field validation
- Numeric validation where applicable
- Email format validation (basic)
- Mobile number length validation

This system provides a complete foundation for customer relationship management with scalable architecture and professional user interface.