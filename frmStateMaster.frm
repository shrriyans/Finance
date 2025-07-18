VERSION 5.00
Begin VB.Form frmStateMaster 
   Caption         =   "State Master"
   ClientHeight    =   6435
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8535
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6435
   ScaleWidth      =   8535
   Begin VB.Frame Frame2 
      Caption         =   "State List"
      Height          =   3735
      Left            =   120
      TabIndex        =   11
      Top             =   2520
      Width           =   8295
      Begin VB.ListBox lstStates 
         Height          =   3180
         Left            =   120
         TabIndex        =   12
         Top             =   360
         Width           =   8055
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "State Details"
      Height          =   2295
      Left            =   120
      TabIndex        =   4
      Top             =   120
      Width           =   8295
      Begin VB.CheckBox chkIsActive 
         Caption         =   "Is Active"
         Height          =   255
         Left            =   1440
         TabIndex        =   3
         Top             =   1680
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
      Begin VB.TextBox txtStateName 
         Height          =   315
         Left            =   1440
         MaxLength       =   25
         TabIndex        =   1
         Top             =   720
         Width           =   3015
      End
      Begin VB.TextBox txtStateId 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1440
         Locked          =   -1  'True
         TabIndex        =   5
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label4 
         Caption         =   "Short Code:"
         Height          =   255
         Left            =   240
         TabIndex        =   9
         Top             =   1200
         Width           =   1095
      End
      Begin VB.Label Label3 
         Caption         =   "State Name:"
         Height          =   255
         Left            =   240
         TabIndex        =   8
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "State ID:"
         Height          =   255
         Left            =   240
         TabIndex        =   7
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   375
      Left            =   7080
      TabIndex        =   10
      Top             =   6840
      Width           =   1215
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "&Delete"
      Height          =   375
      Left            =   5760
      TabIndex        =   6
      Top             =   6840
      Width           =   1215
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "&Save"
      Height          =   375
      Left            =   4440
      TabIndex        =   0
      Top             =   6840
      Width           =   1215
   End
End
Attribute VB_Name = "frmStateMaster"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
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
    
    Do While Not rsTemp.EOF
        lstStates.AddItem rsTemp("StateId") & " - " & rsTemp("StateName") & " (" & rsTemp("ShortCode") & ") - " & IIf(rsTemp("IsActive"), "Active", "Inactive")
        rsTemp.MoveNext
    Loop
    
    rsTemp.Close
    Set rsTemp = Nothing
End Sub

Private Sub ClearForm()
    txtStateId.Text = ""
    txtStateName.Text = ""
    txtShortCode.Text = ""
    chkIsActive.Value = 1
    txtStateName.SetFocus
End Sub

Private Sub cmdSave_Click()
    ' Validate input
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
        ' Insert new record
        strSQL = "INSERT INTO state_master (StateName, ShortCode, IsActive) VALUES ('" & _
                CleanString(txtStateName.Text) & "', '" & _
                CleanString(txtShortCode.Text) & "', " & _
                IIf(chkIsActive.Value = 1, "1", "0") & ")"
    Else
        ' Update existing record
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
    
    If Not rsTemp.EOF Then
        txtStateId.Text = rsTemp("StateId")
        txtStateName.Text = rsTemp("StateName")
        txtShortCode.Text = rsTemp("ShortCode")
        chkIsActive.Value = IIf(rsTemp("IsActive"), 1, 0)
    End If
    
    rsTemp.Close
    Set rsTemp = Nothing
End Sub

Private Sub txtStateName_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then txtShortCode.SetFocus
End Sub

Private Sub txtShortCode_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then cmdSave.SetFocus
    ' Convert to uppercase
    If KeyAscii >= 97 And KeyAscii <= 122 Then
        KeyAscii = KeyAscii - 32
    End If
End Sub