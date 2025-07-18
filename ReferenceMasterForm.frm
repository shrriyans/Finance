VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmReferenceMaster 
   Caption         =   "Reference Master"
   ClientHeight    =   9000
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   12000
   LinkTopic       =   "Form1"
   ScaleHeight     =   9000
   ScaleWidth      =   12000
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame2 
      Caption         =   "Reference List"
      Height          =   3975
      Left            =   120
      TabIndex        =   19
      Top             =   4800
      Width           =   11775
      Begin MSDataGridLib.DataGrid dgReferences 
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
      Caption         =   "Reference Information"
      Height          =   4575
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   11775
      Begin VB.CheckBox chkIsActive 
         Caption         =   "Is Active"
         Height          =   255
         Left            =   1560
         TabIndex        =   10
         Top             =   3840
         Value           =   1  'Checked
         Width           =   1215
      End
      Begin VB.ComboBox cboReferredBy 
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
      Begin VB.TextBox txtReferenceID 
         BackColor       =   &H8000000F&
         Height          =   285
         Left            =   1560
         Locked          =   -1  'True
         TabIndex        =   1
         Top             =   600
         Width           =   1575
      End
      Begin VB.Label Label10 
         Caption         =   "Referred By:"
         Height          =   255
         Left            =   7680
         TabIndex        =   29
         Top             =   3240
         Width           =   975
      End
      Begin VB.Label Label9 
         Caption         =   "Mobile No 2:"
         Height          =   255
         Left            =   7680
         TabIndex        =   28
         Top             =   2760
         Width           =   975
      End
      Begin VB.Label Label8 
         Caption         =   "Mobile No 1:"
         Height          =   255
         Left            =   240
         TabIndex        =   27
         Top             =   2760
         Width           =   975
      End
      Begin VB.Label Label7 
         Caption         =   "Email:"
         Height          =   255
         Left            =   240
         TabIndex        =   26
         Top             =   3240
         Width           =   975
      End
      Begin VB.Label Label6 
         Caption         =   "State:"
         Height          =   255
         Left            =   7680
         TabIndex        =   25
         Top             =   2280
         Width           =   975
      End
      Begin VB.Label Label5 
         Caption         =   "City:"
         Height          =   255
         Left            =   240
         TabIndex        =   24
         Top             =   2280
         Width           =   975
      End
      Begin VB.Label Label4 
         Caption         =   "Address:"
         Height          =   255
         Left            =   240
         TabIndex        =   23
         Top             =   1560
         Width           =   975
      End
      Begin VB.Label Label3 
         Caption         =   "Name:"
         Height          =   255
         Left            =   240
         TabIndex        =   22
         Top             =   1080
         Width           =   975
      End
      Begin VB.Label Label2 
         Caption         =   "Reference ID:"
         Height          =   255
         Left            =   240
         TabIndex        =   21
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
Attribute VB_Name = "frmReferenceMaster"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private rsReferences As ADODB.Recordset

Private Sub Form_Load()
    LoadCities
    LoadStates
    LoadReferredBy
    LoadReferences
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

Private Sub LoadReferredBy()
    On Error GoTo ErrorHandler
    
    Dim rsReferredBy As ADODB.Recordset
    Set rsReferredBy = GetReferences()
    
    cboReferredBy.Clear
    cboReferredBy.AddItem "(None)"
    cboReferredBy.ItemData(cboReferredBy.NewIndex) = 0
    
    If Not rsReferredBy Is Nothing Then
        Do While Not rsReferredBy.EOF
            cboReferredBy.AddItem rsReferredBy.Fields("Name").Value
            cboReferredBy.ItemData(cboReferredBy.NewIndex) = rsReferredBy.Fields("ReferenceId").Value
            rsReferredBy.MoveNext
        Loop
        rsReferredBy.Close
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error loading referred by: " & Err.Description, vbCritical, "Load Error"
End Sub

