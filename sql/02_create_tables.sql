CREATE TABLE dbo.Department (
    DeptID INT IDENTITY(1,1) PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE dbo.Employee (
    EmpID INT IDENTITY(1001,1) PRIMARY KEY,
    EmpCode VARCHAR(20) NOT NULL UNIQUE,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NULL,
    DeptID INT NOT NULL,
    Designation VARCHAR(100),
    DateOfJoining DATE NOT NULL,
    Email VARCHAR(150),
    IsActive BIT DEFAULT 1,
    CONSTRAINT FK_Employee_Department FOREIGN KEY (DeptID) REFERENCES dbo.Department(DeptID)
);

CREATE TABLE dbo.Salary (
    SalaryID INT IDENTITY(1,1) PRIMARY KEY,
    EmpID INT NOT NULL,
    SalaryMonth DATE NOT NULL, -- store as first day of month
    Basic DECIMAL(18,2) NOT NULL,
    HRA DECIMAL(18,2) NOT NULL,
    OtherAllowances DECIMAL(18,2) DEFAULT 0,
    Deductions DECIMAL(18,2) DEFAULT 0,
    CONSTRAINT FK_Salary_Employee FOREIGN KEY (EmpID) REFERENCES dbo.Employee(EmpID)
);

CREATE TABLE dbo.Attendance (
    AttendanceID INT IDENTITY(1,1) PRIMARY KEY,
    EmpID INT NOT NULL,
    AttDate DATE NOT NULL,
    CheckInTime TIME NULL,
    CheckOutTime TIME NULL,
    Status VARCHAR(20) NOT NULL, -- Present/Absent/Leave
    CONSTRAINT UQ_Attendance_EmpDate UNIQUE (EmpID, AttDate),
    CONSTRAINT FK_Attendance_Employee FOREIGN KEY (EmpID) REFERENCES dbo.Employee(EmpID)
);

CREATE TABLE dbo.Performance (
    PerfID INT IDENTITY(1,1) PRIMARY KEY,
    EmpID INT NOT NULL,
    PerfYear INT NOT NULL,
    PerfQuarter TINYINT NOT NULL,
    Score DECIMAL(5,2) NOT NULL, -- 0-100
    Remarks VARCHAR(500),
    CONSTRAINT FK_Performance_Employee FOREIGN KEY (EmpID) REFERENCES dbo.Employee(EmpID)
);
GO
