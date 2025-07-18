VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmCustomerMaster 
   Caption         =   "Customer Master"
   ClientHeight    =   9000
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   12000
   LinkTopic       =   "Form1"
   ScaleHeight     =   9000
   ScaleWidth      =   12000
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame2 
      Caption         =   "Customer List"
      Height          =   3975
      Left            =   120
      TabIndex        =   19
      Top             =   4800
      Width           =   11775
      Begin MSDataGridLib.DataGrid dgCustomers 
         Height          =   3495
         Left            =   120
         TabIndex        =   20
         Top             =   360
         Width           =   11535
         _ExtentX        =   20346
         _ExtentY        =   6165
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
   End
   Begin VB.Frame Frame1 
      Caption         =   "Customer Information"
      Height          =   4575
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   11775
      Begin VB.ComboBox cboReference 
         Height          =   315
         Left            =   8760
         TabIndex        =   9
         Top             =   3240
         Width           =   2775
      End
      Begin VB.ComboBox cboCity 
         Height          =   315
         Left            =   1560
         TabIndex        =   5
         Top             =   2280
         Width           =   2775
      End
      Begin VB.ComboBox cboState 
         Height          =   315
         Left            =   8760
         TabIndex        =   6
         Top             =   2280
         Width           =   2775
      End
      Begin VB.TextBox txtMobileNo2 
         Height          =   285
         Left            =   8760
         MaxLength       =   10
         TabIndex        =   8
         Top             =   2760
         Width           =   2775
      End
      Begin VB.TextBox txtMobileNo1 
         Height          =   285
         Left            =   1560
         MaxLength       =   10
         TabIndex        =   7
         Top             =   2760
         Width           =   2775
      End
      Begin VB.TextBox txtEmail 
         Height          =   285
         Left            =   1560
         MaxLength       =   50
         TabIndex        =   4
         Top             =   3240
         Width           =   2775
      End
      Begin VB.TextBox txtAddress 
         Height          =   525
         Left            =   1560
         MaxLength       =   255
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   3
         Top             =   1560
         Width           =   9975
      End
      Begin VB.TextBox txtName 
         Height          =   285
         Left            =   1560
         MaxLength       =   150
         TabIndex        =   2
         Top             =   1080
         Width           =   2775
      End
      Begin VB.TextBox txtCustomerID 
         BackColor       =   &H8000000F&
         Height          =   285
         Left            =   1560
         Locked          =   -1  'True
         TabIndex        =   1
         Top             =   600
         Width           =   1575
      End
      Begin VB.Label Label9 
         Caption         =   "Reference:"
         Height          =   255
         Left            =   7680
         TabIndex        =   27
         Top             =   3240
         Width           =   975
      End
      Begin VB.Label Label8 
         Caption         =   "Mobile No 2:"
         Height          =   255
         Left            =   7680
         TabIndex        =   26
         Top             =   2760
         Width           =   975
      End
      Begin VB.Label Label7 
         Caption         =   "Mobile No 1:"
         Height          =   255
         Left            =   240
         TabIndex        =   25
         Top             =   2760
         Width           =   975
      End
      Begin VB.Label Label6 
         Caption         =   "Email:"
         Height          =   255
         Left            =   240
         TabIndex        =   24
         Top             =   3240
         Width           =   975
      End
      Begin VB.Label Label5 
         Caption         =   "State:"
         Height          =   255
         Left            =   7680
         TabIndex        =   23
         Top             =   2280
         Width           =   975
      End
      Begin VB.Label Label4 
         Caption         =   "City:"
         Height          =   255
         Left            =   240
         TabIndex        =   22
         Top             =   2280
         Width           =   975
      End
      Begin VB.Label Label3 
         Caption         =   "Address:"
         Height          =   255
         Left            =   240
         TabIndex        =   21
         Top             =   1560
         Width           =   975
      End
      Begin VB.Label Label2 
         Caption         =   "Name:"
         Height          =   255
         Left            =   240
         TabIndex        =   11
         Top             =   1080
         Width           =   975
      End
      Begin VB.Label Label1 
         Caption         =   "Customer ID:"
         Height          =   255
         Left            =   240
         TabIndex        =   10
         Top             =   600
         Width           =   975
      End
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "&Close"
      Height          =   375
      Left            =   10680
      TabIndex        =   18
      Top             =   4320
      Width           =   1215
   End
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "&Refresh"
      Height          =   375
      Left            =   9360
      TabIndex        =   17
      Top             =   4320
      Width           =   1215
   End
   Begin VB.CommandButton cmdSearch 
      Caption         =   "&Search"
      Height          =   375
      Left            =   8040
      TabIndex        =   16
      Top             =   4320
      Width           =   1215
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "&Delete"
      Height          =   375
      Left            =   6720
      TabIndex        =   15
      Top             =   4320
      Width           =   1215
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "&Update"
      Height          =   375
      Left            =   5400
      TabIndex        =   14
      Top             =   4320
      Width           =   1215
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "&Add"
      Height          =   375
      Left            =   4080
      TabIndex        =   13
      Top             =   4320
      Width           =   1215
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "C&lear"
      Height          =   375
      Left            =   2760
      TabIndex        =   12
      Top             =   4320
      Width           =   1215
   End
