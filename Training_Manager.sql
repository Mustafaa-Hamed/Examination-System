--Created By Nada Mohamed Zohny 
-- Login procedure
CREATE PROCEDURE sp_TrainingManagerLogin
    @username NVARCHAR(25),
    @password NVARCHAR(15)
AS
BEGIN
    SELECT u.acc_ID, u.user_name, tm.mng_id, tm.mng_fname, tm.mng_lname
    FROM [user] u
    JOIN Training_Manager tm ON u.acc_ID = tm.account_id
    WHERE u.user_name = @username 
    AND u.password = @password
    AND u.role = 'Training Manager';
END;

----------------------------------------
--Branch Management PROCEDURE
-- Add new branch
CREATE PROCEDURE sp_AddBranch
    @branch_id INT,
    @branch_name NVARCHAR(30),
    @mng_id INT,
    @int_id INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Branch (branch_id, branch_name, mng_id, int_id)
        VALUES (@branch_id, @branch_name, @mng_id, @int_id);
        SELECT 'Branch added successfully' AS Result;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS Error;
    END CATCH
END;

-- Update branch
CREATE PROCEDURE sp_UpdateBranch
    @branch_id INT,
    @branch_name NVARCHAR(30),
    @mng_id INT,
    @int_id INT
AS
BEGIN
    BEGIN TRY
        UPDATE Branch
        SET branch_name = @branch_name,
            mng_id = @mng_id,
            int_id = @int_id
        WHERE branch_id = @branch_id;
        
        SELECT 'Branch updated successfully' AS Result;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS Error;
    END CATCH
END;

-- View all branches
CREATE VIEW vw_BranchesWithDetails AS
SELECT b.branch_id, b.branch_name, 
       t.mng_id, t.mng_fname + ' ' + t.mng_lname AS manager_name,
       i.int_ID, i.int_name
FROM Branch b
JOIN Training_Manager t ON b.mng_id = t.mng_id
JOIN Intake i ON b.int_id = i.int_ID;

----------------------------------
--Track Management procedures
-- Add new track
CREATE PROCEDURE sp_AddTrack
    @track_id INT,
    @track_name NVARCHAR(100),
    @dept_id INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Traack (track_id, track_name, dept_id)
        VALUES (@track_id, @track_name, @dept_id);
        SELECT 'Track added successfully' AS Result;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS Error;
    END CATCH
END;

-- Update track
CREATE PROCEDURE sp_UpdateTrack
    @track_id INT,
    @track_name NVARCHAR(100),
    @dept_id INT
AS
BEGIN
    BEGIN TRY
        UPDATE Traack
        SET track_name = @track_name,
            dept_id = @dept_id
        WHERE track_id = @track_id;
        
        SELECT 'Track updated successfully' AS Result;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS Error;
    END CATCH
END;

-- View all tracks with department info
CREATE VIEW vw_TracksWithDepartments AS
SELECT t.track_id, t.track_name, 
       d.dept_id, d.dept_name
FROM Traack t
JOIN Department d ON t.dept_id = d.dept_id;
----------------------------------
--Intake Management PROCEDURE
-- Add new intake
CREATE or alter  PROCEDURE sp_AddIntake
    @int_ID INT,
    @int_name NVARCHAR(20),
    @s_date DATE,
    @e_date DATE
AS
BEGIN
    BEGIN TRY
        INSERT INTO Intake (int_ID, int_name, s_date, e_date)
        VALUES (@int_ID, @int_name, @s_date, @e_date);
        SELECT 'Intake added successfully' AS Result;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS Error;
    END CATCH
END;

-- Update intake
CREATE PROCEDURE sp_UpdateIntake
    @int_ID INT,
    @int_name NVARCHAR(20),
    @s_date DATE,
    @e_date DATE
