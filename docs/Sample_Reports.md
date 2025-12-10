1. Monthly Attendance Summary Report
Description
Summarizes Present, Absent, and Leave counts per employee for a selected month.

Generated Using:
  EXEC usp_GetMonthlyAttendanceSummary '2025-11-01';

Sample Output
| EmpID | EmployeeName | Department  | DaysPresent | DaysAbsent | DaysOnLeave |
| ----: | ------------ | ----------- | ----------: | ---------: | ----------: |
|  1001 | Amit Kumar   | Engineering |          22 |          1 |           1 |
|  1002 | Sneha Patel  | Sales       |          18 |          4 |           2 |
|  1003 | Rohan Sharma | Engineering |          23 |          0 |           2 |
|  1004 | Nisha Gupta  | HR          |          24 |          0 |           1 |
|  1005 | Vikram Reddy | Finance     |          20 |          3 |           2 |


2. Department Salary Summary Report
Description
Aggregates total salary payouts and average salaries per department.

Generated Using:
  EXEC usp_GetDepartmentSalarySummary '2025-11-01';

Sample Output
| Department  | NumEmployees | TotalGrossPay | AvgGrossPay | TotalDeductions |
| ----------- | -----------: | ------------: | ----------: | --------------: |
| Engineering |            4 |       238,000 |      59,500 |          14,000 |
| Sales       |            2 |       115,000 |      57,500 |           7,500 |
| HR          |            2 |       118,000 |      59,000 |           7,500 |
| Finance     |            1 |        42,500 |      42,500 |           1,500 |
| Support     |            1 |        38,200 |      38,200 |           1,200 |


3. Top Performer Ranking Report
Description
Shows top N employees ranked by quarterly performance scores.

Generated Using:
EXEC usp_GetTopPerformers @Year = 2025, @TopN = 5;

Sample Output
| Rank | EmpID | EmployeeName | Quarter | Score | Remarks              |
| ---: | ----: | ------------ | ------: | ----: | -------------------- |
|    1 |  1003 | Rohan Sharma |      Q3 | 92.00 | Outstanding          |
|    2 |  1008 | Meera Iyer   |      Q3 | 89.00 | Exceeds Expectations |
|    3 |  1004 | Nisha Gupta  |      Q3 | 88.50 | Exceeds Expectations |
|    4 |  1009 | Anil Verma   |      Q3 | 85.50 | Strong performer     |
|    5 |  1001 | Amit Kumar   |      Q3 | 78.50 | Meets Expectations   |


4. Late Arrival Report
Description
Lists employees who checked in after office start time (09:30 AM).

Generated Using:
SELECT ...
WHERE CheckInTime > '09:30:00';

Sample Output
| Date       | EmpCode | EmployeeName | CheckInTime |
| ---------- | ------- | ------------ | ----------- |
| 2025-11-02 | EMP1002 | Sneha Patel  | 09:50:00    |
| 2025-11-01 | EMP1010 | Ritika Roy   | 09:40:00    |

5. Monthly Headcount Trend Report
Description
Shows the number of active employees per month.

Sample Output
| Month    | ActiveEmployees |
| -------- | --------------: |
| Jan 2025 |               8 |
| Feb 2025 |               9 |
| Mar 2025 |              10 |
| Apr 2025 |              10 |
| May 2025 |              10 |