End
Attribute VB_Name = "frmCustomerMaster"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private rsCustomers As ADODB.Recordset

Private Sub Form_Load()
    LoadCities
    LoadStates
    LoadReferences
    LoadCustomers
    ClearFields
End Sub

Private Sub LoadCities()
    On Error GoTo ErrorHandler
    
    Dim rsCities As ADODB.Recordset
    Set rsCities = GetCities()
    
    cboCity.Clear
    If Not rsCities Is Nothing Then
        Do While Not rsCities.EOF
            cboCity.AddItem rsCities.Fields("CityName").Value
            cboCity.ItemData(cboCity.NewIndex) = rsCities.Fields("CityId").Value
            rsCities.MoveNext
        Loop
        rsCities.Close
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error loading cities: " & Err.Description, vbCritical, "Load Error"
End Sub

Private Sub LoadStates()
    On Error GoTo ErrorHandler
    
    Dim rsStates As ADODB.Recordset
    Set rsStates = GetStates()
    
    cboState.Clear
    If Not rsStates Is Nothing Then
        Do While Not rsStates.EOF
            cboState.AddItem rsStates.Fields("StateName").Value
            cboState.ItemData(cboState.NewIndex) = rsStates.Fields("StateId").Value
            rsStates.MoveNext
        Loop
        rsStates.Close
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error loading states: " & Err.Description, vbCritical, "Load Error"
End Sub

Private Sub LoadReferences()
    On Error GoTo ErrorHandler
    
    Dim rsReferences As ADODB.Recordset
    Set rsReferences = GetReferences()
    
    cboReference.Clear
    cboReference.AddItem "(None)"
    cboReference.ItemData(cboReference.NewIndex) = 0
    
    If Not rsReferences Is Nothing Then
        Do While Not rsReferences.EOF
            cboReference.AddItem rsReferences.Fields("Name").Value
            cboReference.ItemData(cboReference.NewIndex) = rsReferences.Fields("ReferenceId").Value
            rsReferences.MoveNext
        Loop
        rsReferences.Close
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error loading references: " & Err.Description, vbCritical, "Load Error"
End Sub

Private Sub LoadCustomers()
    On Error GoTo ErrorHandler
    
    Dim sql As String
    sql = "SELECT c.CustomerId, c.Name, c.Address, ct.CityName, s.StateName, " & _
          "c.MobileNo1, c.MobileNo2, c.EmailId, r.Name as ReferenceName " & _
          "FROM CustomerMaster c " & _
          "LEFT JOIN CityMaster ct ON c.CityId = ct.CityId " & _
          "LEFT JOIN StateMaster s ON c.StateId = s.StateId " & _
          "LEFT JOIN ReferenceMaster r ON c.ReferredById = r.ReferenceId " & _
          "WHERE c.IsActive = 1 ORDER BY c.Name"
    
    Set rsCustomers = New ADODB.Recordset
    rsCustomers.Open sql, conn, adOpenStatic, adLockReadOnly
    
    Set dgCustomers.DataSource = rsCustomers
    Exit Sub
    
