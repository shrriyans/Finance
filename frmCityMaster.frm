VERSION 5.00
Begin VB.Form frmCityMaster 
   Caption         =   "City Master"
   ClientHeight    =   6975
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8535
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6975
   ScaleWidth      =   8535
   Begin VB.Frame Frame2 
      Caption         =   "City List"
      Height          =   3735
      Left            =   120
      TabIndex        =   14
      Top             =   3000
      Width           =   8295
      Begin VB.ListBox lstCities 
         Height          =   3180
         Left            =   120
         TabIndex        =   15
         Top             =   360
         Width           =   8055
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "City Details"
      Height          =   2775
      Left            =   120
      TabIndex        =   4
      Top             =   120
      Width           =   8295
      Begin VB.ComboBox cboState 
         Height          =   315
         Left            =   1440
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   1680
         Width           =   3015
      End
      Begin VB.CheckBox chkIsActive 
         Caption         =   "Is Active"
         Height          =   255
         Left            =   1440
         TabIndex        =   4
         Top             =   2160
         Value           =   1  'Checked
         Width           =   1215
      End
      Begin VB.TextBox txtShortCode 
         Height          =   315
         Left            =   1440
         MaxLength       =   5
         TabIndex        =   2
         Top             =   1200
         Width           =   1215
      End
      Begin VB.TextBox txtCityName 
         Height          =   315
         Left            =   1440
         MaxLength       =   50
         TabIndex        =   1
         Top             =   720
         Width           =   3015
      End
      Begin VB.TextBox txtCityId 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1440
         Locked          =   -1  'True
         TabIndex        =   5
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label5 
         Caption         =   "State:"
         Height          =   255
         Left            =   240
         TabIndex        =   13
         Top             =   1680
         Width           =   1095
      End
      Begin VB.Label Label4 
         Caption         =   "Short Code:"
         Height          =   255
         Left            =   240
         TabIndex        =   12
         Top             =   1200
         Width           =   1095
      End
      Begin VB.Label Label3 
         Caption         =   "City Name:"
         Height          =   255
         Left            =   240
         TabIndex        =   11
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "City ID:"
         Height          =   255
         Left            =   240
         TabIndex        =   10
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   375
      Left            =   7080
      TabIndex        =   9
      Top             =   6840
      Width           =   1215
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "&Delete"
      Height          =   375
      Left            =   5760
      TabIndex        =   8
      Top             =   6840
      Width           =   1215
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "&Save"
      Height          =   375
      Left            =   4440
      TabIndex        =   7
      Top             =   6840
      Width           =   1215
   End
   Begin VB.CommandButton cmdNew 
      Caption         =   "&New"
      Height          =   375
      Left            =   3120
      TabIndex        =   6
      Top             =   6840
      Width           =   1215
   End
End
Attribute VB_Name = "frmCityMaster"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    LoadStates
    LoadCities
    ClearForm
End Sub

Private Sub LoadStates()
    Dim strSQL As String
    strSQL = "SELECT StateId, StateName FROM state_master WHERE IsActive = 1 ORDER BY StateName"
    FillCombo cboState, strSQL, "StateId", "StateName"
End Sub

Private Sub LoadCities()
    Dim strSQL As String
    Dim rsTemp As ADODB.Recordset
    
    lstCities.Clear
    strSQL = "SELECT c.CityId, c.CityName, c.ShortCode, c.IsActive, s.StateName " & _
             "FROM city_master c " & _
             "INNER JOIN state_master s ON c.StateId = s.StateId " & _
             "ORDER BY c.CityName"
    Set rsTemp = ExecuteQuery(strSQL)
    
    Do While Not rsTemp.EOF
        lstCities.AddItem rsTemp("CityId") & " - " & rsTemp("CityName") & " (" & rsTemp("ShortCode") & ") - " & rsTemp("StateName") & " - " & IIf(rsTemp("IsActive"), "Active", "Inactive")
        rsTemp.MoveNext
    Loop
    
    rsTemp.Close
    Set rsTemp = Nothing
End Sub

Private Sub ClearForm()
    txtCityId.Text = ""
    txtCityName.Text = ""
    txtShortCode.Text = ""
    cboState.ListIndex = -1
    chkIsActive.Value = 1
    txtCityName.SetFocus
