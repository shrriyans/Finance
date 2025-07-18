VERSION 5.00
Begin VB.MDIForm frmMain 
   BackColor       =   &H8000000C&
   Caption         =   "Master Data Management System"
   ClientHeight    =   7695
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   11400
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.Menu mnuMasters 
      Caption         =   "&Masters"
      Begin VB.Menu mnuStateMaster 
         Caption         =   "&State Master"
      End
      Begin VB.Menu mnuCityMaster 
         Caption         =   "&City Master"
      End
      Begin VB.Menu mnuSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuUserMaster 
         Caption         =   "&User Master"
      End
      Begin VB.Menu mnuBankMaster 
         Caption         =   "&Bank Master"
      End
      Begin VB.Menu mnuSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuReferenceMaster 
         Caption         =   "&Reference Master"
      End
      Begin VB.Menu mnuCustomerMaster 
         Caption         =   "C&ustomer Master"
      End
   End
   Begin VB.Menu mnuWindow 
      Caption         =   "&Window"
      WindowList      =   -1  'True
      Begin VB.Menu mnuCascade 
         Caption         =   "&Cascade"
      End
      Begin VB.Menu mnuTileHorizontal 
         Caption         =   "Tile &Horizontal"
      End
      Begin VB.Menu mnuTileVertical 
         Caption         =   "Tile &Vertical"
      End
      Begin VB.Menu mnuArrangeIcons 
         Caption         =   "&Arrange Icons"
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuLogout 
         Caption         =   "&Logout"
      End
      Begin VB.Menu mnuSep3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub MDIForm_Load()
    Me.Caption = "Master Data Management System - Welcome"
End Sub

Private Sub mnuStateMaster_Click()
    Dim frm As frmStateMaster
    Set frm = New frmStateMaster
    frm.Show
End Sub

Private Sub mnuCityMaster_Click()
    Dim frm As frmCityMaster
    Set frm = New frmCityMaster
    frm.Show
End Sub

Private Sub mnuUserMaster_Click()
    Dim frm As frmUserMaster
    Set frm = New frmUserMaster
    frm.Show
End Sub

Private Sub mnuBankMaster_Click()
    Dim frm As frmBankMaster
    Set frm = New frmBankMaster
    frm.Show
End Sub

Private Sub mnuReferenceMaster_Click()
    Dim frm As frmReferenceMaster
    Set frm = New frmReferenceMaster
    frm.Show
End Sub

Private Sub mnuCustomerMaster_Click()
    Dim frm As frmCustomerMaster
    Set frm = New frmCustomerMaster
    frm.Show
End Sub

Private Sub mnuCascade_Click()
    Me.Arrange vbCascade
End Sub

Private Sub mnuTileHorizontal_Click()
    Me.Arrange vbTileHorizontal
End Sub

Private Sub mnuTileVertical_Click()
    Me.Arrange vbTileVertical
End Sub

Private Sub mnuArrangeIcons_Click()
    Me.Arrange vbArrangeIcons
End Sub

Private Sub mnuLogout_Click()
    Dim response As Integer
    response = MsgBox("Are you sure you want to logout?", vbYesNo + vbQuestion, "Logout")
    If response = vbYes Then
        Me.Hide
        frmLogin.Show
        frmLogin.txtUserName.Text = ""
        frmLogin.txtPassword.Text = ""
        frmLogin.txtUserName.SetFocus
    End If
End Sub

Private Sub mnuExit_Click()
    Dim response As Integer
    response = MsgBox("Are you sure you want to exit?", vbYesNo + vbQuestion, "Exit")
    If response = vbYes Then
        CloseDatabase
        End
    End If
End Sub

Private Sub MDIForm_Unload(Cancel As Integer)
    CloseDatabase
    End
End Sub