AS
BEGIN
    BEGIN TRY
        UPDATE Intake
        SET int_name = @int_name,
            s_date = @s_date,
            e_date = @e_date
        WHERE int_ID = @int_ID;
        
        SELECT 'Intake updated successfully' AS Result;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS Error;
    END CATCH
END;

-- View all intakes
CREATE VIEW vw_AllIntakes AS
SELECT int_ID, int_name, s_date, e_date
FROM Intake;

----------------------------------------------
--Student Management procedures
-- Add new student
CREATE or alter  PROCEDURE sp_AddStudent
    @std_ID INT,
    @std_Fname NVARCHAR(20),
    @std_Lname NVARCHAR(20),
    @GPA FLOAT,
    @enrol_date DATE,
    @DOB DATE,
    @int_ID INT,
    @acc_ID INT,
    @track_id INT,
    @branch_id INT
AS
BEGIN
    BEGIN TRY
        -- First create user account
        INSERT INTO [user] (acc_ID, user_name, password, role)
        VALUES (@acc_ID, LOWER(@std_Fname), 'default123', 'student');
        
        -- Then create student record
        INSERT INTO Student (std_ID, std_Fname, std_Lname, GPA, enrol_date, DOB, int_ID, acc_ID, track_id, branch_id)
        VALUES (@std_ID, @std_Fname, @std_Lname, @GPA, @enrol_date, @DOB, @int_ID, @acc_ID, @track_id, @branch_id);
        
        SELECT 'Student added successfully' AS Result;
    END TRY
    BEGIN CATCH
        -- Rollback if error occurs
        IF @@TRANCOUNT > 0
            ROLLBACK;
        SELECT ERROR_MESSAGE() AS Error;
    END CATCH
END;

-- Update student information
CREATE PROCEDURE sp_UpdateStudent
    @std_ID INT,
    @std_Fname NVARCHAR(20),
    @std_Lname NVARCHAR(20),
    @GPA FLOAT,
    @DOB DATE,
    @int_ID INT,
    @track_id INT,
    @branch_id INT
AS
BEGIN
    BEGIN TRY
        UPDATE Student
        SET std_Fname = @std_Fname,
            std_Lname = @std_Lname,
            GPA = @GPA,
            DOB = @DOB,
            int_ID = @int_ID,
            track_id = @track_id,
            branch_id = @branch_id
        WHERE std_ID = @std_ID;
        
        SELECT 'Student updated successfully' AS Result;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS Error;
    END CATCH
END;

-- Add/update student phone numbers
CREATE PROCEDURE sp_ManageStudentPhone
    @std_ID INT,
    @Phone_Number CHAR(11),
    @action VARCHAR(10) -- 'ADD' or 'DELETE'
AS
BEGIN
    BEGIN TRY
        IF @action = 'ADD'
        BEGIN
            INSERT INTO Student_phone (std_ID, Phone_Number)
            VALUES (@std_ID, @Phone_Number);
            SELECT 'Phone number added successfully' AS Result;
        END
        ELSE IF @action = 'DELETE'
        BEGIN
            DELETE FROM Student_phone 
            WHERE std_ID = @std_ID AND Phone_Number = @Phone_Number;
            SELECT 'Phone number deleted successfully' AS Result;
        END
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS Error;
    END CATCH
END;

-- View all students with details
CREATE VIEW vw_StudentsWithDetails AS
SELECT s.std_ID, s.std_Fname, s.std_Lname, s.GPA, s.enrol_date, s.DOB,
       t.track_name, d.dept_name,
       b.branch_name, i.int_name,
       u.user_name
