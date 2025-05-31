--------  on server 
use Examination_Sytem
go 
CREATE LOGIN [Training Manager] WITH PASSWORD = '123478';  -- Create Login for Training Manager
go 
CREATE LOGIN [Student] WITH PASSWORD = '123489';           -- Create Login for Student
go 
CREATE LOGIN [Instructor] WITH PASSWORD = '123410';        -- Create Login for Instructor

--------  on database
USE Examination_Sytem;
GO
CREATE USER [Training Manager] FOR LOGIN [Training Manager];
go
CREATE USER [Student] FOR LOGIN [Student];
go
CREATE USER [Instructor] FOR LOGIN [Instructor];

-------
