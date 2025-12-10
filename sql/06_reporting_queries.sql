USE HRReporting;
GO
-- Example for Nov 2025
EXEC dbo.usp_GetMonthlyAttendanceSummary @MonthStart = '2025-11-01';

EXEC dbo.usp_GetDepartmentSalarySummary @SalaryMonth = '2025-11-01';

EXEC dbo.usp_GetTopPerformers @Year = 2025, @TopN = 5;

SELECT 
    a.AttDate,
    e.EmpCode,
    e.FirstName + ' ' + ISNULL(e.LastName,'') AS EmployeeName,
    a.CheckInTime
FROM dbo.Attendance a
JOIN dbo.Employee e ON a.EmpID = e.EmpID
WHERE a.Status = 'Present' AND a.CheckInTime > '09:30:00'
ORDER BY a.AttDate, a.CheckInTime;


;WITH Months AS (
    SELECT CAST('2025-01-01' AS DATE) AS MonthStart
    UNION ALL
    SELECT DATEADD(MONTH, 1, MonthStart) FROM Months WHERE MonthStart < '2025-12-01'
)
SELECT 
    m.MonthStart,
    COUNT(e.EmpID) AS ActiveEmployees
FROM Months m
LEFT JOIN dbo.Employee e
    ON e.DateOfJoining < DATEADD(MONTH, 1, m.MonthStart) -- employees joined on or before last day of month
    AND e.IsActive = 1
GROUP BY m.MonthStart
ORDER BY m.MonthStart
OPTION (MAXRECURSION 0);
