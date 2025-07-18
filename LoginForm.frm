VERSION 5.00
Begin VB.Form frmLogin 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Customer Management System - Login"
   ClientHeight    =   3615
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3615
   ScaleWidth      =   4680
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   375
      Left            =   2520
      TabIndex        =   3
      Top             =   2760
      Width           =   1095
   End
   Begin VB.CommandButton cmdLogin 
      Caption         =   "&Login"
      Default         =   -1  'True
      Height          =   375
      Left            =   1200
      TabIndex        =   2
      Top             =   2760
      Width           =   1095
   End
   Begin VB.TextBox txtPassword 
      Height          =   285
      IMEMode         =   3  'DISABLE
      Left            =   1440
      PasswordChar    =   "*"
      TabIndex        =   1
      Top             =   2040
      Width           =   2175
   End
   Begin VB.TextBox txtUsername 
      Height          =   285
      Left            =   1440
      TabIndex        =   0
      Top             =   1560
      Width           =   2175
   End
   Begin VB.Label Label3 
      Caption         =   "Default Login: admin/admin123"
      ForeColor       =   &H00808080&
      Height          =   255
      Left            =   240
      TabIndex        =   6
      Top             =   3240
      Width           =   2775
   End
   Begin VB.Label Label2 
      Caption         =   "Password:"
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   2040
      Width           =   1095
   End
   Begin VB.Label Label1 
      Caption         =   "Username:"
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   1560
      Width           =   1095
   End
   Begin VB.Label lblTitle 
      Alignment       =   2  'Center
      Caption         =   "Customer Management System"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   375
      Left            =   240
      TabIndex        =   7
      Top             =   480
      Width           =   4215
   End
   Begin VB.Label lblSubTitle 
      Alignment       =   2  'Center
      Caption         =   "Please enter your credentials"
      Height          =   255
      Left            =   240
      TabIndex        =   8
      Top             =   960
      Width           =   4215
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    ' Initialize default values
    txtUsername.Text = "admin"
    txtPassword.Text = ""
    
    ' Connect to database
    If Not ConnectToDatabase() Then
        MsgBox "Failed to connect to database. Please check your MySQL connection.", vbCritical, "Connection Error"
        End
    End If
End Sub

Private Sub cmdLogin_Click()
    If Trim(txtUsername.Text) = "" Then
        MsgBox "Please enter username.", vbExclamation, "Login"
        txtUsername.SetFocus
        Exit Sub
    End If
    
    If Trim(txtPassword.Text) = "" Then
        MsgBox "Please enter password.", vbExclamation, "Login"
        txtPassword.SetFocus
        Exit Sub
    End If
    
    ' Validate user credentials
    If ValidateUser(txtUsername.Text, txtPassword.Text) Then
        ' Hide login form and show main form
        Me.Hide
        frmMain.Show
    Else
        MsgBox "Invalid username or password.", vbExclamation, "Login Failed"
        txtPassword.Text = ""
        txtUsername.SetFocus
    End If
End Sub

Private Sub cmdExit_Click()
    DisconnectFromDatabase
    End
End Sub

Private Sub Form_Unload(Cancel As Integer)
    DisconnectFromDatabase
    End
End Sub

Private Sub txtUsername_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then ' Enter key
        txtPassword.SetFocus
    End If
End Sub

Private Sub txtPassword_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then ' Enter key
        cmdLogin_Click
    End If
End Sub