FROM Student s
JOIN Traack t ON s.track_id = t.track_id
JOIN Department d ON t.dept_id = d.dept_id
JOIN Branch b ON s.branch_id = b.branch_id
JOIN Intake i ON s.int_ID = i.int_ID
JOIN [user] u ON s.acc_ID = u.acc_ID;
-------------------------------------------
--Comprehensive Reports for Training Manager
-- Student count by branch
CREATE VIEW vw_StudentCountByBranch AS
SELECT b.branch_name, COUNT(s.std_ID) AS student_count
FROM Branch b
LEFT JOIN Student s ON b.branch_id = s.branch_id
GROUP BY b.branch_name;
go
-- Student count by track
CREATE VIEW vw_StudentCountByTrack AS
SELECT t.track_name, COUNT(s.std_ID) AS student_count
FROM Traack t
LEFT JOIN Student s ON t.track_id = s.track_id
GROUP BY t.track_name;
go
-- Student count by intake
CREATE VIEW vw_StudentCountByIntake AS
SELECT i.int_name, COUNT(s.std_ID) AS student_count
FROM Intake i
LEFT JOIN Student s ON i.int_ID = s.int_ID
GROUP BY i.int_name;
go 
-- Average GPA by branch and track
CREATE VIEW vw_AvgGPAByBranchTrack AS
SELECT b.branch_name, t.track_name, AVG(s.GPA) AS avg_gpa
FROM Student s
JOIN Branch b ON s.branch_id = b.branch_id
JOIN Traack t ON s.track_id = t.track_id
GROUP BY b.branch_name, t.track_name;

----------------------------------------
--Security
-- Create role for Training Manager
CREATE ROLE TrainingManagerRole;

-- Grant permissions to the role
GRANT EXECUTE ON sp_TrainingManagerLogin TO TrainingManagerRole;
GRANT EXECUTE ON sp_AddBranch TO TrainingManagerRole;
GRANT EXECUTE ON sp_UpdateBranch TO TrainingManagerRole;
GRANT SELECT ON vw_BranchesWithDetails TO TrainingManagerRole;
GRANT EXECUTE ON sp_AddTrack TO TrainingManagerRole;
GRANT EXECUTE ON sp_UpdateTrack TO TrainingManagerRole;
GRANT SELECT ON vw_TracksWithDepartments TO TrainingManagerRole;
GRANT EXECUTE ON sp_AddIntake TO TrainingManagerRole;
GRANT EXECUTE ON sp_UpdateIntake TO TrainingManagerRole;
GRANT SELECT ON vw_AllIntakes TO TrainingManagerRole;
GRANT EXECUTE ON sp_AddStudent TO TrainingManagerRole;
GRANT EXECUTE ON sp_UpdateStudent TO TrainingManagerRole;
GRANT EXECUTE ON sp_ManageStudentPhone TO TrainingManagerRole;
GRANT SELECT ON vw_StudentsWithDetails TO TrainingManagerRole;
GRANT SELECT ON vw_StudentCountByBranch TO TrainingManagerRole;
GRANT SELECT ON vw_StudentCountByTrack TO TrainingManagerRole;
GRANT SELECT ON vw_StudentCountByIntake TO TrainingManagerRole;
GRANT SELECT ON vw_AvgGPAByBranchTrack TO TrainingManagerRole;
go 
-- Assign users to the role (example for one manager)
EXEC sp_addrolemember 'TrainingManagerRole', 'Mostafa';    --Test_Case


===========================================================================================

--Usage Examples
--1-Login as training Manager

EXEC sp_TrainingManagerLogin @username = 'Mostafa', @password = '1234';

--2-Add new Branch
EXEC sp_AddBranch 
    @branch_id = 21, 
    @branch_name = 'New City', 
    @mng_id = 1, 
    @int_id = 45;
	
--3-Update a student's information:
EXEC sp_UpdateStudent 
    @std_ID = 1,
    @std_Fname = 'Mohamed',
    @std_Lname = 'Ahmed',
    @GPA = 3.7,
    @DOB = '2000-05-15',
    @int_ID = 45,
    @track_id = 1,
    @branch_id = 1;

--4-View all students with details
SELECT * FROM vw_StudentsWithDetails;

--5-Get StudentCount by branch
SELECT * FROM vw_StudentCountByBranch;