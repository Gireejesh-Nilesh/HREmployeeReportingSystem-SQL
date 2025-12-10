-- Standardize statuses to Title case
UPDATE dbo.Attendance
SET Status = 'Present'
WHERE LOWER(Status) = 'present';

SELECT e.EmpCode, COALESCE(e.Email, 'no-email@company.com') AS EmailOrFallback
FROM dbo.Employee e;