ErrorHandler:
    MsgBox "Error loading customers: " & Err.Description, vbCritical, "Load Error"
End Sub

Private Sub ClearFields()
    txtCustomerID.Text = ""
    txtName.Text = ""
    txtAddress.Text = ""
    cboCity.ListIndex = -1
    cboState.ListIndex = -1
    txtMobileNo1.Text = ""
    txtMobileNo2.Text = ""
    txtEmail.Text = ""
    cboReference.ListIndex = 0
End Sub

Private Function ValidateFields() As Boolean
    ValidateFields = False
    
    If Trim(txtName.Text) = "" Then
        MsgBox "Please enter customer name", vbInformation, "Validation Error"
        txtName.SetFocus
        Exit Function
    End If
    
    If cboCity.ListIndex = -1 Then
        MsgBox "Please select a city", vbInformation, "Validation Error"
        cboCity.SetFocus
        Exit Function
    End If
    
    If cboState.ListIndex = -1 Then
        MsgBox "Please select a state", vbInformation, "Validation Error"
        cboState.SetFocus
        Exit Function
    End If
    
    ValidateFields = True
End Function

Private Sub cmdAdd_Click()
    On Error GoTo ErrorHandler
    
    If ValidateFields() Then
        Dim sql As String
        sql = "INSERT INTO CustomerMaster (Name, Address, CityId, StateId, MobileNo1, MobileNo2, EmailId, ReferredById) VALUES ('" & _
              txtName.Text & "', '" & txtAddress.Text & "', " & cboCity.ItemData(cboCity.ListIndex) & ", " & _
              cboState.ItemData(cboState.ListIndex) & ", '" & txtMobileNo1.Text & "', '" & txtMobileNo2.Text & "', '" & _
              txtEmail.Text & "', " & IIf(cboReference.ListIndex > 0, cboReference.ItemData(cboReference.ListIndex), "NULL") & ")"
        
        conn.Execute sql
        
        ClearFields
        LoadCustomers
        MsgBox "Customer added successfully", vbInformation, "Success"
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error adding customer: " & Err.Description, vbCritical, "Add Error"
End Sub

Private Sub cmdUpdate_Click()
    On Error GoTo ErrorHandler
    
    If txtCustomerID.Text = "" Then
        MsgBox "Please select a customer to update", vbInformation, "Update Customer"
        Exit Sub
    End If
    
    If ValidateFields() Then
        Dim sql As String
        sql = "UPDATE CustomerMaster SET Name='" & txtName.Text & "', Address='" & txtAddress.Text & _
              "', CityId=" & cboCity.ItemData(cboCity.ListIndex) & ", StateId=" & cboState.ItemData(cboState.ListIndex) & _
              ", MobileNo1='" & txtMobileNo1.Text & "', MobileNo2='" & txtMobileNo2.Text & "', EmailId='" & txtEmail.Text & _
              "', ReferredById=" & IIf(cboReference.ListIndex > 0, cboReference.ItemData(cboReference.ListIndex), "NULL") & _
              " WHERE CustomerId=" & txtCustomerID.Text
        
        conn.Execute sql
        
        LoadCustomers
        MsgBox "Customer updated successfully", vbInformation, "Success"
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error updating customer: " & Err.Description, vbCritical, "Update Error"
End Sub

Private Sub cmdDelete_Click()
    On Error GoTo ErrorHandler
    
    If txtCustomerID.Text = "" Then
        MsgBox "Please select a customer to delete", vbInformation, "Delete Customer"
        Exit Sub
    End If
    
    If MsgBox("Are you sure you want to delete this customer?", vbYesNo + vbQuestion, "Confirm Delete") = vbYes Then
        Dim sql As String
        sql = "UPDATE CustomerMaster SET IsActive=0 WHERE CustomerId=" & txtCustomerID.Text
        
        conn.Execute sql
        
        ClearFields
        LoadCustomers
        MsgBox "Customer deleted successfully", vbInformation, "Success"
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error deleting customer: " & Err.Description, vbCritical, "Delete Error"
End Sub

