VERSION 5.00
Begin VB.Form UserMaster 
   Caption         =   "User Master"
   ClientHeight    =   4800
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   4800
   ScaleWidth      =   6000
   Begin VB.Frame Frame1 
      Caption         =   "User Details"
      Height          =   2295
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   5775
      Begin VB.TextBox txtPassword 
         Height          =   315
         IMEMode         =   3  'DISABLE
         Left            =   1440
         MaxLength       =   15
         PasswordChar    =   "*"
         TabIndex        =   2
         Top             =   1200
         Width           =   2055
      End
      Begin VB.TextBox txtUserName 
         Height          =   315
         Left            =   1440
         MaxLength       =   25
         TabIndex        =   1
         Top             =   720
         Width           =   2055
      End
      Begin VB.TextBox txtUserId 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1440
         Locked          =   -1  'True
         TabIndex        =   4
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label3 
         Caption         =   "Password:"
         Height          =   255
         Left            =   240
         TabIndex        =   8
         Top             =   1200
         Width           =   1095
      End
      Begin VB.Label Label2 
         Caption         =   "User Name:"
         Height          =   255
         Left            =   240
         TabIndex        =   7
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "User ID:"
         Height          =   255
         Left            =   240
         TabIndex        =   6
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   375
      Left            =   4560
      TabIndex        =   9
      Top             =   4200
      Width           =   1215
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "&Save"
      Height          =   375
      Left            =   3240
      TabIndex        =   0
      Top             =   4200
      Width           =   1215
   End
   Begin VB.Frame Frame2 
      Caption         =   "User List"
      Height          =   1575
      Left            =   120
      TabIndex        =   10
      Top             =   2520
      Width           =   5775
      Begin VB.ListBox lstUsers 
         Height          =   1035
         Left            =   120
         TabIndex        =   11
         Top             =   360
         Width           =   5535
      End
   End
End
Attribute VB_Name = "UserMaster"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub Form_Load()
    LoadUsers
    ClearForm
End Sub

Private Sub LoadUsers()
    Dim strSQL As String
    Dim rsTemp As ADODB.Recordset
    
    lstUsers.Clear
    strSQL = "SELECT Id, UserName FROM user_master ORDER BY UserName"
    Set rsTemp = ExecuteQuery(strSQL)
    
    If Not rsTemp Is Nothing Then
        Do While Not rsTemp.EOF
            lstUsers.AddItem rsTemp("Id") & " - " & rsTemp("UserName")
            rsTemp.MoveNext
        Loop
        rsTemp.Close
        Set rsTemp = Nothing
    End If
End Sub

Private Sub ClearForm()
    txtUserId.Text = ""
    txtUserName.Text = ""
    txtPassword.Text = ""
    txtUserName.SetFocus
End Sub

Private Sub cmdSave_Click()
    ' Validate input
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
    
    Dim strSQL As String
    
    If txtUserId.Text = "" Then
        ' Insert new record
        strSQL = "INSERT INTO user_master (UserName, Password) VALUES ('" & _
                CleanString(txtUserName.Text) & "', '" & _
                CleanString(txtPassword.Text) & "')"
    Else
        ' Update existing record
        strSQL = "UPDATE user_master SET UserName = '" & _
                CleanString(txtUserName.Text) & "', Password = '" & _
                CleanString(txtPassword.Text) & "' WHERE Id = " & txtUserId.Text
    End If
    
    If ExecuteCommand(strSQL) Then
        MsgBox "User saved successfully.", vbInformation, "Success"
        LoadUsers
        ClearForm
    End If
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub lstUsers_Click()
    If lstUsers.ListIndex >= 0 Then
        Dim userId As String
        Dim parts() As String
        
        parts = Split(lstUsers.Text, " - ")
        userId = parts(0)
        
        LoadUserDetails userId
    End If
End Sub

Private Sub LoadUserDetails(userId As String)
    Dim strSQL As String
    Dim rsTemp As ADODB.Recordset
    
    strSQL = "SELECT * FROM user_master WHERE Id = " & userId
    Set rsTemp = ExecuteQuery(strSQL)
    
    If Not rsTemp Is Nothing Then
        If Not rsTemp.EOF Then
            txtUserId.Text = rsTemp("Id")
            txtUserName.Text = rsTemp("UserName")
            txtPassword.Text = rsTemp("Password")
        End If
        rsTemp.Close
        Set rsTemp = Nothing
    End If
End Sub