Private Sub LoadReferences()
    On Error GoTo ErrorHandler
    
    Dim sql As String
    sql = "SELECT r.ReferenceId, r.Name, r.Address, ct.CityName, s.StateName, " & _
          "r.MobileNo1, r.MobileNo2, r.EmailId, r2.Name as ReferredByName, r.IsActive " & _
          "FROM ReferenceMaster r " & _
          "LEFT JOIN CityMaster ct ON r.CityId = ct.CityId " & _
          "LEFT JOIN StateMaster s ON r.StateId = s.StateId " & _
          "LEFT JOIN ReferenceMaster r2 ON r.ReferredById = r2.ReferenceId " & _
          "ORDER BY r.Name"
    
    Set rsReferences = New ADODB.Recordset
    rsReferences.Open sql, conn, adOpenStatic, adLockReadOnly
    
    Set dgReferences.DataSource = rsReferences
    Exit Sub
    
ErrorHandler:
    MsgBox "Error loading references: " & Err.Description, vbCritical, "Load Error"
End Sub

Private Sub ClearFields()
    txtReferenceID.Text = ""
    txtName.Text = ""
    txtAddress.Text = ""
    cboCity.ListIndex = -1
    cboState.ListIndex = -1
    txtMobileNo1.Text = ""
    txtMobileNo2.Text = ""
    txtEmail.Text = ""
    cboReferredBy.ListIndex = 0
    chkIsActive.Value = 1
End Sub

Private Function ValidateFields() As Boolean
    ValidateFields = False
    
    If Trim(txtName.Text) = "" Then
        MsgBox "Please enter reference name", vbInformation, "Validation Error"
        txtName.SetFocus
        Exit Function
    End If
    
    ValidateFields = True
End Function

Private Sub cmdAdd_Click()
    On Error GoTo ErrorHandler
    
    If ValidateFields() Then
        Dim sql As String
        sql = "INSERT INTO ReferenceMaster (Name, Address, CityId, StateId, MobileNo1, MobileNo2, EmailId, ReferredById, IsActive) VALUES ('" & _
              txtName.Text & "', '" & txtAddress.Text & "', " & _
              IIf(cboCity.ListIndex = -1, "NULL", cboCity.ItemData(cboCity.ListIndex)) & ", " & _
              IIf(cboState.ListIndex = -1, "NULL", cboState.ItemData(cboState.ListIndex)) & ", '" & _
              txtMobileNo1.Text & "', '" & txtMobileNo2.Text & "', '" & txtEmail.Text & "', " & _
              IIf(cboReferredBy.ListIndex > 0, cboReferredBy.ItemData(cboReferredBy.ListIndex), "NULL") & ", " & _
              IIf(chkIsActive.Value = 1, "1", "0") & ")"
        
        conn.Execute sql
        
        ClearFields
        LoadReferences
        LoadReferredBy  ' Refresh the referred by combo
        MsgBox "Reference added successfully", vbInformation, "Success"
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error adding reference: " & Err.Description, vbCritical, "Add Error"
End Sub

Private Sub cmdUpdate_Click()
    On Error GoTo ErrorHandler
    
    If txtReferenceID.Text = "" Then
        MsgBox "Please select a reference to update", vbInformation, "Update Reference"
        Exit Sub
    End If
    
    If ValidateFields() Then
        Dim sql As String
        sql = "UPDATE ReferenceMaster SET Name='" & txtName.Text & "', Address='" & txtAddress.Text & _
              "', CityId=" & IIf(cboCity.ListIndex = -1, "NULL", cboCity.ItemData(cboCity.ListIndex)) & _
              ", StateId=" & IIf(cboState.ListIndex = -1, "NULL", cboState.ItemData(cboState.ListIndex)) & _
              ", MobileNo1='" & txtMobileNo1.Text & "', MobileNo2='" & txtMobileNo2.Text & "', EmailId='" & txtEmail.Text & _
              "', ReferredById=" & IIf(cboReferredBy.ListIndex > 0, cboReferredBy.ItemData(cboReferredBy.ListIndex), "NULL") & _
              ", IsActive=" & IIf(chkIsActive.Value = 1, "1", "0") & _
              " WHERE ReferenceId=" & txtReferenceID.Text
        
        conn.Execute sql
        
        LoadReferences
        LoadReferredBy  ' Refresh the referred by combo
        MsgBox "Reference updated successfully", vbInformation, "Success"
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error updating reference: " & Err.Description, vbCritical, "Update Error"
End Sub

