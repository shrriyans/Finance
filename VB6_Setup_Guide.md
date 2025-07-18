# VB6 Setup Guide - Master Data Management System

## Quick Setup Steps

### 1. **Database Setup**
1. Install MySQL Server
2. Run the `setup_database.bat` file or execute `database_schema.sql` manually
3. Default database: `vb6_masters_db`
4. Default login: admin/admin123

### 2. **VB6 Project Setup**
1. Open Visual Basic 6.0
2. Open the project file: `MasterDataSystem.vbp`
3. **Important**: Check References (Project → References)
   - ✅ Microsoft ActiveX Data Objects 2.0 Library
   - ✅ OLE Automation

### 3. **Database Connection**
1. Open `modDatabase.bas`
2. Update these constants:
   ```vb
   Public Const DB_SERVER = "localhost"
   Public Const DB_NAME = "vb6_masters_db"
   Public Const DB_USER = "root"
   Public Const DB_PASSWORD = "your_mysql_password"
   ```

### 4. **ODBC Driver**
1. Download MySQL ODBC 8.0 Unicode Driver
2. Install the driver
3. The connection string will automatically use the driver

### 5. **Run the Application**
1. Press **F5** in VB6 to run
2. Login with: `admin` / `admin123`
3. Use the menu to access different master forms

## Forms Available:
- **Login** - User authentication
- **State Master** - Manage states
- **City Master** - Manage cities (linked to states)
- **User Master** - Manage users
- **Bank Master** - Manage banks
- **Reference Master** - Manage references
- **Customer Master** - Manage customers

## Troubleshooting:

### "Load 0" Error:
- Make sure all .frm files are in the same directory as the .vbp file
- Check that form names match exactly in the project file
- Verify all references are properly set

### Database Connection Issues:
- Ensure MySQL service is running
- Check username/password in modDatabase.bas
- Install MySQL ODBC driver
- Verify database exists

### Form Not Loading:
- Check if the form file exists
- Verify the form name in the .vbp file matches the actual form name
- Make sure all controls are properly defined

## File Structure:
```
MasterDataSystem/
├── MasterDataSystem.vbp     # Main project file
├── modDatabase.bas          # Database module
├── Login.frm               # Login form
├── MainForm.frm            # Main MDI form
├── StateMaster.frm         # State master form
├── CityMaster.frm          # City master form
├── UserMaster.frm          # User master form
├── BankMaster.frm          # Bank master form
├── ReferenceMaster.frm     # Reference master form
├── CustomerMaster.frm      # Customer master form
├── database_schema.sql     # Database creation script
└── setup_database.bat      # Database setup script
```

## Notes:
- All forms are MDI child forms except Login
- Database uses MySQL with ODBC connection
- Auto-increment IDs are handled by the database
- Input validation is implemented on all forms
- Forms will load data automatically when opened

## Default Login:
- **Username**: admin
- **Password**: admin123

The application should now load properly in VB6 without the "Load 0" error!