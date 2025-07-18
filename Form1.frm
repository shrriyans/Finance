VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Master Data System"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Test Database"
      Height          =   495
      Left            =   1440
      TabIndex        =   0
      Top             =   1320
      Width           =   1815
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
    If InitializeDatabase() Then
        MsgBox "Database connected successfully!", vbInformation
    Else
        MsgBox "Database connection failed!", vbCritical
    End If
End Sub

Private Sub Form_Load()
    Me.Caption = "Master Data Management System"
End Sub