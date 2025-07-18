Attribute VB_Name = "DatabaseModule"
Option Explicit

' Database connection variables
Public conn As ADODB.Connection
Public rs As ADODB.Recordset

' Database connection parameters
Public Const DB_SERVER = "localhost"
Public Const DB_NAME = "employee_db"
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

Public Function ExecuteQuery(sql As String) As ADODB.Recordset
    On Error GoTo ErrorHandler
    
    Set rs = New ADODB.Recordset
    rs.Open sql, conn, adOpenStatic, adLockOptimistic
    
    Set ExecuteQuery = rs
    Exit Function
    
ErrorHandler:
    MsgBox "Query execution failed: " & Err.Description, vbCritical, "Query Error"
    Set ExecuteQuery = Nothing
End Function

Public Function ExecuteNonQuery(sql As String) As Boolean
    On Error GoTo ErrorHandler
    
    conn.Execute sql
    ExecuteNonQuery = True
    Exit Function
    
ErrorHandler:
    ExecuteNonQuery = False
    MsgBox "Command execution failed: " & Err.Description, vbCritical, "Execution Error"
End Function

Public Function GetEmployees() As ADODB.Recordset
    Dim sql As String
    sql = "SELECT employee_id, first_name, last_name, email, department, salary FROM employees ORDER BY employee_id"
    Set GetEmployees = ExecuteQuery(sql)
End Function

Public Function AddEmployee(firstName As String, lastName As String, email As String, department As String, salary As Double) As Boolean
    Dim sql As String
    sql = "INSERT INTO employees (first_name, last_name, email, department, salary) VALUES ('" & _
          firstName & "', '" & lastName & "', '" & email & "', '" & department & "', " & salary & ")"
    
    AddEmployee = ExecuteNonQuery(sql)
End Function

Public Function UpdateEmployee(employeeId As Long, firstName As String, lastName As String, email As String, department As String, salary As Double) As Boolean
    Dim sql As String
    sql = "UPDATE employees SET first_name='" & firstName & "', last_name='" & lastName & _
          "', email='" & email & "', department='" & department & "', salary=" & salary & _
          " WHERE employee_id=" & employeeId
    
    UpdateEmployee = ExecuteNonQuery(sql)
End Function

Public Function DeleteEmployee(employeeId As Long) As Boolean
    Dim sql As String
    sql = "DELETE FROM employees WHERE employee_id=" & employeeId
    
    DeleteEmployee = ExecuteNonQuery(sql)
End Function

Public Function SearchEmployees(searchTerm As String) As ADODB.Recordset
    Dim sql As String
    sql = "SELECT employee_id, first_name, last_name, email, department, salary FROM employees " & _
          "WHERE first_name LIKE '%" & searchTerm & "%' OR last_name LIKE '%" & searchTerm & "%' " & _
          "OR email LIKE '%" & searchTerm & "%' OR department LIKE '%" & searchTerm & "%' " & _
          "ORDER BY employee_id"
    
    Set SearchEmployees = ExecuteQuery(sql)
End Function