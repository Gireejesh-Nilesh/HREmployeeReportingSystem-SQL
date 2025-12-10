-- View: Employee basic info with dept
CREATE OR ALTER VIEW dbo.vw_EmployeeBasic AS
SELECT e.EmpID, e.EmpCode, e.FirstName, e.LastName, d.DeptName, e.Designation, e.DateOfJoining, e.Email, e.IsActive
FROM dbo.Employee e
JOIN dbo.Department d ON e.DeptID = d.DeptID;
GO
