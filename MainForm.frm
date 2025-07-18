VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmMain 
   Caption         =   "Employee Management System - MySQL"
   ClientHeight    =   8490
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   12030
   LinkTopic       =   "Form1"
   ScaleHeight     =   8490
   ScaleWidth      =   12030
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      Caption         =   "Employee Data"
      Height          =   3135
      Left            =   120
      TabIndex        =   14
      Top             =   120
      Width           =   11775
      Begin VB.TextBox txtSalary 
         Height          =   285
         Left            =   1440
         TabIndex        =   4
         Top             =   2280
         Width           =   2175
      End
      Begin VB.TextBox txtDepartment 
         Height          =   285
         Left            =   1440
         TabIndex        =   3
         Top             =   1800
         Width           =   2175
      End
      Begin VB.TextBox txtEmail 
         Height          =   285
         Left            =   1440
         TabIndex        =   2
         Top             =   1320
         Width           =   2175
      End
      Begin VB.TextBox txtLastName 
         Height          =   285
         Left            =   1440
         TabIndex        =   1
         Top             =   840
         Width           =   2175
      End
      Begin VB.TextBox txtFirstName 
         Height          =   285
         Left            =   1440
         TabIndex        =   0
         Top             =   360
         Width           =   2175
      End
      Begin VB.TextBox txtEmployeeID 
         Height          =   285
         Left            =   6120
         TabIndex        =   5
         Top             =   360
         Width           =   1575
      End
      Begin VB.Label Label6 
         Caption         =   "Salary:"
         Height          =   255
         Left            =   240
         TabIndex        =   21
         Top             =   2280
         Width           =   1095
      End
      Begin VB.Label Label5 
         Caption         =   "Department:"
         Height          =   255
         Left            =   240
         TabIndex        =   20
         Top             =   1800
         Width           =   1095
      End
      Begin VB.Label Label4 
         Caption         =   "Email:"
         Height          =   255
         Left            =   240
         TabIndex        =   19
         Top             =   1320
         Width           =   1095
      End
      Begin VB.Label Label3 
         Caption         =   "Last Name:"
         Height          =   255
         Left            =   240
         TabIndex        =   18
         Top             =   840
         Width           =   1095
      End
      Begin VB.Label Label2 
         Caption         =   "First Name:"
         Height          =   255
         Left            =   240
         TabIndex        =   17
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "Employee ID:"
         Height          =   255
         Left            =   4800
         TabIndex        =   16
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label lblEmployeeID 
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Height          =   285
         Left            =   6120
         TabIndex        =   15
         Top             =   360
         Width           =   1575
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Actions"
      Height          =   1215
      Left            =   120
      TabIndex        =   8
      Top             =   3360
      Width           =   11775
      Begin VB.CommandButton cmdDelete 
         Caption         =   "Delete"
         Height          =   375
         Left            =   2880
         TabIndex        =   12
         Top             =   360
         Width           =   1215
      End
      Begin VB.CommandButton cmdUpdate 
         Caption         =   "Update"
         Height          =   375
         Left            =   1560
         TabIndex        =   11
         Top             =   360
         Width           =   1215
      End
      Begin VB.CommandButton cmdAdd 
         Caption         =   "Add"
         Height          =   375
         Left            =   240
         TabIndex        =   10
         Top             =   360
         Width           =   1215
      End
      Begin VB.CommandButton cmdClear 
         Caption         =   "Clear"
         Height          =   375
         Left            =   4200
         TabIndex        =   9
         Top             =   360
         Width           =   1215
      End
      Begin VB.CommandButton cmdRefresh 
         Caption         =   "Refresh"
         Height          =   375
         Left            =   5520
         TabIndex        =   13
         Top             =   360
         Width           =   1215
      End
      Begin VB.CommandButton cmdSearch 
         Caption         =   "Search"
         Height          =   375
         Left            =   6840
         TabIndex        =   22
         Top             =   360
         Width           =   1215
      End
   End
   Begin MSDataGridLib.DataGrid DataGrid1 
      Height          =   3375
      Left            =   120
      TabIndex        =   6
      Top             =   4800
      Width           =   11775
      _ExtentX        =   20770
      _ExtentY        =   5953
      _Version        =   393216
      HeadLines       =   1
      RowHeight       =   15
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCount     =   2
      BeginProperty Column00 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column01 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      SplitCount      =   1
      BeginProperty Split0 
         BeginProperty Column00 
         EndProperty
         BeginProperty Column01 
         EndProperty
      EndProperty
   End
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   330
      Left            =   9720
      Top             =   8040
      Visible         =   0   'False
      Width           =   2175
      _ExtentX        =   3836
      _ExtentY        =   582
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   1
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   "Provider=MSDASQL.1;Persist Security Info=False;Data Source=MySQL_DSN"
      OLEDBString     =   "Provider=MSDASQL.1;Persist Security Info=False;Data Source=MySQL_DSN"
      OLEDBFile       =   ""
      DataSourceName  =   "MySQL_DSN"
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "SELECT * FROM employees"
      Caption         =   "Adodc1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin VB.Label lblStatus 
      Caption         =   "Ready"
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   8280
      Width           =   9495
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private rs As ADODB.Recordset

Private Sub Form_Load()
    ' Initialize the form
    Call InitializeDatabase
    Call LoadEmployees
    Call ClearFields
End Sub

