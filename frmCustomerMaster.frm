VERSION 5.00
Begin VB.Form frmCustomerMaster 
   Caption         =   "Customer Master"
   ClientHeight    =   9015
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10935
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   9015
   ScaleWidth      =   10935
   Begin VB.Frame Frame2 
      Caption         =   "Customer List"
      Height          =   3735
      Left            =   120
      TabIndex        =   24
      Top             =   5040
      Width           =   10695
      Begin VB.ListBox lstCustomers 
         Height          =   3180
         Left            =   120
         TabIndex        =   25
         Top             =   360
         Width           =   10455
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Customer Details"
      Height          =   4815
      Left            =   120
      TabIndex        =   8
      Top             =   120
      Width           =   10695
      Begin VB.ComboBox cboReference 
         Height          =   315
         Left            =   1680
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Top             =   3480
         Width           =   3015
      End
      Begin VB.ComboBox cboCity 
         Height          =   315
         Left            =   1680
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Top             =   2760
         Width           =   3015
      End
      Begin VB.ComboBox cboState 
         Height          =   315
         Left            =   1680
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   3120
         Width           =   3015
      End
      Begin VB.CheckBox chkIsActive 
         Caption         =   "Is Active"
         Height          =   255
         Left            =   1680
         TabIndex        =   8
         Top             =   3840
         Value           =   1  'Checked
         Width           =   1215
      End
      Begin VB.TextBox txtEmailId 
         Height          =   315
         Left            =   1680
         MaxLength       =   50
         TabIndex        =   4
         Top             =   2400
         Width           =   3015
      End
      Begin VB.TextBox txtMobileNo 
         Height          =   315
         Left            =   1680
         MaxLength       =   15
         TabIndex        =   3
         Top             =   2040
         Width           =   2055
      End
      Begin VB.TextBox txtAddress 
         Height          =   855
         Left            =   1680
         MaxLength       =   500
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   2
         Top             =   1080
         Width           =   4215
      End
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
         TabIndex        =   9
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label Label9 
         Caption         =   "Reference:"
         Height          =   255
         Left            =   240
         TabIndex        =   23
         Top             =   3480
         Width           =   1335
      End
      Begin VB.Label Label8 
         Caption         =   "City:"
         Height          =   255
         Left            =   240
         TabIndex        =   22
         Top             =   2760
         Width           =   1335
      End
      Begin VB.Label Label7 
         Caption         =   "State:"
         Height          =   255
         Left            =   240
         TabIndex        =   21
         Top             =   3120
         Width           =   1335
      End
      Begin VB.Label Label6 
         Caption         =   "Email ID:"
         Height          =   255
         Left            =   240
         TabIndex        =   20
         Top             =   2400
         Width           =   1335
      End
      Begin VB.Label Label5 
         Caption         =   "Mobile No:"
         Height          =   255
         Left            =   240
         TabIndex        =   19
         Top             =   2040
         Width           =   1335
      End
      Begin VB.Label Label4 
         Caption         =   "Address:"
         Height          =   255
         Left            =   240
         TabIndex        =   18
         Top             =   1080
         Width           =   1335
      End
      Begin VB.Label Label3 
         Caption         =   "Customer Name:"
         Height          =   255
         Left            =   240
         TabIndex        =   17
         Top             =   720
         Width           =   1335
      End
      Begin VB.Label Label1 
         Caption         =   "Customer ID:"
         Height          =   255
         Left            =   240
         TabIndex        =   16
         Top             =   360
         Width           =   1335
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   375
      Left            =   9480
      TabIndex        =   15
      Top             =   9120
      Width           =   1215
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "&Delete"
      Height          =   375
      Left            =   8160
      TabIndex        =   14
      Top             =   9120
      Width           =   1215
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "&Save"
      Height          =   375
      Left            =   6840
      TabIndex        =   13
      Top             =   9120
      Width           =   1215
   End
   Begin VB.CommandButton cmdNew 
      Caption         =   "&New"
      Height          =   375
      Left            =   5520
      TabIndex        =   12
      Top             =   9120
      Width           =   1215
   End
End
Attribute VB_Name = "frmCustomerMaster"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    LoadStates
    LoadReferences
    LoadCustomers
    ClearForm
End Sub

Private Sub LoadStates()
    Dim strSQL As String
    strSQL = "SELECT StateId, StateName FROM state_master WHERE IsActive = 1 ORDER BY StateName"
    FillCombo cboState, strSQL, "StateId", "StateName"
