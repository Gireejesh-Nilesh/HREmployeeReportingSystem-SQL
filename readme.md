# HR Employee Management Reporting System

## Overview

This project simulates an HR reporting module used by companies to track employee attendance, salary summaries, and performance metrics.
It features a fully normalized SQL schema plus stored procedures for analytical reporting.

## Database Features

- Employee Management
  Stores employee master data with roles, departments, and joining history.

- Attendance Tracking
  Captures daily attendance logs including check-in/check-out times.

- Salary Module
  Stores monthly salary breakdowns (basic, HRA, allowances, deductions).

- Performance Analytics
  Stores quarterly performance scores for ranking & evaluation.

## Main SQL Concepts Used

CREATE TABLE with constraints

INNER/LEFT/FULL joins

Aggregations (SUM, COUNT, AVG)

HAVING filters

CTEs & window functions (ROW_NUMBER, RANK, LAG)

Views for reporting

Stored procedures for reusable reports

QA data validation queries

## Key Stored Procedures

Procedure Description
usp_GetMonthlyAttendanceSummary Returns Present/Absent/Leave summary per employee
usp_GetDepartmentSalarySummary Salary breakdown by department
usp_GetTopPerformers Returns top N performers for selected year

## Sample Reports

Monthly attendance report

Department salary distribution

Top performer analytics

Late arrival logs

Headcount trend report

Stored procedure sample outputs are included in the /reports folder.

## Project Structure

sql/
01_create_database.sql
02_create_tables.sql
03_insert_sample_data.sql
04_views.sql
05_stored_procedures.sql
06_reporting_queries.sql
07_QA_validation_queries.sql

docs/
ER_Diagram.png
Data_Dictionary.md
Sample_Reports.md

reports/
\*.csv

## How to Run

1. Open SSMS
2. Run all scripts in sql/ in ascending numeric order
3. Execute stored procedures to generate reports

Example:
EXEC usp_GetMonthlyAttendanceSummary '2025-11-01';

## Learning Outcomes

You will learn:

How HR systems manage data

How to generate advanced SQL reports

How to validate and clean data

How to document a full data project
