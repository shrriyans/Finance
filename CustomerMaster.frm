VERSION 5.00
Begin VB.Form CustomerMaster 
   Caption         =   "Customer Master"
   ClientHeight    =   6000
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6000
   ScaleWidth      =   8000
   Begin VB.Frame Frame1 
      Caption         =   "Customer Details"
      Height          =   3015
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   7695
      Begin VB.TextBox txtCustomerName 
         Height          =   315
         Left            =   1680
         MaxLength       =   50
         TabIndex        =   1
         Top             =   720
         Width           =   3015
      End
      Begin VB.TextBox txtCustomerId 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1680
         Locked          =   -1  'True
         TabIndex        =   2
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label Label3 
         Caption         =   "Customer Name:"
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Top             =   720
         Width           =   1335
      End
      Begin VB.Label Label1 
         Caption         =   "Customer ID:"
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   360
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
      Caption         =   "Customer List"
      Height          =   2175
      Left            =   120
      TabIndex        =   7
      Top             =   3240
      Width           =   7695
      Begin VB.ListBox lstCustomers 
         Height          =   1815
         Left            =   120
         TabIndex        =   8
         Top             =   240
         Width           =   7455
      End
   End
End
Attribute VB_Name = "CustomerMaster"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub Form_Load()
    LoadCustomers
    ClearForm
End Sub

Private Sub LoadCustomers()
    Dim strSQL As String
    Dim rsTemp As ADODB.Recordset
    
    lstCustomers.Clear
    strSQL = "SELECT CustomerId, CustomerName FROM customer_master ORDER BY CustomerName"
    Set rsTemp = ExecuteQuery(strSQL)
    
    If Not rsTemp Is Nothing Then
        Do While Not rsTemp.EOF
            lstCustomers.AddItem rsTemp("CustomerId") & " - " & rsTemp("CustomerName")
            rsTemp.MoveNext
        Loop
        rsTemp.Close
        Set rsTemp = Nothing
    End If
End Sub

Private Sub ClearForm()
    txtCustomerId.Text = ""
    txtCustomerName.Text = ""
    txtCustomerName.SetFocus
End Sub

Private Sub cmdSave_Click()
    ' Validate input
    If Trim(txtCustomerName.Text) = "" Then
        MsgBox "Please enter customer name.", vbExclamation, "Validation Error"
        txtCustomerName.SetFocus
        Exit Sub
    End If
    
    Dim strSQL As String
    
    If txtCustomerId.Text = "" Then
        ' Insert new record
        strSQL = "INSERT INTO customer_master (CustomerName, IsActive) VALUES ('" & _
                CleanString(txtCustomerName.Text) & "', 1)"
    Else
        ' Update existing record
        strSQL = "UPDATE customer_master SET CustomerName = '" & _
                CleanString(txtCustomerName.Text) & "' WHERE CustomerId = " & txtCustomerId.Text
    End If
    
    If ExecuteCommand(strSQL) Then
        MsgBox "Customer saved successfully.", vbInformation, "Success"
        LoadCustomers
        ClearForm
    End If
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub