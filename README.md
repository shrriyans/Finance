# Master Data Management System - Visual Basic 6.0

A comprehensive Master Data Management System built with Visual Basic 6.0 and MySQL database. This application provides a complete solution for managing various master data entities with proper relationships and CRUD operations.

## Features

### Forms Included:
1. **Login Form** - User authentication with MySQL database
2. **State Master Form** - Manage states with auto-increment ID, name, short code, and active status
3. **City Master Form** - Manage cities with state relationship
4. **User Master Form** - Manage user accounts with duplicate username validation
5. **Bank Master Form** - Manage bank information
6. **Reference Master Form** - Manage reference contacts with city/state relationships
7. **Customer Master Form** - Manage customers with reference, city, and state relationships

### Key Features:
- **MDI Interface** - Multiple Document Interface for better user experience
- **Database Connectivity** - MySQL database connection using ODBC
- **Data Validation** - Input validation and error handling
- **Relationship Management** - Proper foreign key relationships between entities
- **CRUD Operations** - Complete Create, Read, Update, Delete functionality
- **User-Friendly Interface** - Intuitive forms with proper navigation
- **Security** - SQL injection prevention and user authentication

## Database Schema

### Tables:
1. **state_master** - StateId (Auto), StateName (25), ShortCode (5), IsActive (Boolean)
2. **city_master** - CityId (Auto), CityName (50), ShortCode (5), IsActive (Boolean), StateId (FK)
3. **user_master** - Id (Auto), UserName (25), Password (15)
4. **bank_master** - BankId (Auto), BankName (50), IsActive (Boolean)
5. **reference_master** - ReferenceId (Auto), ReferenceName (50), Address (Text), MobileNo (15), EmailId (50), CityId (FK), StateId (FK), IsActive (Boolean)
6. **customer_master** - CustomerId (Auto), CustomerName (50), Address (Text), MobileNo (15), EmailId (50), CityId (FK), StateId (FK), ReferenceId (FK), IsActive (Boolean)

## Prerequisites

### Software Requirements:
1. **Visual Basic 6.0** - Microsoft Visual Basic 6.0 IDE
2. **MySQL Server** - MySQL 5.7 or higher
3. **MySQL ODBC Driver** - MySQL ODBC 8.0 Unicode Driver
4. **Windows OS** - Windows 7 or higher (for VB6 compatibility)

### Hardware Requirements:
- **RAM**: Minimum 512 MB (1 GB recommended)
- **Storage**: 100 MB free space
- **Processor**: Intel Pentium III or equivalent

## Installation Steps

### 1. Database Setup
1. Install MySQL Server on your system
2. Create a new database using the provided SQL script:
   ```sql
   mysql -u root -p < database_schema.sql
   ```
3. Ensure MySQL service is running
4. Note down your MySQL username and password

### 2. ODBC Driver Setup
1. Download and install MySQL ODBC 8.0 Unicode Driver
2. Configure ODBC Data Source:
   - Open ODBC Data Source Administrator
   - Add new System DSN
   - Select MySQL ODBC 8.0 Unicode Driver
   - Configure connection parameters

### 3. VB6 Project Setup
1. Open Visual Basic 6.0
2. Open the project file `MasterDataSystem.vbp`
3. Update database connection parameters in `modDatabase.bas`:
   ```vb
   Public Const DB_SERVER = "localhost"
   Public Const DB_NAME = "vb6_masters_db"
   Public Const DB_USER = "root"
   Public Const DB_PASSWORD = "your_password"
   ```
4. Ensure ADO references are properly set:
   - Project → References
   - Check "Microsoft ActiveX Data Objects 2.0 Library"

### 4. Running the Application
1. Press F5 to run the project in VB6 IDE
2. Or compile to executable (File → Make MasterDataSystem.exe)
3. Default login credentials:
   - Username: `admin`
   - Password: `admin123`

## Usage Instructions

### Login
1. Start the application
2. Enter username and password
3. Click Login or press Enter

### Navigation
- Use the menu system to access different master forms
- **Masters Menu**: Access all master data forms
- **Window Menu**: Manage MDI child windows (Cascade, Tile, etc.)
- **File Menu**: Logout or Exit

### Data Entry
1. **Adding New Records**:
   - Open the desired master form
   - Fill in the required fields
   - Click Save button
   - Record will be added to the database

2. **Editing Records**:
   - Select a record from the list
   - Modify the fields
   - Click Save to update

3. **Deleting Records**:
   - Select a record from the list
   - Click Delete button
   - Confirm deletion

### Form-Specific Features

#### State Master
- Auto-increment State ID
- State name and short code validation
- Active/Inactive status

#### City Master
- Linked to State Master
- Auto-populate cities based on selected state
- City name and short code validation

#### User Master
- Duplicate username validation
- Password field with masking
- Admin user protection (cannot be deleted)

#### Reference Master
- Complete contact information
- City and state selection with cascading dropdowns
- Email and mobile number validation

#### Customer Master
- Complete customer information
- Reference selection from existing references
- City and state selection
- Mobile number format validation

## Database Connection Configuration

### Connection String Format:
```vb
"DRIVER={MySQL ODBC 8.0 Unicode Driver};" & _
"SERVER=localhost;" & _
"DATABASE=vb6_masters_db;" & _
"UID=root;" & _
"PWD=password;" & _
"OPTION=3;"
```

### Troubleshooting Connection Issues:
1. Verify MySQL service is running
2. Check ODBC driver installation
3. Validate connection parameters
4. Ensure database exists and user has proper permissions
5. Check firewall settings

## File Structure

```
MasterDataSystem/
├── database_schema.sql          # Database creation script
├── modDatabase.bas              # Database connection module
├── frmLogin.frm                 # Login form
├── frmMain.frm                  # Main MDI form
├── frmStateMaster.frm           # State master form
├── frmCityMaster.frm            # City master form
├── frmUserMaster.frm            # User master form
├── frmBankMaster.frm            # Bank master form
├── frmReferenceMaster.frm       # Reference master form
├── frmCustomerMaster.frm        # Customer master form
├── MasterDataSystem.vbp         # VB6 project file
└── README.md                    # This file
```

## Security Features

1. **SQL Injection Prevention**: All user inputs are sanitized using the `CleanString` function
2. **User Authentication**: Login validation against database
3. **Data Validation**: Input validation on all forms
4. **Error Handling**: Comprehensive error handling throughout the application

## Customization

### Adding New Fields:
1. Update database schema
2. Modify corresponding form layout
3. Update save/load procedures
4. Add validation if required

### Changing Database:
1. Update connection string in `modDatabase.bas`
2. Modify SQL queries if syntax differs
3. Test all CRUD operations

### UI Customization:
1. Modify form layouts in VB6 designer
2. Update colors, fonts, and styles
3. Add new menu items in main form

## Support and Maintenance

### Common Issues:
1. **Database Connection Failed**: Check MySQL service and ODBC configuration
2. **Form Load Errors**: Verify all form files are present
3. **Compilation Errors**: Check VB6 references and dependencies

### Maintenance Tasks:
1. Regular database backups
2. User account management
3. Data cleanup and archiving
4. Performance monitoring

## Version History

- **Version 1.0**: Initial release with all master forms and basic functionality
- Features include complete CRUD operations, user authentication, and relationship management

## License

This project is provided as-is for educational and development purposes. Modify and use according to your requirements.

## Contact

For support or questions regarding this application, please refer to the documentation or contact your system administrator.