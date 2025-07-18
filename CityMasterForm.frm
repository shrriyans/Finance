VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmCityMaster 
   Caption         =   "City Master"
   ClientHeight    =   6600
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   10200
   LinkTopic       =   "Form1"
   ScaleHeight     =   6600
   ScaleWidth      =   10200
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame2 
      Caption         =   "City List"
      Height          =   3375
      Left            =   120
      TabIndex        =   11
      Top             =   3120
      Width           =   9975
      Begin MSDataGridLib.DataGrid dgCities 
         Height          =   2895
         Left            =   120
         TabIndex        =   12
         Top             =   360
         Width           =   9735
         _ExtentX        =   17171
         _ExtentY        =   5106
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
      Caption         =   "City Information"
      Height          =   2895
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   9975
      Begin VB.CheckBox chkIsActive 
         Caption         =   "Is Active"
         Height          =   255
         Left            =   1560
         TabIndex        =   4
         Top             =   2280
         Value           =   1  'Checked
         Width           =   1215
      End
      Begin VB.ComboBox cboState 
         Height          =   315
         Left            =   1560
         TabIndex        =   3
         Top             =   1800
         Width           =   3255
      End
      Begin VB.TextBox txtShortCode 
         Height          =   285
         Left            =   1560
         MaxLength       =   5
         TabIndex        =   2
         Top             =   1320
         Width           =   1575
      End
      Begin VB.TextBox txtCityName 
         Height          =   285
         Left            =   1560
         MaxLength       =   50
         TabIndex        =   1
         Top             =   840
         Width           =   3255
      End
      Begin VB.TextBox txtCityID 
         BackColor       =   &H8000000F&
         Height          =   285
         Left            =   1560
         Locked          =   -1  'True
         TabIndex        =   13
         Top             =   360
         Width           =   1575
      End
      Begin VB.Label Label4 
         Caption         =   "State:"
         Height          =   255
         Left            =   240
         TabIndex        =   17
         Top             =   1800
         Width           =   975
      End
      Begin VB.Label Label3 
         Caption         =   "Short Code:"
         Height          =   255
         Left            =   240
         TabIndex        =   16
         Top             =   1320
         Width           =   975
      End
      Begin VB.Label Label2 
         Caption         =   "City Name:"
         Height          =   255
         Left            =   240
         TabIndex        =   15
         Top             =   840
         Width           =   975
      End
      Begin VB.Label Label1 
         Caption         =   "City ID:"
         Height          =   255
         Left            =   240
         TabIndex        =   14
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "&Close"
      Height          =   375
      Left            =   8760
      TabIndex        =   10
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "&Refresh"
      Height          =   375
      Left            =   7440
      TabIndex        =   9
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "&Delete"
      Height          =   375
      Left            =   6120
      TabIndex        =   8
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "&Update"
      Height          =   375
      Left            =   4800
      TabIndex        =   7
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "&Add"
      Height          =   375
      Left            =   3480
      TabIndex        =   6
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "C&lear"
      Height          =   375
      Left            =   2160
      TabIndex        =   5
      Top             =   2640
      Width           =   1215
   End
End
Attribute VB_Name = "frmCityMaster"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private rsCities As ADODB.Recordset

Private Sub Form_Load()
    LoadStates
    LoadCities
    ClearFields
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

Private Sub LoadCities()
    On Error GoTo ErrorHandler
    
    Dim sql As String
    sql = "SELECT c.CityId, c.CityName, c.ShortCode, s.StateName, c.IsActive " & _
          "FROM CityMaster c " & _
          "LEFT JOIN StateMaster s ON c.StateId = s.StateId " & _
          "ORDER BY c.CityName"
    
    Set rsCities = New ADODB.Recordset
    rsCities.Open sql, conn, adOpenStatic, adLockReadOnly
    
    Set dgCities.DataSource = rsCities
    Exit Sub
    
ErrorHandler:
    MsgBox "Error loading cities: " & Err.Description, vbCritical, "Load Error"
