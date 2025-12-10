-- Duplicate email
SELECT Email, COUNT(*) AS Cnt
FROM dbo.Employee
WHERE Email IS NOT NULL
GROUP BY Email
HAVING COUNT(*) > 1;

-- Duplicate EmpCode (unique should prevent but check)
SELECT EmpCode, COUNT(*) AS Cnt
FROM dbo.Employee
GROUP BY EmpCode
HAVING COUNT(*) > 1;


SELECT s.*
FROM dbo.Salary s
LEFT JOIN dbo.Employee e ON s.EmpID = e.EmpID
WHERE e.EmpID IS NULL;

SELECT a.*
FROM dbo.Attendance a
LEFT JOIN dbo.Employee e ON a.EmpID = e.EmpID
WHERE e.EmpID IS NULL;


DECLARE @MonthStart DATE = '2025-11-01';
SELECT e.EmpID, e.EmpCode, e.FirstName + ' ' + ISNULL(e.LastName,'') AS EmployeeName
FROM dbo.Employee e
LEFT JOIN dbo.Salary s ON e.EmpID = s.EmpID AND s.SalaryMonth = @MonthStart
WHERE s.SalaryID IS NULL;


-- Employees with >5 absent days in Nov 2025
SELECT e.EmpID, e.EmpCode, e.FirstName + ' ' + ISNULL(e.LastName,'') Name, COUNT(*) AS AbsentDays
FROM dbo.Attendance a
JOIN dbo.Employee e ON a.EmpID = e.EmpID
WHERE a.Status = 'Absent' AND a.AttDate BETWEEN '2025-11-01' AND '2025-11-30'
GROUP BY e.EmpID, e.EmpCode, e.FirstName, e.LastName
HAVING COUNT(*) > 5;
