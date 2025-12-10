-- Departments
INSERT INTO dbo.Department (DeptName) VALUES
('HR'),('Finance'),('Engineering'),('Sales'),('Support');

-- Employees
INSERT INTO dbo.Employee (EmpCode, FirstName, LastName, DeptID, Designation, DateOfJoining, Email)
VALUES
('EMP1001','Amit','Kumar',3,'Software Engineer','2022-01-15','amit.kumar@example.com'),
('EMP1002','Sneha','Patel',4,'Sales Executive','2021-07-10','sneha.patel@example.com'),
('EMP1003','Rohan','Sharma',3,'Senior Developer','2020-03-05','rohan.sharma@example.com'),
('EMP1004','Nisha','Gupta',1,'HR Manager','2019-11-01','nisha.gupta@example.com'),
('EMP1005','Vikram','Reddy',2,'Accountant','2023-06-20','vikram.reddy@example.com'),
('EMP1006','Priya','Nair',3,'QA Engineer','2021-12-02','priya.nair@example.com'),
('EMP1007','Karan','Singh',5,'Support Engineer','2020-09-18','karan.singh@example.com'),
('EMP1008','Meera','Iyer',4,'Sales Manager','2018-05-21','meera.iyer@example.com'),
('EMP1009','Anil','Verma',3,'DevOps Engineer','2019-02-14','anil.verma@example.com'),
('EMP1010','Ritika','Roy',1,'HR Executive','2024-01-10','ritika.roy@example.com');

-- Salary (store month as first-of-month)
INSERT INTO dbo.Salary (EmpID, SalaryMonth, Basic, HRA, OtherAllowances, Deductions)
VALUES
(1001,'2025-11-01',45000,8000,2000,3000),
(1002,'2025-11-01',30000,5000,1500,1500),
(1003,'2025-11-01',75000,12000,4000,5000),
(1004,'2025-11-01',90000,15000,5000,7000),
(1005,'2025-11-01',35000,6000,1500,1000),
(1006,'2025-11-01',42000,7000,2000,2000),
(1007,'2025-11-01',32000,5000,1200,1200),
(1008,'2025-11-01',85000,14000,4500,6000),
(1009,'2025-11-01',65000,11000,3000,4000),
(1010,'2025-11-01',28000,4000,1000,500);

-- Attendance for a sample month (Nov 2025) - partial set
INSERT INTO dbo.Attendance (EmpID, AttDate, CheckInTime, CheckOutTime, Status)
VALUES
(1001,'2025-11-01','09:05:00','18:00:00','Present'),
(1002,'2025-11-01','09:30:00','17:45:00','Present'),
(1003,'2025-11-01','08:55:00','17:30:00','Present'),
(1004,'2025-11-01','09:10:00','18:10:00','Present'),
(1005,'2025-11-01',NULL,NULL,'Leave'),
(1006,'2025-11-01','09:00:00','18:00:00','Present'),
(1007,'2025-11-01','09:50:00','17:40:00','Present'),
(1008,'2025-11-01','08:30:00','18:20:00','Present'),
(1009,'2025-11-01','09:15:00','18:05:00','Present'),
(1010,'2025-11-01','09:40:00','17:50:00','Present'),

(1001,'2025-11-02','09:10:00','18:05:00','Present'),
(1002,'2025-11-02',NULL,NULL,'Absent'),
(1003,'2025-11-02','09:00:00','18:00:00','Present'),
(1004,'2025-11-02','09:12:00','18:07:00','Present'),
(1005,'2025-11-02','09:20:00','17:55:00','Present'),
(1006,'2025-11-02','09:03:00','17:59:00','Present'),
(1007,'2025-11-02','09:52:00','17:43:00','Present'),
(1008,'2025-11-02','08:35:00','18:22:00','Present'),
(1009,'2025-11-02','09:20:00','18:10:00','Present'),
(1010,'2025-11-02','09:42:00','17:45:00','Present');

-- Performance sample
INSERT INTO dbo.Performance (EmpID, PerfYear, PerfQuarter, Score, Remarks)
VALUES
(1001,2025,3,78.5,'Meets expectations'),
(1003,2025,3,92.0,'Outstanding'),
(1004,2025,3,88.5,'Exceeds expectations'),
(1006,2025,3,81.0,'Meets expectations'),
(1008,2025,3,89.0,'Exceeds expectations'),
(1009,2025,3,85.5,'Strong performer');
GO
