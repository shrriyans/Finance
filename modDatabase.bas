Attribute VB_Name = "modDatabase"
Option Explicit

' Global variables for database connection
Public cn As ADODB.Connection
Public rs As ADODB.Recordset
Public strConnectionString As String

' Database connection parameters
Public Const DB_SERVER = "localhost"
Public Const DB_NAME = "vb6_masters_db"
Public Const DB_USER = "root"
Public Const DB_PASSWORD = "password"  ' Change this to your MySQL password

' Initialize database connection
Public Function InitializeDatabase() As Boolean
    On Error GoTo ErrorHandler
    
    ' Create connection string for MySQL ODBC
    strConnectionString = "DRIVER={MySQL ODBC 8.0 Unicode Driver};" & _
                         "SERVER=" & DB_SERVER & ";" & _
                         "DATABASE=" & DB_NAME & ";" & _
                         "UID=" & DB_USER & ";" & _
                         "PWD=" & DB_PASSWORD & ";" & _
                         "OPTION=3;"
    
    ' Create connection object
    Set cn = New ADODB.Connection
    cn.ConnectionString = strConnectionString
    cn.Open
    
    InitializeDatabase = True
    Exit Function
    
ErrorHandler:
    MsgBox "Database connection failed: " & Err.Description, vbCritical, "Database Error"
    InitializeDatabase = False
End Function

' Close database connection
Public Sub CloseDatabase()
    On Error Resume Next
    
    If Not rs Is Nothing Then
        If rs.State = adStateOpen Then rs.Close
        Set rs = Nothing
    End If
    
    If Not cn Is Nothing Then
        If cn.State = adStateOpen Then cn.Close
        Set cn = Nothing
    End If
End Sub

' Execute SQL query and return recordset
Public Function ExecuteQuery(strSQL As String) As ADODB.Recordset
    On Error GoTo ErrorHandler
    
    Set rs = New ADODB.Recordset
    rs.Open strSQL, cn, adOpenStatic, adLockReadOnly
    Set ExecuteQuery = rs
    Exit Function
    
ErrorHandler:
    MsgBox "Query execution failed: " & Err.Description & vbCrLf & "SQL: " & strSQL, vbCritical, "Database Error"
    Set ExecuteQuery = Nothing
End Function

' Execute SQL command (INSERT, UPDATE, DELETE)
Public Function ExecuteCommand(strSQL As String) As Boolean
    On Error GoTo ErrorHandler
    
    cn.Execute strSQL
    ExecuteCommand = True
    Exit Function
    
ErrorHandler:
    MsgBox "Command execution failed: " & Err.Description & vbCrLf & "SQL: " & strSQL, vbCritical, "Database Error"
    ExecuteCommand = False
End Function

' Get next auto-increment ID for a table
Public Function GetNextID(tableName As String, idField As String) As Long
    On Error GoTo ErrorHandler
    
    Dim strSQL As String
    Dim rsTemp As ADODB.Recordset
    
    strSQL = "SELECT MAX(" & idField & ") as MaxID FROM " & tableName
    Set rsTemp = ExecuteQuery(strSQL)
    
    If Not rsTemp.EOF Then
        If IsNull(rsTemp("MaxID")) Then
            GetNextID = 1
        Else
            GetNextID = rsTemp("MaxID") + 1
        End If
    Else
        GetNextID = 1
    End If
    
    rsTemp.Close
    Set rsTemp = Nothing
    Exit Function
    
ErrorHandler:
    GetNextID = 1
End Function

' Validate user login
Public Function ValidateLogin(userName As String, password As String) As Boolean
    On Error GoTo ErrorHandler
    
    Dim strSQL As String
    Dim rsTemp As ADODB.Recordset
    
    strSQL = "SELECT * FROM user_master WHERE UserName = '" & userName & "' AND Password = '" & password & "'"
    Set rsTemp = ExecuteQuery(strSQL)
    
    If Not rsTemp.EOF Then
        ValidateLogin = True
    Else
        ValidateLogin = False
    End If
    
    rsTemp.Close
    Set rsTemp = Nothing
    Exit Function
    
ErrorHandler:
    ValidateLogin = False
End Function

' Fill combo box with data
Public Sub FillCombo(cbo As ComboBox, strSQL As String, valueField As String, textField As String)
    On Error GoTo ErrorHandler
    
    Dim rsTemp As ADODB.Recordset
    
    cbo.Clear
    Set rsTemp = ExecuteQuery(strSQL)
    
    Do While Not rsTemp.EOF
        cbo.AddItem rsTemp(textField)
        cbo.ItemData(cbo.NewIndex) = rsTemp(valueField)
        rsTemp.MoveNext
    Loop
    
    rsTemp.Close
    Set rsTemp = Nothing
    Exit Sub
    
ErrorHandler:
    MsgBox "Error filling combo: " & Err.Description, vbCritical, "Error"
End Sub

' Clean string for SQL (prevent SQL injection)
Public Function CleanString(inputString As String) As String
    CleanString = Replace(inputString, "'", "''")
End Function