End Sub

Private Sub LoadCities(stateId As Long)
    Dim strSQL As String
    cboCity.Clear
    
    If stateId > 0 Then
        strSQL = "SELECT CityId, CityName FROM city_master WHERE StateId = " & stateId & " AND IsActive = 1 ORDER BY CityName"
        FillCombo cboCity, strSQL, "CityId", "CityName"
    End If
End Sub

Private Sub LoadReferences()
    Dim strSQL As String
    strSQL = "SELECT ReferenceId, ReferenceName FROM reference_master WHERE IsActive = 1 ORDER BY ReferenceName"
    FillCombo cboReference, strSQL, "ReferenceId", "ReferenceName"
End Sub

Private Sub LoadCustomers()
    Dim strSQL As String
    Dim rsTemp As ADODB.Recordset
    
    lstCustomers.Clear
    strSQL = "SELECT c.CustomerId, c.CustomerName, c.MobileNo, c.EmailId, c.IsActive, " & _
             "ct.CityName, s.StateName, r.ReferenceName " & _
             "FROM customer_master c " & _
             "LEFT JOIN city_master ct ON c.CityId = ct.CityId " & _
             "LEFT JOIN state_master s ON c.StateId = s.StateId " & _
             "LEFT JOIN reference_master r ON c.ReferenceId = r.ReferenceId " & _
             "ORDER BY c.CustomerName"
    Set rsTemp = ExecuteQuery(strSQL)
    
    Do While Not rsTemp.EOF
        lstCustomers.AddItem rsTemp("CustomerId") & " - " & rsTemp("CustomerName") & " - " & _
                            IIf(IsNull(rsTemp("MobileNo")), "", rsTemp("MobileNo")) & " - " & _
                            IIf(IsNull(rsTemp("CityName")), "", rsTemp("CityName")) & " - " & _
                            IIf(IsNull(rsTemp("ReferenceName")), "", rsTemp("ReferenceName")) & " - " & _
                            IIf(rsTemp("IsActive"), "Active", "Inactive")
        rsTemp.MoveNext
    Loop
    
    rsTemp.Close
    Set rsTemp = Nothing
End Sub

Private Sub ClearForm()
    txtCustomerId.Text = ""
    txtCustomerName.Text = ""
    txtAddress.Text = ""
    txtMobileNo.Text = ""
    txtEmailId.Text = ""
    cboState.ListIndex = -1
    cboCity.Clear
    cboReference.ListIndex = -1
    chkIsActive.Value = 1
    txtCustomerName.SetFocus
End Sub

Private Sub cmdNew_Click()
    ClearForm
End Sub

Private Sub cmdSave_Click()
    ' Validate input
    If Trim(txtCustomerName.Text) = "" Then
        MsgBox "Please enter customer name.", vbExclamation, "Validation Error"
        txtCustomerName.SetFocus
        Exit Sub
    End If
    
    Dim strSQL As String
    Dim cityId As String
    Dim stateId As String
    Dim referenceId As String
    
    ' Get selected IDs
    cityId = "NULL"
    stateId = "NULL"
    referenceId = "NULL"
    
    If cboCity.ListIndex >= 0 Then
        cityId = cboCity.ItemData(cboCity.ListIndex)
    End If
    
    If cboState.ListIndex >= 0 Then
        stateId = cboState.ItemData(cboState.ListIndex)
    End If
    
    If cboReference.ListIndex >= 0 Then
        referenceId = cboReference.ItemData(cboReference.ListIndex)
    End If
    
    If txtCustomerId.Text = "" Then
        ' Insert new record
        strSQL = "INSERT INTO customer_master (CustomerName, Address, MobileNo, EmailId, CityId, StateId, ReferenceId, IsActive) VALUES ('" & _
                CleanString(txtCustomerName.Text) & "', '" & _
                CleanString(txtAddress.Text) & "', '" & _
                CleanString(txtMobileNo.Text) & "', '" & _
                CleanString(txtEmailId.Text) & "', " & _
                cityId & ", " & stateId & ", " & referenceId & ", " & _
                IIf(chkIsActive.Value = 1, "1", "0") & ")"
    Else
        ' Update existing record
        strSQL = "UPDATE customer_master SET CustomerName = '" & _
                CleanString(txtCustomerName.Text) & "', Address = '" & _
                CleanString(txtAddress.Text) & "', MobileNo = '" & _
                CleanString(txtMobileNo.Text) & "', EmailId = '" & _
                CleanString(txtEmailId.Text) & "', CityId = " & _
                cityId & ", StateId = " & stateId & ", ReferenceId = " & _
                referenceId & ", IsActive = " & _
                IIf(chkIsActive.Value = 1, "1", "0") & _
                " WHERE CustomerId = " & txtCustomerId.Text
    End If
    
    If ExecuteCommand(strSQL) Then
        MsgBox "Customer saved successfully.", vbInformation, "Success"
        LoadCustomers
        ClearForm
    End If
End Sub

Private Sub cmdDelete_Click()
    If txtCustomerId.Text = "" Then
        MsgBox "Please select a customer to delete.", vbExclamation, "Validation Error"
        Exit Sub
    End If
    
    Dim response As Integer
    response = MsgBox("Are you sure you want to delete this customer?", vbYesNo + vbQuestion, "Confirm Delete")
    
    If response = vbYes Then
        Dim strSQL As String
        strSQL = "DELETE FROM customer_master WHERE CustomerId = " & txtCustomerId.Text
        
        If ExecuteCommand(strSQL) Then
            MsgBox "Customer deleted successfully.", vbInformation, "Success"
            LoadCustomers
            ClearForm
        End If
    End If
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub lstCustomers_Click()
    If lstCustomers.ListIndex >= 0 Then
        Dim customerId As String
        Dim parts() As String
        
        parts = Split(lstCustomers.Text, " - ")
        customerId = parts(0)
        
        LoadCustomerDetails customerId
    End If
End Sub

Private Sub LoadCustomerDetails(customerId As String)
    Dim strSQL As String
    Dim rsTemp As ADODB.Recordset
    Dim i As Integer
    
    strSQL = "SELECT * FROM customer_master WHERE CustomerId = " & customerId
    Set rsTemp = ExecuteQuery(strSQL)
    
    If Not rsTemp.EOF Then
        txtCustomerId.Text = rsTemp("CustomerId")
        txtCustomerName.Text = IIf(IsNull(rsTemp("CustomerName")), "", rsTemp("CustomerName"))
        txtAddress.Text = IIf(IsNull(rsTemp("Address")), "", rsTemp("Address"))
        txtMobileNo.Text = IIf(IsNull(rsTemp("MobileNo")), "", rsTemp("MobileNo"))
        txtEmailId.Text = IIf(IsNull(rsTemp("EmailId")), "", rsTemp("EmailId"))
        chkIsActive.Value = IIf(rsTemp("IsActive"), 1, 0)
        
        ' Set state combo
        If Not IsNull(rsTemp("StateId")) Then
            For i = 0 To cboState.ListCount - 1
                If cboState.ItemData(i) = rsTemp("StateId") Then
                    cboState.ListIndex = i
                    LoadCities rsTemp("StateId")
                    Exit For
                End If
            Next i
        End If
        
        ' Set city combo
        If Not IsNull(rsTemp("CityId")) Then
            For i = 0 To cboCity.ListCount - 1
                If cboCity.ItemData(i) = rsTemp("CityId") Then
                    cboCity.ListIndex = i
                    Exit For
                End If
            Next i
        End If
        
        ' Set reference combo
        If Not IsNull(rsTemp("ReferenceId")) Then
            For i = 0 To cboReference.ListCount - 1
                If cboReference.ItemData(i) = rsTemp("ReferenceId") Then
                    cboReference.ListIndex = i
                    Exit For
                End If
            Next i
        End If
    End If
    
    rsTemp.Close
    Set rsTemp = Nothing
End Sub

Private Sub cboState_Click()
    If cboState.ListIndex >= 0 Then
        LoadCities cboState.ItemData(cboState.ListIndex)
    Else
        cboCity.Clear
    End If
End Sub

Private Sub txtCustomerName_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then txtAddress.SetFocus
End Sub

Private Sub txtMobileNo_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then txtEmailId.SetFocus
    ' Allow only numbers, backspace, and delete
    If Not ((KeyAscii >= 48 And KeyAscii <= 57) Or KeyAscii = 8 Or KeyAscii = 127 Or KeyAscii = 43 Or KeyAscii = 45) Then
        KeyAscii = 0
    End If
End Sub

Private Sub txtEmailId_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then cboState.SetFocus
End Sub