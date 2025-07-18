VERSION 5.00
Begin VB.Form frmReferenceMaster 
   Caption         =   "Reference Master"
   ClientHeight    =   8535
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10935
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8535
   ScaleWidth      =   10935
   Begin VB.Frame Frame2 
      Caption         =   "Reference List"
      Height          =   3735
      Left            =   120
      TabIndex        =   21
      Top             =   4560
      Width           =   10695
      Begin VB.ListBox lstReferences 
         Height          =   3180
         Left            =   120
         TabIndex        =   22
         Top             =   360
         Width           =   10455
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Reference Details"
      Height          =   4335
      Left            =   120
      TabIndex        =   8
      Top             =   120
      Width           =   10695
      Begin VB.ComboBox cboCity 
         Height          =   315
         Left            =   1680
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Top             =   2520
         Width           =   3015
      End
      Begin VB.ComboBox cboState 
         Height          =   315
         Left            =   1680
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   2880
         Width           =   3015
      End
      Begin VB.CheckBox chkIsActive 
         Caption         =   "Is Active"
         Height          =   255
         Left            =   1680
         TabIndex        =   7
         Top             =   3360
         Value           =   1  'Checked
         Width           =   1215
      End
      Begin VB.TextBox txtEmailId 
         Height          =   315
         Left            =   1680
         MaxLength       =   50
         TabIndex        =   4
         Top             =   2160
         Width           =   3015
      End
      Begin VB.TextBox txtMobileNo 
         Height          =   315
         Left            =   1680
         MaxLength       =   15
         TabIndex        =   3
         Top             =   1800
         Width           =   2055
      End
      Begin VB.TextBox txtAddress 
         Height          =   855
         Left            =   1680
         MaxLength       =   500
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   2
         Top             =   840
         Width           =   4215
      End
      Begin VB.TextBox txtReferenceName 
         Height          =   315
         Left            =   1680
         MaxLength       =   50
         TabIndex        =   1
         Top             =   480
         Width           =   3015
      End
      Begin VB.TextBox txtReferenceId 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1680
         Locked          =   -1  'True
         TabIndex        =   9
         Top             =   120
         Width           =   1215
      End
      Begin VB.Label Label8 
         Caption         =   "City:"
         Height          =   255
         Left            =   240
         TabIndex        =   20
         Top             =   2520
         Width           =   1335
      End
      Begin VB.Label Label7 
         Caption         =   "State:"
         Height          =   255
         Left            =   240
         TabIndex        =   19
         Top             =   2880
         Width           =   1335
      End
      Begin VB.Label Label6 
         Caption         =   "Email ID:"
         Height          =   255
         Left            =   240
         TabIndex        =   18
         Top             =   2160
         Width           =   1335
      End
      Begin VB.Label Label5 
         Caption         =   "Mobile No:"
         Height          =   255
         Left            =   240
         TabIndex        =   17
         Top             =   1800
         Width           =   1335
      End
      Begin VB.Label Label4 
         Caption         =   "Address:"
         Height          =   255
         Left            =   240
         TabIndex        =   16
         Top             =   840
         Width           =   1335
      End
      Begin VB.Label Label3 
         Caption         =   "Reference Name:"
         Height          =   255
         Left            =   240
         TabIndex        =   15
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label Label1 
         Caption         =   "Reference ID:"
         Height          =   255
         Left            =   240
         TabIndex        =   14
         Top             =   120
         Width           =   1335
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   375
      Left            =   9480
      TabIndex        =   13
      Top             =   8640
      Width           =   1215
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "&Delete"
      Height          =   375
      Left            =   8160
      TabIndex        =   12
      Top             =   8640
      Width           =   1215
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "&Save"
      Height          =   375
      Left            =   6840
      TabIndex        =   11
      Top             =   8640
      Width           =   1215
   End
   Begin VB.CommandButton cmdNew 
      Caption         =   "&New"
      Height          =   375
      Left            =   5520
      TabIndex        =   10
      Top             =   8640
      Width           =   1215
   End
End
Attribute VB_Name = "frmReferenceMaster"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    LoadStates
    LoadReferences
    ClearForm
End Sub

Private Sub LoadStates()
    Dim strSQL As String
    strSQL = "SELECT StateId, StateName FROM state_master WHERE IsActive = 1 ORDER BY StateName"
    FillCombo cboState, strSQL, "StateId", "StateName"
End Sub

Private Sub LoadCities(stateId As Long)
    Dim strSQL As String
    cboCity.Clear
    
    If stateId > 0 Then
        strSQL = "SELECT CityId, CityName FROM city_master WHERE StateId = " & stateId & " AND IsActive = 1 ORDER BY CityName"
        FillCombo cboCity, strSQL, "CityId", "CityName"
    End If
End Sub

Private Sub LoadReferences()
    Dim strSQL As String
    Dim rsTemp As ADODB.Recordset
    
    lstReferences.Clear
    strSQL = "SELECT r.ReferenceId, r.ReferenceName, r.MobileNo, r.EmailId, r.IsActive, " & _
             "c.CityName, s.StateName " & _
             "FROM reference_master r " & _
             "LEFT JOIN city_master c ON r.CityId = c.CityId " & _
             "LEFT JOIN state_master s ON r.StateId = s.StateId " & _
             "ORDER BY r.ReferenceName"
    Set rsTemp = ExecuteQuery(strSQL)
    
    Do While Not rsTemp.EOF
        lstReferences.AddItem rsTemp("ReferenceId") & " - " & rsTemp("ReferenceName") & " - " & _
                             IIf(IsNull(rsTemp("MobileNo")), "", rsTemp("MobileNo")) & " - " & _
                             IIf(IsNull(rsTemp("CityName")), "", rsTemp("CityName")) & " - " & _
                             IIf(rsTemp("IsActive"), "Active", "Inactive")
        rsTemp.MoveNext
    Loop
    
    rsTemp.Close
    Set rsTemp = Nothing
End Sub

Private Sub ClearForm()
    txtReferenceId.Text = ""
    txtReferenceName.Text = ""
    txtAddress.Text = ""
    txtMobileNo.Text = ""
    txtEmailId.Text = ""
    cboState.ListIndex = -1
    cboCity.Clear
    chkIsActive.Value = 1
    txtReferenceName.SetFocus
End Sub

Private Sub cmdNew_Click()
    ClearForm
End Sub

Private Sub cmdSave_Click()
    ' Validate input
    If Trim(txtReferenceName.Text) = "" Then
        MsgBox "Please enter reference name.", vbExclamation, "Validation Error"
        txtReferenceName.SetFocus
        Exit Sub
    End If
    
    Dim strSQL As String
    Dim cityId As String
    Dim stateId As String
    
    ' Get selected city and state IDs
    cityId = "NULL"
    stateId = "NULL"
    
    If cboCity.ListIndex >= 0 Then
        cityId = cboCity.ItemData(cboCity.ListIndex)
    End If
    
    If cboState.ListIndex >= 0 Then
        stateId = cboState.ItemData(cboState.ListIndex)
    End If
    
    If txtReferenceId.Text = "" Then
        ' Insert new record
        strSQL = "INSERT INTO reference_master (ReferenceName, Address, MobileNo, EmailId, CityId, StateId, IsActive) VALUES ('" & _
                CleanString(txtReferenceName.Text) & "', '" & _
                CleanString(txtAddress.Text) & "', '" & _
                CleanString(txtMobileNo.Text) & "', '" & _
                CleanString(txtEmailId.Text) & "', " & _
                cityId & ", " & stateId & ", " & _
                IIf(chkIsActive.Value = 1, "1", "0") & ")"
    Else
        ' Update existing record
        strSQL = "UPDATE reference_master SET ReferenceName = '" & _
                CleanString(txtReferenceName.Text) & "', Address = '" & _
                CleanString(txtAddress.Text) & "', MobileNo = '" & _
                CleanString(txtMobileNo.Text) & "', EmailId = '" & _
                CleanString(txtEmailId.Text) & "', CityId = " & _
                cityId & ", StateId = " & stateId & ", IsActive = " & _
                IIf(chkIsActive.Value = 1, "1", "0") & _
                " WHERE ReferenceId = " & txtReferenceId.Text
    End If
    
    If ExecuteCommand(strSQL) Then
        MsgBox "Reference saved successfully.", vbInformation, "Success"
        LoadReferences
        ClearForm
    End If
End Sub

Private Sub cmdDelete_Click()
    If txtReferenceId.Text = "" Then
        MsgBox "Please select a reference to delete.", vbExclamation, "Validation Error"
        Exit Sub
    End If
    
    Dim response As Integer
    response = MsgBox("Are you sure you want to delete this reference?", vbYesNo + vbQuestion, "Confirm Delete")
    
    If response = vbYes Then
        Dim strSQL As String
        strSQL = "DELETE FROM reference_master WHERE ReferenceId = " & txtReferenceId.Text
        
        If ExecuteCommand(strSQL) Then
            MsgBox "Reference deleted successfully.", vbInformation, "Success"
            LoadReferences
            ClearForm
        End If
    End If
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub lstReferences_Click()
    If lstReferences.ListIndex >= 0 Then
        Dim referenceId As String
        Dim parts() As String
        
        parts = Split(lstReferences.Text, " - ")
        referenceId = parts(0)
        
        LoadReferenceDetails referenceId
    End If
End Sub

Private Sub LoadReferenceDetails(referenceId As String)
    Dim strSQL As String
    Dim rsTemp As ADODB.Recordset
    Dim i As Integer
    
    strSQL = "SELECT * FROM reference_master WHERE ReferenceId = " & referenceId
    Set rsTemp = ExecuteQuery(strSQL)
    
    If Not rsTemp.EOF Then
        txtReferenceId.Text = rsTemp("ReferenceId")
        txtReferenceName.Text = IIf(IsNull(rsTemp("ReferenceName")), "", rsTemp("ReferenceName"))
        txtAddress.Text = IIf(IsNull(rsTemp("Address")), "", rsTemp("Address"))
        txtMobileNo.Text = IIf(IsNull(rsTemp("MobileNo")), "", rsTemp("MobileNo"))
        txtEmailId.Text = IIf(IsNull(rsTemp("EmailId")), "", rsTemp("EmailId"))
        chkIsActive.Value = IIf(rsTemp("IsActive"), 1, 0)
        
        ' Set state combo
        If Not IsNull(rsTemp("StateId")) Then
            For i = 0 To cboState.ListCount - 1
                If cboState.ItemData(i) = rsTemp("StateId") Then
                    cboState.ListIndex = i
                    LoadCities rsTemp("StateId")
                    Exit For
                End If
            Next i
        End If
        
        ' Set city combo
        If Not IsNull(rsTemp("CityId")) Then
            For i = 0 To cboCity.ListCount - 1
                If cboCity.ItemData(i) = rsTemp("CityId") Then
                    cboCity.ListIndex = i
                    Exit For
                End If
            Next i
        End If
    End If
    
    rsTemp.Close
    Set rsTemp = Nothing
End Sub

Private Sub cboState_Click()
    If cboState.ListIndex >= 0 Then
        LoadCities cboState.ItemData(cboState.ListIndex)
    Else
        cboCity.Clear
    End If
End Sub

Private Sub txtReferenceName_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then txtAddress.SetFocus
End Sub

Private Sub txtMobileNo_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then txtEmailId.SetFocus
    ' Allow only numbers, backspace, and delete
    If Not ((KeyAscii >= 48 And KeyAscii <= 57) Or KeyAscii = 8 Or KeyAscii = 127 Or KeyAscii = 43 Or KeyAscii = 45) Then
        KeyAscii = 0
    End If
End Sub

Private Sub txtEmailId_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then cboState.SetFocus
End Sub