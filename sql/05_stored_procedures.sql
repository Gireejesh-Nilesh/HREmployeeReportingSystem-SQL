-- Stored procedure: Get monthly attendance summary for a department
CREATE OR ALTER PROCEDURE dbo.usp_GetMonthlyAttendanceSummary
    @MonthStart DATE,   -- e.g. '2025-11-01'
    @DeptID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        d.DeptName,
        e.EmpID,
        e.EmpCode,
        e.FirstName + ' ' + ISNULL(e.LastName,'') AS EmployeeName,
        COUNT(CASE WHEN a.Status='Present' THEN 1 END) AS DaysPresent,
        COUNT(CASE WHEN a.Status='Absent' THEN 1 END) AS DaysAbsent,
        COUNT(CASE WHEN a.Status='Leave' THEN 1 END) AS DaysOnLeave
    FROM dbo.Employee e
    JOIN dbo.Department d ON e.DeptID = d.DeptID
    LEFT JOIN dbo.Attendance a ON e.EmpID = a.EmpID AND a.AttDate >= @MonthStart AND a.AttDate < DATEADD(MONTH,1,@MonthStart)
    WHERE (@DeptID IS NULL OR e.DeptID = @DeptID)
    GROUP BY d.DeptName, e.EmpID, e.EmpCode, e.FirstName, e.LastName
    ORDER BY d.DeptName, e.FirstName;
END;
GO

-- Stored procedure: Get salary summary by department
CREATE OR ALTER PROCEDURE dbo.usp_GetDepartmentSalarySummary
    @SalaryMonth DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        d.DeptName,
        COUNT(s.EmpID) AS NumEmployees,
        SUM(s.Basic + s.HRA + s.OtherAllowances) AS TotalGrossPay,
        AVG(s.Basic + s.HRA + s.OtherAllowances) AS AvgGrossPay,
        SUM(s.Deductions) AS TotalDeductions
    FROM dbo.Salary s
    JOIN dbo.Employee e ON s.EmpID = e.EmpID
    JOIN dbo.Department d ON e.DeptID = d.DeptID
    WHERE s.SalaryMonth = @SalaryMonth
    GROUP BY d.DeptName
    ORDER BY TotalGrossPay DESC;
END;
GO

-- Procedure: Get top performers across quarters
CREATE OR ALTER PROCEDURE dbo.usp_GetTopPerformers
    @Year INT,
    @TopN INT = 5
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (@TopN)
        p.EmpID,
        e.FirstName + ' ' + ISNULL(e.LastName,'') AS EmployeeName,
        p.PerfYear, p.PerfQuarter, p.Score
    FROM dbo.Performance p
    JOIN dbo.Employee e ON p.EmpID = e.EmpID
    WHERE p.PerfYear = @Year
    ORDER BY p.Score DESC;
END;
GO
