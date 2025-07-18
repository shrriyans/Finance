VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Customer Management System - Main Menu"
   ClientHeight    =   6000
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   8000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6000
   ScaleWidth      =   8000
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   855
      Left            =   4800
      TabIndex        =   4
      Top             =   3600
      Width           =   1935
   End
   Begin VB.CommandButton cmdReferenceMaster 
      Caption         =   "&Reference Master"
      Height          =   855
      Left            =   2400
      TabIndex        =   3
      Top             =   3600
      Width           =   1935
   End
   Begin VB.CommandButton cmdCityMaster 
      Caption         =   "&City Master"
      Height          =   855
      Left            =   240
      TabIndex        =   2
      Top             =   3600
      Width           =   1935
   End
   Begin VB.CommandButton cmdCustomerMaster 
      Caption         =   "&Customer Master"
      Height          =   855
      Left            =   2400
      TabIndex        =   1
      Top             =   2400
      Width           =   1935
   End
   Begin VB.Label lblWelcome 
      Alignment       =   2  'Center
      Caption         =   "Welcome to Customer Management System"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   720
      Width           =   7455
   End
   Begin VB.Label lblInstructions 
      Alignment       =   2  'Center
      Caption         =   "Please select an option from the menu below:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   5
      Top             =   1440
      Width           =   7455
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    ' Center the form
    Me.Left = (Screen.Width - Me.Width) / 2
    Me.Top = (Screen.Height - Me.Height) / 2
End Sub

Private Sub cmdCustomerMaster_Click()
    frmCustomerMaster.Show
End Sub

Private Sub cmdCityMaster_Click()
    frmCityMaster.Show
End Sub

Private Sub cmdReferenceMaster_Click()
    frmReferenceMaster.Show
End Sub

Private Sub cmdExit_Click()
    Dim result As Integer
    result = MsgBox("Are you sure you want to exit?", vbYesNo + vbQuestion, "Exit Application")
    If result = vbYes Then
        DisconnectFromDatabase
        End
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    DisconnectFromDatabase
    End
End Sub