End Sub

Private Sub ClearFields()
    txtCityID.Text = ""
    txtCityName.Text = ""
    txtShortCode.Text = ""
    cboState.ListIndex = -1
    chkIsActive.Value = 1
End Sub

Private Function ValidateFields() As Boolean
    ValidateFields = False
    
    If Trim(txtCityName.Text) = "" Then
        MsgBox "Please enter city name", vbInformation, "Validation Error"
        txtCityName.SetFocus
        Exit Function
    End If
    
    If Trim(txtShortCode.Text) = "" Then
        MsgBox "Please enter short code", vbInformation, "Validation Error"
        txtShortCode.SetFocus
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
        sql = "INSERT INTO CityMaster (CityName, ShortCode, StateId, IsActive) VALUES ('" & _
              txtCityName.Text & "', '" & txtShortCode.Text & "', " & _
              cboState.ItemData(cboState.ListIndex) & ", " & IIf(chkIsActive.Value = 1, "1", "0") & ")"
        
        conn.Execute sql
        
        ClearFields
        LoadCities
        MsgBox "City added successfully", vbInformation, "Success"
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error adding city: " & Err.Description, vbCritical, "Add Error"
End Sub

Private Sub cmdUpdate_Click()
    On Error GoTo ErrorHandler
    
    If txtCityID.Text = "" Then
        MsgBox "Please select a city to update", vbInformation, "Update City"
        Exit Sub
    End If
    
    If ValidateFields() Then
        Dim sql As String
        sql = "UPDATE CityMaster SET CityName='" & txtCityName.Text & "', ShortCode='" & txtShortCode.Text & _
              "', StateId=" & cboState.ItemData(cboState.ListIndex) & ", IsActive=" & IIf(chkIsActive.Value = 1, "1", "0") & _
              " WHERE CityId=" & txtCityID.Text
        
        conn.Execute sql
        
        LoadCities
        MsgBox "City updated successfully", vbInformation, "Success"
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error updating city: " & Err.Description, vbCritical, "Update Error"
End Sub

Private Sub cmdDelete_Click()
    On Error GoTo ErrorHandler
    
    If txtCityID.Text = "" Then
        MsgBox "Please select a city to delete", vbInformation, "Delete City"
        Exit Sub
    End If
    
    If MsgBox("Are you sure you want to delete this city?", vbYesNo + vbQuestion, "Confirm Delete") = vbYes Then
        Dim sql As String
        sql = "DELETE FROM CityMaster WHERE CityId=" & txtCityID.Text
        
        conn.Execute sql
        
        ClearFields
        LoadCities
        MsgBox "City deleted successfully", vbInformation, "Success"
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Error deleting city: " & Err.Description, vbCritical, "Delete Error"
End Sub

Private Sub cmdClear_Click()
    ClearFields
End Sub

Private Sub cmdRefresh_Click()
    LoadCities
End Sub

Private Sub cmdClose_Click()
    Unload Me
End Sub

Private Sub dgCities_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
    On Error GoTo ErrorHandler
    
    If Not rsCities Is Nothing Then
        If Not rsCities.EOF And Not rsCities.BOF Then
            txtCityID.Text = rsCities.Fields("CityId").Value
            txtCityName.Text = rsCities.Fields("CityName").Value
            txtShortCode.Text = IIf(IsNull(rsCities.Fields("ShortCode").Value), "", rsCities.Fields("ShortCode").Value)
            chkIsActive.Value = IIf(rsCities.Fields("IsActive").Value, 1, 0)
            
            ' Set state combo box
            Dim i As Integer
            For i = 0 To cboState.ListCount - 1
                If cboState.List(i) = IIf(IsNull(rsCities.Fields("StateName").Value), "", rsCities.Fields("StateName").Value) Then
                    cboState.ListIndex = i
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
    If Not rsCities Is Nothing Then
        rsCities.Close
        Set rsCities = Nothing
    End If
End Sub