Private Sub InitializeDatabase()
    On Error GoTo ErrorHandler
    
    ' Connect to database using module
    If ConnectToDatabase() Then
        lblStatus.Caption = "Database connected successfully"
    Else
        lblStatus.Caption = "Database connection failed"
        Exit Sub
    End If
    
    Exit Sub
    
ErrorHandler:
    MsgBox "Error connecting to database: " & Err.Description, vbCritical, "Database Error"
    lblStatus.Caption = "Database connection failed"
End Sub

Private Sub LoadEmployees()
    On Error GoTo ErrorHandler
    
    ' Get employees using database module
    Set rs = GetEmployees()
    
    If Not rs Is Nothing Then
        ' Bind to DataGrid
        Set DataGrid1.DataSource = rs
        lblStatus.Caption = "Employee data loaded"
    Else
        lblStatus.Caption = "Error loading employee data"
    End If
    
    Exit Sub
    
ErrorHandler:
    MsgBox "Error loading employees: " & Err.Description, vbCritical, "Load Error"
End Sub

Private Sub cmdAdd_Click()
    On Error GoTo ErrorHandler
    
    If ValidateFields() Then
        If AddEmployee(txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtDepartment.Text, CDbl(txtSalary.Text)) Then
            Call ClearFields
            Call LoadEmployees
            lblStatus.Caption = "Employee added successfully"
        Else
            lblStatus.Caption = "Error adding employee"
        End If
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error adding employee: " & Err.Description, vbCritical, "Add Error"
End Sub

Private Sub cmdUpdate_Click()
    On Error GoTo ErrorHandler
    
    If lblEmployeeID.Caption = "" Then
        MsgBox "Please select an employee to update", vbInformation, "Update Employee"
        Exit Sub
    End If
    
    If ValidateFields() Then
        If UpdateEmployee(CLng(lblEmployeeID.Caption), txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtDepartment.Text, CDbl(txtSalary.Text)) Then
            Call LoadEmployees
            lblStatus.Caption = "Employee updated successfully"
        Else
            lblStatus.Caption = "Error updating employee"
        End If
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error updating employee: " & Err.Description, vbCritical, "Update Error"
End Sub

Private Sub cmdDelete_Click()
    On Error GoTo ErrorHandler
    
    If lblEmployeeID.Caption = "" Then
        MsgBox "Please select an employee to delete", vbInformation, "Delete Employee"
        Exit Sub
    End If
    
    If MsgBox("Are you sure you want to delete this employee?", vbYesNo + vbQuestion, "Confirm Delete") = vbYes Then
        If DeleteEmployee(CLng(lblEmployeeID.Caption)) Then
            Call ClearFields
            Call LoadEmployees
            lblStatus.Caption = "Employee deleted successfully"
        Else
            lblStatus.Caption = "Error deleting employee"
        End If
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error deleting employee: " & Err.Description, vbCritical, "Delete Error"
End Sub

Private Sub cmdClear_Click()
    Call ClearFields
    lblStatus.Caption = "Fields cleared"
End Sub

Private Sub cmdRefresh_Click()
    Call LoadEmployees
End Sub

Private Sub cmdSearch_Click()
    ' Show search form
    frmSearch.Show vbModal
End Sub

Private Sub ClearFields()
    txtFirstName.Text = ""
    txtLastName.Text = ""
    txtEmail.Text = ""
    txtDepartment.Text = ""
    txtSalary.Text = ""
    lblEmployeeID.Caption = ""
End Sub

Private Function ValidateFields() As Boolean
    ValidateFields = False
    
    If Trim(txtFirstName.Text) = "" Then
        MsgBox "Please enter first name", vbInformation, "Validation Error"
        txtFirstName.SetFocus
        Exit Function
    End If
    
    If Trim(txtLastName.Text) = "" Then
        MsgBox "Please enter last name", vbInformation, "Validation Error"
        txtLastName.SetFocus
        Exit Function
    End If
    
    If Trim(txtEmail.Text) = "" Then
        MsgBox "Please enter email", vbInformation, "Validation Error"
        txtEmail.SetFocus
        Exit Function
    End If
    
    If Trim(txtDepartment.Text) = "" Then
        MsgBox "Please enter department", vbInformation, "Validation Error"
        txtDepartment.SetFocus
        Exit Function
    End If
    
    If Trim(txtSalary.Text) = "" Then
        MsgBox "Please enter salary", vbInformation, "Validation Error"
        txtSalary.SetFocus
        Exit Function
    End If
    
    If Not IsNumeric(txtSalary.Text) Then
        MsgBox "Please enter a valid salary amount", vbInformation, "Validation Error"
        txtSalary.SetFocus
        Exit Function
    End If
    
    ValidateFields = True
End Function

Private Sub DataGrid1_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
    On Error GoTo ErrorHandler
    
    If Not rs Is Nothing Then
        If Not rs.EOF And Not rs.BOF Then
            lblEmployeeID.Caption = rs.Fields("employee_id").Value
            txtFirstName.Text = rs.Fields("first_name").Value
            txtLastName.Text = rs.Fields("last_name").Value
            txtEmail.Text = rs.Fields("email").Value
            txtDepartment.Text = rs.Fields("department").Value
            txtSalary.Text = rs.Fields("salary").Value
        End If
    End If
    Exit Sub
    
ErrorHandler:
    ' Handle any errors silently for row changes
End Sub