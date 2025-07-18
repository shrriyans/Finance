VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmSearch 
   Caption         =   "Search Employees"
   ClientHeight    =   6030
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   9015
   LinkTopic       =   "Form1"
   ScaleHeight     =   6030
   ScaleWidth      =   9015
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Caption         =   "Search Criteria"
      Height          =   1335
      Left            =   120
      TabIndex        =   4
      Top             =   120
      Width           =   8775
      Begin VB.CommandButton cmdClearSearch 
         Caption         =   "Clear"
         Height          =   375
         Left            =   4560
         TabIndex        =   3
         Top             =   720
         Width           =   1215
      End
      Begin VB.CommandButton cmdSearch 
         Caption         =   "Search"
         Height          =   375
         Left            =   3240
         TabIndex        =   2
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtSearch 
         Height          =   285
         Left            =   1440
         TabIndex        =   1
         Top             =   360
         Width           =   4335
      End
      Begin VB.Label Label1 
         Caption         =   "Search Term:"
         Height          =   255
         Left            =   240
         TabIndex        =   5
         Top             =   360
         Width           =   1095
      End
   End
   Begin MSDataGridLib.DataGrid dgResults 
      Height          =   3855
      Left            =   120
      TabIndex        =   0
      Top             =   1560
      Width           =   8775
      _ExtentX        =   15478
      _ExtentY        =   6800
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
   Begin VB.Label lblResultCount 
      Caption         =   "Results: 0"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   5520
      Width           =   2415
   End
End
Attribute VB_Name = "frmSearch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private searchRS As ADODB.Recordset

Private Sub Form_Load()
    ' Initialize search form
    txtSearch.Text = ""
    lblResultCount.Caption = "Results: 0"
    
    ' Connect to database if not already connected
    If conn Is Nothing Then
        If Not ConnectToDatabase() Then
            MsgBox "Cannot connect to database. Search functionality will not work.", vbCritical, "Database Error"
            Exit Sub
        End If
    End If
    
    ' Load all employees initially
    Call LoadAllEmployees
End Sub

Private Sub Form_Unload(Cancel As Integer)
    ' Clean up recordset
    If Not searchRS Is Nothing Then
        If searchRS.State = adStateOpen Then searchRS.Close
        Set searchRS = Nothing
    End If
End Sub

Private Sub cmdSearch_Click()
    Dim searchTerm As String
    searchTerm = Trim(txtSearch.Text)
    
    If searchTerm = "" Then
        Call LoadAllEmployees
    Else
        Call SearchEmployees(searchTerm)
    End If
End Sub

Private Sub cmdClearSearch_Click()
    txtSearch.Text = ""
    Call LoadAllEmployees
End Sub

Private Sub txtSearch_KeyPress(KeyAscii As Integer)
    ' Allow search on Enter key
    If KeyAscii = 13 Then ' Enter key
        Call cmdSearch_Click
    End If
End Sub

Private Sub LoadAllEmployees()
    On Error GoTo ErrorHandler
    
    ' Clean up existing recordset
    If Not searchRS Is Nothing Then
        If searchRS.State = adStateOpen Then searchRS.Close
        Set searchRS = Nothing
    End If
    
    ' Get all employees
    Set searchRS = GetEmployees()
    
    If Not searchRS Is Nothing Then
        ' Bind to DataGrid
        Set dgResults.DataSource = searchRS
        
        ' Update result count
        If Not searchRS.EOF Then
            searchRS.MoveLast
            lblResultCount.Caption = "Results: " & searchRS.RecordCount
            searchRS.MoveFirst
        Else
            lblResultCount.Caption = "Results: 0"
        End If
    End If
    
    Exit Sub
    
ErrorHandler:
    MsgBox "Error loading employees: " & Err.Description, vbCritical, "Load Error"
End Sub

Private Sub SearchEmployees(searchTerm As String)
    On Error GoTo ErrorHandler
    
    ' Clean up existing recordset
    If Not searchRS Is Nothing Then
        If searchRS.State = adStateOpen Then searchRS.Close
        Set searchRS = Nothing
    End If
    
    ' Search employees
    Set searchRS = DatabaseModule.SearchEmployees(searchTerm)
    
    If Not searchRS Is Nothing Then
        ' Bind to DataGrid
        Set dgResults.DataSource = searchRS
        
        ' Update result count
        If Not searchRS.EOF Then
            searchRS.MoveLast
            lblResultCount.Caption = "Results: " & searchRS.RecordCount
            searchRS.MoveFirst
        Else
            lblResultCount.Caption = "Results: 0"
        End If
    End If
    
    Exit Sub
    
ErrorHandler:
    MsgBox "Error searching employees: " & Err.Description, vbCritical, "Search Error"
End Sub

Private Sub dgResults_DblClick()
    ' Allow double-click to select and return to main form
    If Not searchRS Is Nothing Then
        If Not searchRS.EOF And Not searchRS.BOF Then
            ' Pass selected employee data back to main form
            frmMain.lblEmployeeID.Caption = searchRS.Fields("employee_id").Value
            frmMain.txtFirstName.Text = searchRS.Fields("first_name").Value
            frmMain.txtLastName.Text = searchRS.Fields("last_name").Value
            frmMain.txtEmail.Text = searchRS.Fields("email").Value
            frmMain.txtDepartment.Text = searchRS.Fields("department").Value
            frmMain.txtSalary.Text = searchRS.Fields("salary").Value
            
            ' Close search form
            Unload Me
        End If
    End If
End Sub