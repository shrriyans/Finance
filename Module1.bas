Attribute VB_Name = "Module1"
Option Explicit

' Simple database connection test
Public Function InitializeDatabase() As Boolean
    On Error GoTo ErrorHandler
    
    ' For now, just return true to test the form loading
    InitializeDatabase = True
    Exit Function
    
ErrorHandler:
    InitializeDatabase = False
End Function