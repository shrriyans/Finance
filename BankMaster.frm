VERSION 5.00
Begin VB.Form BankMaster 
   Caption         =   "Bank Master"
   ClientHeight    =   4800
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   4800
   ScaleWidth      =   6000
   Begin VB.Frame Frame1 
      Caption         =   "Bank Details"
      Height          =   1695
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   5775
      Begin VB.CheckBox chkIsActive 
         Caption         =   "Is Active"
         Height          =   255
         Left            =   1440
         TabIndex        =   2
         Top             =   1200
         Value           =   1  'Checked
         Width           =   1215
      End
      Begin VB.TextBox txtBankName 
         Height          =   315
         Left            =   1440
         MaxLength       =   50
         TabIndex        =   1
         Top             =   720
         Width           =   4215
      End
      Begin VB.TextBox txtBankId 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1440
         Locked          =   -1  'True
         TabIndex        =   3
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "Bank Name:"
         Height          =   255
         Left            =   240
         TabIndex        =   6
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "Bank ID:"
         Height          =   255
         Left            =   240
         TabIndex        =   5
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   375
      Left            =   4560
      TabIndex        =   7
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
      Caption         =   "Bank List"
      Height          =   2175
      Left            =   120
      TabIndex        =   8
      Top             =   1920
      Width           =   5775
      Begin VB.ListBox lstBanks 
         Height          =   1815
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Width           =   5535
      End
   End
End
Attribute VB_Name = "BankMaster"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub Form_Load()
    LoadBanks
    ClearForm
End Sub

Private Sub LoadBanks()
    Dim strSQL As String
    Dim rsTemp As ADODB.Recordset
    
    lstBanks.Clear
    strSQL = "SELECT BankId, BankName, IsActive FROM bank_master ORDER BY BankName"
    Set rsTemp = ExecuteQuery(strSQL)
    
    If Not rsTemp Is Nothing Then
        Do While Not rsTemp.EOF
            lstBanks.AddItem rsTemp("BankId") & " - " & rsTemp("BankName") & " - " & IIf(rsTemp("IsActive"), "Active", "Inactive")
            rsTemp.MoveNext
        Loop
        rsTemp.Close
        Set rsTemp = Nothing
    End If
End Sub

Private Sub ClearForm()
    txtBankId.Text = ""
    txtBankName.Text = ""
    chkIsActive.Value = 1
    txtBankName.SetFocus
End Sub

Private Sub cmdSave_Click()
    ' Validate input
    If Trim(txtBankName.Text) = "" Then
        MsgBox "Please enter bank name.", vbExclamation, "Validation Error"
        txtBankName.SetFocus
        Exit Sub
    End If
    
    Dim strSQL As String
    
    If txtBankId.Text = "" Then
        ' Insert new record
        strSQL = "INSERT INTO bank_master (BankName, IsActive) VALUES ('" & _
                CleanString(txtBankName.Text) & "', " & _
                IIf(chkIsActive.Value = 1, "1", "0") & ")"
    Else
        ' Update existing record
        strSQL = "UPDATE bank_master SET BankName = '" & _
                CleanString(txtBankName.Text) & "', IsActive = " & _
                IIf(chkIsActive.Value = 1, "1", "0") & _
                " WHERE BankId = " & txtBankId.Text
    End If
    
    If ExecuteCommand(strSQL) Then
        MsgBox "Bank saved successfully.", vbInformation, "Success"
        LoadBanks
        ClearForm
    End If
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub