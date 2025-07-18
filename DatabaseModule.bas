Attribute VB_Name = "DatabaseModule"
Option Explicit

' Database connection variables
Public conn As ADODB.Connection
Public rs As ADODB.Recordset

' Database connection parameters
Public Const DB_SERVER = "localhost"
Public Const DB_NAME = "CustomerManagement"
Public Const DB_USER = "root"
Public Const DB_PASSWORD = ""

Public Function ConnectToDatabase() As Boolean
    On Error GoTo ErrorHandler
    
    ' Create connection object
    Set conn = New ADODB.Connection
    
    ' Build connection string for MySQL
    Dim connectionString As String
    connectionString = "Provider=MSDASQL.1;" & _
                      "Data Source=MySQL_DSN;" & _
                      "Database=" & DB_NAME & ";" & _
                      "Uid=" & DB_USER & ";" & _
                      "Pwd=" & DB_PASSWORD & ";"
    
    ' Open connection
    conn.Open connectionString
    
    ConnectToDatabase = True
    Exit Function
    
ErrorHandler:
    ConnectToDatabase = False
    MsgBox "Database connection failed: " & Err.Description, vbCritical, "Connection Error"
End Function

Public Sub DisconnectFromDatabase()
    On Error Resume Next
    
    If Not rs Is Nothing Then
        If rs.State = adStateOpen Then rs.Close
        Set rs = Nothing
    End If
    
    If Not conn Is Nothing Then
        If conn.State = adStateOpen Then conn.Close
        Set conn = Nothing
    End If
End Sub

Public Function ValidateUser(username As String, password As String) As Boolean
    On Error GoTo ErrorHandler
    
    Dim sql As String
    sql = "SELECT COUNT(*) FROM Users WHERE UserName = '" & username & "' AND Password = '" & password & "' AND IsActive = 1"
    
    Set rs = conn.Execute(sql)
    
    If rs.Fields(0).Value > 0 Then
        ValidateUser = True
    Else
        ValidateUser = False
    End If
    
    rs.Close
    Exit Function
    
ErrorHandler:
    ValidateUser = False
    MsgBox "Login validation failed: " & Err.Description, vbCritical, "Database Error"
End Function

Public Function GetCities() As ADODB.Recordset
    On Error GoTo ErrorHandler
    
    Dim sql As String
    sql = "SELECT CityId, CityName, ShortCode, StateId FROM CityMaster WHERE IsActive = 1 ORDER BY CityName"
    
    Set rs = New ADODB.Recordset
    rs.Open sql, conn, adOpenStatic, adLockReadOnly
    
    Set GetCities = rs
    Exit Function
    
ErrorHandler:
    MsgBox "Failed to retrieve cities: " & Err.Description, vbCritical, "Database Error"
    Set GetCities = Nothing
End Function

Public Function GetReferences() As ADODB.Recordset
    On Error GoTo ErrorHandler
    
    Dim sql As String
    sql = "SELECT ReferenceId, Name FROM ReferenceMaster WHERE IsActive = 1 ORDER BY Name"
    
    Set rs = New ADODB.Recordset
    rs.Open sql, conn, adOpenStatic, adLockReadOnly
    
    Set GetReferences = rs
    Exit Function
    
ErrorHandler:
    MsgBox "Failed to retrieve references: " & Err.Description, vbCritical, "Database Error"
    Set GetReferences = Nothing
End Function

Public Function GetStates() As ADODB.Recordset
    On Error GoTo ErrorHandler
    
    Dim sql As String
    sql = "SELECT StateId, StateName, StateCode FROM StateMaster WHERE IsActive = 1 ORDER BY StateName"
    
    Set rs = New ADODB.Recordset
    rs.Open sql, conn, adOpenStatic, adLockReadOnly
    
    Set GetStates = rs
    Exit Function
    
ErrorHandler:
    MsgBox "Failed to retrieve states: " & Err.Description, vbCritical, "Database Error"
    Set GetStates = Nothing
End Function