VERSION 5.00
Begin VB.Form Login 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Login"
   ClientHeight    =   3015
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   4680
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3015
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   375
      Left            =   2520
      TabIndex        =   3
      Top             =   2280
      Width           =   1215
   End
   Begin VB.CommandButton cmdLogin 
      Caption         =   "&Login"
      Default         =   -1  'True
      Height          =   375
      Left            =   1080
      TabIndex        =   2
      Top             =   2280
      Width           =   1215
   End
   Begin VB.TextBox txtPassword 
      Height          =   315
      IMEMode         =   3  'DISABLE
      Left            =   1680
      MaxLength       =   15
      PasswordChar    =   "*"
      TabIndex        =   1
      Top             =   1440
      Width           =   2055
   End
   Begin VB.TextBox txtUserName 
      Height          =   315
      Left            =   1680
      MaxLength       =   25
      TabIndex        =   0
      Top             =   960
      Width           =   2055
   End
   Begin VB.Label Label2 
      Caption         =   "Password:"
      Height          =   255
      Left            =   720
      TabIndex        =   5
      Top             =   1440
      Width           =   855
   End
   Begin VB.Label Label1 
      Caption         =   "User Name:"
      Height          =   255
      Left            =   720
      TabIndex        =   4
      Top             =   960
      Width           =   855
   End
   Begin VB.Label lblTitle 
      Alignment       =   2  'Center
      Caption         =   "Master Data Management System"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   6
      Top             =   240
      Width           =   4215
   End
End
Attribute VB_Name = "Login"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub Form_Load()
    ' Initialize database connection
    If Not InitializeDatabase() Then
        MsgBox "Failed to connect to database. Please check your database configuration.", vbCritical, "Database Error"
        End
    End If
    
    ' Set default values for testing
    txtUserName.Text = "admin"
    txtPassword.Text = "admin123"
End Sub

Private Sub cmdLogin_Click()
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
    
    ' Validate login credentials
    If ValidateLogin(Trim(txtUserName.Text), Trim(txtPassword.Text)) Then
        ' Login successful
        Me.Hide
        MainForm.Show
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

Private Sub txtUserName_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then ' Enter key
        txtPassword.SetFocus
    End If
End Sub

Private Sub txtPassword_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then ' Enter key
        cmdLogin_Click
    End If
End Sub