End Sub

Private Sub cmdNew_Click()
    ClearForm
End Sub

Private Sub cmdSave_Click()
    ' Validate input
    If Trim(txtCityName.Text) = "" Then
        MsgBox "Please enter city name.", vbExclamation, "Validation Error"
        txtCityName.SetFocus
        Exit Sub
    End If
    
    If Trim(txtShortCode.Text) = "" Then
        MsgBox "Please enter short code.", vbExclamation, "Validation Error"
        txtShortCode.SetFocus
        Exit Sub
    End If
    
    If cboState.ListIndex = -1 Then
        MsgBox "Please select a state.", vbExclamation, "Validation Error"
        cboState.SetFocus
        Exit Sub
    End If
    
    Dim strSQL As String
    
    If txtCityId.Text = "" Then
        ' Insert new record
        strSQL = "INSERT INTO city_master (CityName, ShortCode, StateId, IsActive) VALUES ('" & _
                CleanString(txtCityName.Text) & "', '" & _
                CleanString(txtShortCode.Text) & "', " & _
                cboState.ItemData(cboState.ListIndex) & ", " & _
                IIf(chkIsActive.Value = 1, "1", "0") & ")"
    Else
        ' Update existing record
        strSQL = "UPDATE city_master SET CityName = '" & _
                CleanString(txtCityName.Text) & "', ShortCode = '" & _
                CleanString(txtShortCode.Text) & "', StateId = " & _
                cboState.ItemData(cboState.ListIndex) & ", IsActive = " & _
                IIf(chkIsActive.Value = 1, "1", "0") & _
                " WHERE CityId = " & txtCityId.Text
    End If
    
    If ExecuteCommand(strSQL) Then
        MsgBox "City saved successfully.", vbInformation, "Success"
        LoadCities
        ClearForm
    End If
End Sub

Private Sub cmdDelete_Click()
    If txtCityId.Text = "" Then
        MsgBox "Please select a city to delete.", vbExclamation, "Validation Error"
        Exit Sub
    End If
    
    Dim response As Integer
    response = MsgBox("Are you sure you want to delete this city?", vbYesNo + vbQuestion, "Confirm Delete")
    
    If response = vbYes Then
        Dim strSQL As String
        strSQL = "DELETE FROM city_master WHERE CityId = " & txtCityId.Text
        
        If ExecuteCommand(strSQL) Then
            MsgBox "City deleted successfully.", vbInformation, "Success"
            LoadCities
            ClearForm
        End If
    End If
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub lstCities_Click()
    If lstCities.ListIndex >= 0 Then
        Dim cityId As String
        Dim parts() As String
        
        parts = Split(lstCities.Text, " - ")
        cityId = parts(0)
        
        LoadCityDetails cityId
    End If
End Sub

Private Sub LoadCityDetails(cityId As String)
    Dim strSQL As String
    Dim rsTemp As ADODB.Recordset
    Dim i As Integer
    
    strSQL = "SELECT * FROM city_master WHERE CityId = " & cityId
    Set rsTemp = ExecuteQuery(strSQL)
    
    If Not rsTemp.EOF Then
        txtCityId.Text = rsTemp("CityId")
        txtCityName.Text = rsTemp("CityName")
        txtShortCode.Text = rsTemp("ShortCode")
        chkIsActive.Value = IIf(rsTemp("IsActive"), 1, 0)
        
        ' Set state combo
        For i = 0 To cboState.ListCount - 1
            If cboState.ItemData(i) = rsTemp("StateId") Then
                cboState.ListIndex = i
                Exit For
            End If
        Next i
    End If
    
    rsTemp.Close
    Set rsTemp = Nothing
End Sub

Private Sub txtCityName_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then txtShortCode.SetFocus
End Sub

Private Sub txtShortCode_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then cboState.SetFocus
    ' Convert to uppercase
    If KeyAscii >= 97 And KeyAscii <= 122 Then
        KeyAscii = KeyAscii - 32
    End If
End Sub

Private Sub cboState_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then cmdSave.SetFocus
End Sub