Private Sub cmdClear_Click()
    ClearFields
End Sub

Private Sub cmdRefresh_Click()
    LoadCustomers
End Sub

Private Sub cmdSearch_Click()
    ' Implement search functionality
    Dim searchTerm As String
    searchTerm = InputBox("Enter search term (Name, Email, or Mobile):", "Search Customer")
    
    If Trim(searchTerm) <> "" Then
        On Error GoTo ErrorHandler
        
        Dim sql As String
        sql = "SELECT c.CustomerId, c.Name, c.Address, ct.CityName, s.StateName, " & _
              "c.MobileNo1, c.MobileNo2, c.EmailId, r.Name as ReferenceName " & _
              "FROM CustomerMaster c " & _
              "LEFT JOIN CityMaster ct ON c.CityId = ct.CityId " & _
              "LEFT JOIN StateMaster s ON c.StateId = s.StateId " & _
              "LEFT JOIN ReferenceMaster r ON c.ReferredById = r.ReferenceId " & _
              "WHERE c.IsActive = 1 AND (c.Name LIKE '%" & searchTerm & "%' OR c.EmailId LIKE '%" & searchTerm & "%' OR c.MobileNo1 LIKE '%" & searchTerm & "%') " & _
              "ORDER BY c.Name"
        
        If Not rsCustomers Is Nothing Then rsCustomers.Close
        Set rsCustomers = New ADODB.Recordset
        rsCustomers.Open sql, conn, adOpenStatic, adLockReadOnly
        
        Set dgCustomers.DataSource = rsCustomers
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error searching customers: " & Err.Description, vbCritical, "Search Error"
End Sub

Private Sub cmdClose_Click()
    Unload Me
End Sub

Private Sub dgCustomers_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
    On Error GoTo ErrorHandler
    
    If Not rsCustomers Is Nothing Then
        If Not rsCustomers.EOF And Not rsCustomers.BOF Then
            txtCustomerID.Text = rsCustomers.Fields("CustomerId").Value
            txtName.Text = rsCustomers.Fields("Name").Value
            txtAddress.Text = IIf(IsNull(rsCustomers.Fields("Address").Value), "", rsCustomers.Fields("Address").Value)
            txtMobileNo1.Text = IIf(IsNull(rsCustomers.Fields("MobileNo1").Value), "", rsCustomers.Fields("MobileNo1").Value)
            txtMobileNo2.Text = IIf(IsNull(rsCustomers.Fields("MobileNo2").Value), "", rsCustomers.Fields("MobileNo2").Value)
            txtEmail.Text = IIf(IsNull(rsCustomers.Fields("EmailId").Value), "", rsCustomers.Fields("EmailId").Value)
            
            ' Set combo boxes based on display values
            Dim i As Integer
            For i = 0 To cboCity.ListCount - 1
                If cboCity.List(i) = IIf(IsNull(rsCustomers.Fields("CityName").Value), "", rsCustomers.Fields("CityName").Value) Then
                    cboCity.ListIndex = i
                    Exit For
                End If
            Next i
            
            For i = 0 To cboState.ListCount - 1
                If cboState.List(i) = IIf(IsNull(rsCustomers.Fields("StateName").Value), "", rsCustomers.Fields("StateName").Value) Then
                    cboState.ListIndex = i
                    Exit For
                End If
            Next i
            
            For i = 0 To cboReference.ListCount - 1
                If cboReference.List(i) = IIf(IsNull(rsCustomers.Fields("ReferenceName").Value), "(None)", rsCustomers.Fields("ReferenceName").Value) Then
                    cboReference.ListIndex = i
                    Exit For
                End If
            Next i
        End If
    End If
    Exit Sub
    
ErrorHandler:
    ' Handle any errors silently for row changes
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If Not rsCustomers Is Nothing Then
        rsCustomers.Close
        Set rsCustomers = Nothing
    End If
End Sub