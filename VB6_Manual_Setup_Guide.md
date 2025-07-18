# VB6 Manual Setup Guide - Master Data Management System

## ⚠️ Important: Create Project Manually in VB6

The text-based form files are causing "Load 0" errors. Follow these steps to create the project directly in VB6:

## Step 1: Create New VB6 Project

1. **Open Visual Basic 6.0**
2. **File → New Project**
3. **Select "Standard EXE"**
4. **Click OK**

## Step 2: Set Project Properties

1. **Project → Project1 Properties**
2. **General Tab:**
   - Project Name: `MasterDataSystem`
   - Project Description: `Master Data Management System`
   - Startup Object: `Form1` (we'll change this later)

## Step 3: Add References

1. **Project → References**
2. **Check these references:**
   - ✅ Microsoft ActiveX Data Objects 2.0 Library
   - ✅ OLE Automation
3. **Click OK**

## Step 4: Add Database Module

1. **Project → Add Module**
2. **Select "Module"**
3. **Name it: `modDatabase`**
4. **Copy and paste the code from `modDatabase.bas`**

## Step 5: Create Login Form

1. **Rename Form1 to `frmLogin`:**
   - Right-click Form1 in Project Explorer
   - Properties
   - Change (Name) to `frmLogin`
   - Change Caption to `Login`

2. **Add Controls to frmLogin:**
   - 2 TextBoxes: `txtUserName`, `txtPassword`
   - 2 Labels: `Label1` (User Name:), `Label2` (Password:)
   - 2 CommandButtons: `cmdLogin`, `cmdExit`
   - 1 Label: `lblTitle` (Master Data Management System)

3. **Add this code to frmLogin:**

```vb
Option Explicit

Private Sub Form_Load()
    If Not InitializeDatabase() Then
        MsgBox "Failed to connect to database. Please check your database configuration.", vbCritical, "Database Error"
        End
    End If
    txtUserName.Text = "admin"
    txtPassword.Text = "admin123"
End Sub

Private Sub cmdLogin_Click()
    If Trim(txtUserName.Text) = "" Then
        MsgBox "Please enter user name.", vbExclamation, "Validation Error"
        txtUserName.SetFocus
        Exit Sub
    End If
    
    If Trim(txtPassword.Text) = "" Then
        MsgBox "Please enter password.", vbExclamation, "Validation Error"
        txtPassword.SetFocus
        Exit Sub
    End If
    
    If ValidateLogin(Trim(txtUserName.Text), Trim(txtPassword.Text)) Then
        Me.Hide
        frmMain.Show
    Else
        MsgBox "Invalid user name or password.", vbExclamation, "Login Failed"
        txtPassword.Text = ""
        txtUserName.SetFocus
    End If
End Sub

Private Sub cmdExit_Click()
    CloseDatabase
    End
End Sub

Private Sub Form_Unload(Cancel As Integer)
    CloseDatabase
    End
End Sub
```

## Step 6: Create Main MDI Form

1. **Project → Add MDI Form**
2. **Name it: `frmMain`**
3. **Add Menu:**
   - Right-click on form → Menu Editor
   - Create menu structure:
     ```
     &Masters
       &State Master
       &City Master
       -
       &User Master
       &Bank Master
       -
       &Reference Master
       C&ustomer Master
     &Window
       &Cascade
       Tile &Horizontal
       Tile &Vertical
       &Arrange Icons
     &File
       &Logout
       -
       E&xit
     ```

4. **Add this code to frmMain:**

```vb
Option Explicit

Private Sub MDIForm_Load()
    Me.Caption = "Master Data Management System - Welcome"
End Sub

Private Sub mnuStateMaster_Click()
    Dim frm As frmStateMaster
    Set frm = New frmStateMaster
    frm.Show
End Sub

Private Sub mnuCityMaster_Click()
    Dim frm As frmCityMaster
    Set frm = New frmCityMaster
    frm.Show
End Sub

Private Sub mnuUserMaster_Click()
    Dim frm As frmUserMaster
    Set frm = New frmUserMaster
    frm.Show
End Sub

Private Sub mnuBankMaster_Click()
    Dim frm As frmBankMaster
    Set frm = New frmBankMaster
    frm.Show
End Sub

Private Sub mnuReferenceMaster_Click()
    Dim frm As frmReferenceMaster
    Set frm = New frmReferenceMaster
    frm.Show
End Sub

Private Sub mnuCustomerMaster_Click()
    Dim frm As frmCustomerMaster
    Set frm = New frmCustomerMaster
    frm.Show
End Sub

Private Sub mnuLogout_Click()
    Dim response As Integer
    response = MsgBox("Are you sure you want to logout?", vbYesNo + vbQuestion, "Logout")
    If response = vbYes Then
        Me.Hide
        frmLogin.Show
        frmLogin.txtUserName.Text = ""
        frmLogin.txtPassword.Text = ""
        frmLogin.txtUserName.SetFocus
    End If
End Sub

Private Sub mnuExit_Click()
    Dim response As Integer
    response = MsgBox("Are you sure you want to exit?", vbYesNo + vbQuestion, "Exit")
    If response = vbYes Then
        CloseDatabase
        End
    End If
End Sub
```

## Step 7: Create State Master Form

1. **Project → Add Form**
2. **Name it: `frmStateMaster`**
3. **Set MDIChild = True**
4. **Add Controls:**
   - Frame: "State Details"
     - TextBox: `txtStateId` (Locked = True)
     - TextBox: `txtStateName`
     - TextBox: `txtShortCode`
     - CheckBox: `chkIsActive`
     - Labels for each field
   - Frame: "State List"
     - ListBox: `lstStates`
   - CommandButtons: `cmdSave`, `cmdDelete`, `cmdExit`

5. **Add this code:**

```vb
Option Explicit

Private Sub Form_Load()
    LoadStates
    ClearForm
End Sub

Private Sub LoadStates()
    Dim strSQL As String
    Dim rsTemp As ADODB.Recordset
    
    lstStates.Clear
    strSQL = "SELECT StateId, StateName, ShortCode, IsActive FROM state_master ORDER BY StateName"
    Set rsTemp = ExecuteQuery(strSQL)
    
    If Not rsTemp Is Nothing Then
        Do While Not rsTemp.EOF
            lstStates.AddItem rsTemp("StateId") & " - " & rsTemp("StateName") & " (" & rsTemp("ShortCode") & ")"
            rsTemp.MoveNext
        Loop
        rsTemp.Close
        Set rsTemp = Nothing
    End If
End Sub

Private Sub ClearForm()
    txtStateId.Text = ""
    txtStateName.Text = ""
    txtShortCode.Text = ""
    chkIsActive.Value = 1
    txtStateName.SetFocus
End Sub

Private Sub cmdSave_Click()
    If Trim(txtStateName.Text) = "" Then
        MsgBox "Please enter state name.", vbExclamation, "Validation Error"
        txtStateName.SetFocus
        Exit Sub
    End If
    
    If Trim(txtShortCode.Text) = "" Then
        MsgBox "Please enter short code.", vbExclamation, "Validation Error"
        txtShortCode.SetFocus
        Exit Sub
    End If
    
    Dim strSQL As String
    
    If txtStateId.Text = "" Then
        strSQL = "INSERT INTO state_master (StateName, ShortCode, IsActive) VALUES ('" & _
                CleanString(txtStateName.Text) & "', '" & _
                CleanString(txtShortCode.Text) & "', " & _
                IIf(chkIsActive.Value = 1, "1", "0") & ")"
    Else
        strSQL = "UPDATE state_master SET StateName = '" & _
                CleanString(txtStateName.Text) & "', ShortCode = '" & _
                CleanString(txtShortCode.Text) & "', IsActive = " & _
                IIf(chkIsActive.Value = 1, "1", "0") & _
                " WHERE StateId = " & txtStateId.Text
    End If
    
    If ExecuteCommand(strSQL) Then
        MsgBox "State saved successfully.", vbInformation, "Success"
        LoadStates
        ClearForm
    End If
End Sub

Private Sub cmdDelete_Click()
    If txtStateId.Text = "" Then
        MsgBox "Please select a state to delete.", vbExclamation, "Validation Error"
        Exit Sub
    End If
    
    Dim response As Integer
    response = MsgBox("Are you sure you want to delete this state?", vbYesNo + vbQuestion, "Confirm Delete")
    
    If response = vbYes Then
        Dim strSQL As String
        strSQL = "DELETE FROM state_master WHERE StateId = " & txtStateId.Text
        
        If ExecuteCommand(strSQL) Then
            MsgBox "State deleted successfully.", vbInformation, "Success"
            LoadStates
            ClearForm
        End If
    End If
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub lstStates_Click()
    If lstStates.ListIndex >= 0 Then
        Dim stateId As String
        Dim parts() As String
        
        parts = Split(lstStates.Text, " - ")
        stateId = parts(0)
        
        LoadStateDetails stateId
    End If
End Sub

Private Sub LoadStateDetails(stateId As String)
    Dim strSQL As String
    Dim rsTemp As ADODB.Recordset
    
    strSQL = "SELECT * FROM state_master WHERE StateId = " & stateId
    Set rsTemp = ExecuteQuery(strSQL)
    
    If Not rsTemp Is Nothing Then
        If Not rsTemp.EOF Then
            txtStateId.Text = rsTemp("StateId")
            txtStateName.Text = rsTemp("StateName")
            txtShortCode.Text = rsTemp("ShortCode")
            chkIsActive.Value = IIf(rsTemp("IsActive"), 1, 0)
        End If
        rsTemp.Close
        Set rsTemp = Nothing
    End If
End Sub
```

## Step 8: Create Other Master Forms

Follow the same pattern for:
- **frmCityMaster** (with State dropdown)
- **frmUserMaster** (UserName, Password)
- **frmBankMaster** (BankName, IsActive)
- **frmReferenceMaster** (ReferenceName, Address, Mobile, Email, City, State)
- **frmCustomerMaster** (CustomerName, Address, Mobile, Email, City, State, Reference)

## Step 9: Set Startup Form

1. **Project → Project1 Properties**
2. **Startup Object: frmLogin**
3. **Click OK**

## Step 10: Database Setup

1. **Run the `setup_database.bat` file**
2. **Update connection settings in modDatabase.bas**
3. **Test the connection**

## Step 11: Test the Application

1. **Press F5 to run**
2. **Login with: admin/admin123**
3. **Test each master form**

## Why This Approach Works:

✅ **VB6 IDE creates proper binary data**
✅ **Controls are properly initialized**
✅ **Form properties are set correctly**
✅ **No "Load 0" errors**
✅ **Forms are recognized as forms, not modules**

## Database Files Already Created:
- ✅ `modDatabase.bas` - Database connection module
- ✅ `database_schema.sql` - Database creation script
- ✅ `setup_database.bat` - Database setup script

This manual approach will ensure that all forms are created properly in VB6 without any loading errors!