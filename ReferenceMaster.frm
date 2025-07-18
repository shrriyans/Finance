VERSION 5.00
Begin VB.Form ReferenceMaster 
   Caption         =   "Reference Master"
   ClientHeight    =   6000
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6000
   ScaleWidth      =   8000
   Begin VB.Frame Frame1 
      Caption         =   "Reference Details"
      Height          =   3015
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   7695
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
         TabIndex        =   2
         Top             =   120
         Width           =   1215
      End
      Begin VB.Label Label3 
         Caption         =   "Reference Name:"
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label Label1 
         Caption         =   "Reference ID:"
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   120
         Width           =   1335
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   375
      Left            =   6600
      TabIndex        =   6
      Top             =   5400
      Width           =   1215
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "&Save"
      Height          =   375
      Left            =   5280
      TabIndex        =   5
      Top             =   5400
      Width           =   1215
   End
   Begin VB.Frame Frame2 
      Caption         =   "Reference List"
      Height          =   2175
      Left            =   120
      TabIndex        =   7
      Top             =   3240
      Width           =   7695
      Begin VB.ListBox lstReferences 
         Height          =   1815
         Left            =   120
         TabIndex        =   8
         Top             =   240
         Width           =   7455
      End
   End
End
Attribute VB_Name = "ReferenceMaster"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub Form_Load()
    LoadReferences
    ClearForm
End Sub

Private Sub LoadReferences()
    Dim strSQL As String
    Dim rsTemp As ADODB.Recordset
    
    lstReferences.Clear
    strSQL = "SELECT ReferenceId, ReferenceName FROM reference_master ORDER BY ReferenceName"
    Set rsTemp = ExecuteQuery(strSQL)
    
    If Not rsTemp Is Nothing Then
        Do While Not rsTemp.EOF
            lstReferences.AddItem rsTemp("ReferenceId") & " - " & rsTemp("ReferenceName")
            rsTemp.MoveNext
        Loop
        rsTemp.Close
        Set rsTemp = Nothing
    End If
End Sub

Private Sub ClearForm()
    txtReferenceId.Text = ""
    txtReferenceName.Text = ""
    txtReferenceName.SetFocus
End Sub

Private Sub cmdSave_Click()
    ' Validate input
    If Trim(txtReferenceName.Text) = "" Then
        MsgBox "Please enter reference name.", vbExclamation, "Validation Error"
        txtReferenceName.SetFocus
        Exit Sub
    End If
    
    Dim strSQL As String
    
    If txtReferenceId.Text = "" Then
        ' Insert new record
        strSQL = "INSERT INTO reference_master (ReferenceName, IsActive) VALUES ('" & _
                CleanString(txtReferenceName.Text) & "', 1)"
    Else
        ' Update existing record
        strSQL = "UPDATE reference_master SET ReferenceName = '" & _
                CleanString(txtReferenceName.Text) & "' WHERE ReferenceId = " & txtReferenceId.Text
    End If
    
    If ExecuteCommand(strSQL) Then
        MsgBox "Reference saved successfully.", vbInformation, "Success"
        LoadReferences
        ClearForm
    End If
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub