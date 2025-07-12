# Customer Management System - .NET 4.0

A complete Windows Forms application built with .NET Framework 4.0 and MySQL database for managing customers, cities, and references.

## Project Structure

```
CustomerManagement/
├── CustomerManagement.sln          # Visual Studio Solution file
├── CustomerManagement/
│   ├── CustomerManagement.csproj   # Project file
│   ├── App.config                  # Configuration file
│   ├── packages.config             # NuGet packages
│   ├── Program.cs                  # Main entry point
│   ├── Forms/                      # Windows Forms
│   │   ├── LoginForm.cs            # Login form
│   │   ├── MainForm.cs             # Main menu
│   │   ├── CustomerMasterForm.cs   # Customer management
│   │   ├── CityMasterForm.cs       # City management
│   │   └── ReferenceMasterForm.cs  # Reference management
│   ├── Models/                     # Data models
│   │   ├── User.cs
│   │   ├── Customer.cs
│   │   ├── City.cs
│   │   └── Reference.cs
│   ├── Data/                       # Database layer
│   │   └── DatabaseConnection.cs   # MySQL operations
│   └── Properties/                 # Assembly info & resources
├── create_database.sql             # MySQL database creation script
└── README.md                       # This file
```

## Features

### 1. Login System
- User authentication with userid and password
- Secure login validation against database
- Default users: admin/admin123, user1/user123

### 2. Customer Master
- **Fields**: CustomerId (Auto), Name (150), Address (255), CityId (4), StateId (2), MobileNo1 (10), MobileNo2 (10), EmailId (50), ReferredById (5), ReferenceName (255)
- Add, edit, and view customers
- Dropdown selection for cities and references
- Data validation with field length limits
- Grid view for browsing existing customers

### 3. City Master
- **Fields**: CityId (Auto), CityName (50), ShortCode (5), IsActive (Boolean)
- Manage cities with state associations
- Add, edit, and activate/deactivate cities
- Grid view for browsing existing cities

### 4. Reference Master
- **Fields**: Same as Customer Master
- Manage reference contacts
- Self-referencing capability
- Grid view for browsing existing references

## Database Schema

The MySQL database includes the following tables:

- **Users** - Login authentication
- **StateMaster** - State information
- **CityMaster** - City management with state reference
- **CustomerMaster** - Customer information
- **ReferenceMaster** - Reference contacts

## Prerequisites

1. **Development Environment**:
   - Visual Studio 2015 or later
   - .NET Framework 4.0
   - MySQL Server 5.7 or later

2. **Runtime Requirements**:
   - .NET Framework 4.0
   - MySQL Connector/NET 6.9.12
   - MySQL Server with CustomerManagement database

## Setup Instructions

### 1. Database Setup

1. Install MySQL Server
2. Run the database creation script:
   ```sql
   mysql -u root -p < create_database.sql
   ```

3. Update connection string in `App.config`:
   ```xml
   <connectionStrings>
     <add name="MySqlConnectionString" 
          connectionString="Server=localhost;Database=CustomerManagement;Uid=root;Pwd=your_password;" 
          providerName="MySql.Data.MySqlClient" />
   </connectionStrings>
   ```

### 2. Project Setup

1. Open `CustomerManagement.sln` in Visual Studio 2015
2. Restore NuGet packages (MySQL.Data 6.9.12)
3. Build the solution
4. Run the application

### 3. First Run

1. Use default login credentials:
   - Username: `admin`
   - Password: `admin123`

2. The application will create sample data including:
   - States (Maharashtra, Gujarat, Karnataka, Tamil Nadu)
   - Cities (Mumbai, Pune, Ahmedabad, Bangalore, Chennai)
   - Sample references

## Usage Guide

### Login
1. Enter valid username and password
2. Click "Login" to access the main menu

### Main Menu
- **Customer Master**: Manage customer information
- **City Master**: Manage cities and their details
- **Reference Master**: Manage reference contacts
- **Logout**: Return to login screen

### Form Operations
- **New**: Clear form for new entry
- **Save**: Save current data (Insert new or Update existing)
- **Grid Click**: Load selected record into form for editing
- **Close**: Return to main menu

### Data Validation
- Required field validation
- Maximum length validation
- Dropdown value validation
- Duplicate entry prevention

## Technical Details

### Architecture
- **Presentation Layer**: Windows Forms (UI)
- **Business Layer**: Model classes with validation
- **Data Layer**: DatabaseConnection class with parameterized queries
- **Database**: MySQL with proper indexing and foreign keys

### Security Features
- Parameterized SQL queries to prevent SQL injection
- Password field masking
- User session management
- Input validation and sanitization

### Database Relationships
- Cities belong to States (Foreign Key)
- Customers reference Cities and References (Foreign Keys)
- References can be self-referencing
- Proper cascade rules for data integrity

## Troubleshooting

### Common Issues

1. **Connection String Error**:
   - Verify MySQL server is running
   - Check username/password in App.config
   - Ensure database exists

2. **MySQL Connector Issues**:
   - Verify MySQL.Data NuGet package is installed
   - Check .NET Framework 4.0 compatibility

3. **Form Designer Issues**:
   - Rebuild solution
   - Clean and rebuild if forms don't load

4. **Database Access Errors**:
   - Check MySQL user privileges
   - Verify firewall settings
   - Test connection with MySQL Workbench

### Performance Tips
- Use indexed columns for searching
- Limit grid view results for large datasets
- Implement connection pooling for multiple users
- Consider stored procedures for complex operations

## Extension Ideas

1. **Reports**: Crystal Reports integration
2. **Export**: Excel/PDF export functionality
3. **Search**: Advanced search and filtering
4. **Audit**: Change tracking and history
5. **Security**: Role-based access control
6. **Backup**: Database backup/restore functionality

## Version History

- **v1.0.0**: Initial release with core functionality
  - Login system
  - Customer, City, and Reference masters
  - MySQL database integration
  - Basic CRUD operations

## Support

For issues and questions:
1. Check the troubleshooting section
2. Review database logs
3. Verify Visual Studio and .NET Framework versions
4. Check MySQL server status and logs

---

**Note**: This project is designed for Visual Studio 2015 and .NET Framework 4.0. For newer versions, consider upgrading to .NET Framework 4.8 or .NET Core/.NET 5+ for better performance and security features.