Private Sub cmdDelete_Click()
    On Error GoTo ErrorHandler
    
    If txtReferenceID.Text = "" Then
        MsgBox "Please select a reference to delete", vbInformation, "Delete Reference"
        Exit Sub
    End If
    
    If MsgBox("Are you sure you want to delete this reference?", vbYesNo + vbQuestion, "Confirm Delete") = vbYes Then
        Dim sql As String
        sql = "UPDATE ReferenceMaster SET IsActive=0 WHERE ReferenceId=" & txtReferenceID.Text
        
        conn.Execute sql
        
        ClearFields
        LoadReferences
        LoadReferredBy  ' Refresh the referred by combo
        MsgBox "Reference deleted successfully", vbInformation, "Success"
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error deleting reference: " & Err.Description, vbCritical, "Delete Error"
End Sub

Private Sub cmdClear_Click()
    ClearFields
End Sub

Private Sub cmdRefresh_Click()
    LoadReferences
    LoadReferredBy
End Sub

Private Sub cmdSearch_Click()
    ' Implement search functionality
    Dim searchTerm As String
    searchTerm = InputBox("Enter search term (Name, Email, or Mobile):", "Search Reference")
    
    If Trim(searchTerm) <> "" Then
        On Error GoTo ErrorHandler
        
        Dim sql As String
        sql = "SELECT r.ReferenceId, r.Name, r.Address, ct.CityName, s.StateName, " & _
              "r.MobileNo1, r.MobileNo2, r.EmailId, r2.Name as ReferredByName, r.IsActive " & _
              "FROM ReferenceMaster r " & _
              "LEFT JOIN CityMaster ct ON r.CityId = ct.CityId " & _
              "LEFT JOIN StateMaster s ON r.StateId = s.StateId " & _
              "LEFT JOIN ReferenceMaster r2 ON r.ReferredById = r2.ReferenceId " & _
              "WHERE (r.Name LIKE '%" & searchTerm & "%' OR r.EmailId LIKE '%" & searchTerm & "%' OR r.MobileNo1 LIKE '%" & searchTerm & "%') " & _
              "ORDER BY r.Name"
        
        If Not rsReferences Is Nothing Then rsReferences.Close
        Set rsReferences = New ADODB.Recordset
        rsReferences.Open sql, conn, adOpenStatic, adLockReadOnly
        
        Set dgReferences.DataSource = rsReferences
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error searching references: " & Err.Description, vbCritical, "Search Error"
End Sub

Private Sub cmdClose_Click()
    Unload Me
End Sub

Private Sub dgReferences_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
    On Error GoTo ErrorHandler
    
    If Not rsReferences Is Nothing Then
        If Not rsReferences.EOF And Not rsReferences.BOF Then
            txtReferenceID.Text = rsReferences.Fields("ReferenceId").Value
            txtName.Text = rsReferences.Fields("Name").Value
            txtAddress.Text = IIf(IsNull(rsReferences.Fields("Address").Value), "", rsReferences.Fields("Address").Value)
            txtMobileNo1.Text = IIf(IsNull(rsReferences.Fields("MobileNo1").Value), "", rsReferences.Fields("MobileNo1").Value)
            txtMobileNo2.Text = IIf(IsNull(rsReferences.Fields("MobileNo2").Value), "", rsReferences.Fields("MobileNo2").Value)
            txtEmail.Text = IIf(IsNull(rsReferences.Fields("EmailId").Value), "", rsReferences.Fields("EmailId").Value)
            chkIsActive.Value = IIf(rsReferences.Fields("IsActive").Value, 1, 0)
            
            ' Set combo boxes based on display values
            Dim i As Integer
            For i = 0 To cboCity.ListCount - 1
                If cboCity.List(i) = IIf(IsNull(rsReferences.Fields("CityName").Value), "", rsReferences.Fields("CityName").Value) Then
                    cboCity.ListIndex = i
                    Exit For
                End If
            Next i
            
            For i = 0 To cboState.ListCount - 1
                If cboState.List(i) = IIf(IsNull(rsReferences.Fields("StateName").Value), "", rsReferences.Fields("StateName").Value) Then
                    cboState.ListIndex = i
                    Exit For
                End If
            Next i
            
            For i = 0 To cboReferredBy.ListCount - 1
                If cboReferredBy.List(i) = IIf(IsNull(rsReferences.Fields("ReferredByName").Value), "(None)", rsReferences.Fields("ReferredByName").Value) Then
                    cboReferredBy.ListIndex = i
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
    If Not rsReferences Is Nothing Then
        rsReferences.Close
        Set rsReferences = Nothing
    End If
End Sub