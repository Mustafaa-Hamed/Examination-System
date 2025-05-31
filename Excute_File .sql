--- Accounts Permissions (Training Manager File + Wizrd)              

---Make Indexed  Database (Index File)  
--Backup:  --Full Back up every 10 monthes                                 
		   --Daily Back up    (Automatically) 


---Instructor::  BY-Mohamed Saleh 
      --can set question in question table  
EXEC Insert_Question
    @que_type = 'MCQ',
    @que_test = 'What does CSS stand for?',
    @correct_answer = 'A',
    @c_id = 4,
    @exam_id = 1;

EXEC Insert_Question
    @que_type = 'Text',
    @b_a_answer = 'Hyper Text Markup Language',
    @que_test = 'Define HTML.',
    @c_id = 4,
    @exam_id = 1;

	  --------
EXEC sp_CreateExam    --test_case 
	@exam_id =19,
    @ExamName ='Exam',
    @ExamDate = 2025,
    @StartTime = '09:00:00',
    @EndTime = '11:00:00',
    @ExamType = 'MCQ',
	@CourseID = 1,
    @InstructorID = 1;
-----
--Corrective 
print(dbo.fn_CheckStudentExam(1,2))  --test_case    

---
--Check Similirty 
SELECT dbo.fn_CheckTextAnswer('Cairo', 'Cairo');  --Test case 
go
SELECT dbo.fn_CheckTextAnswer('Cair', 'Cairo');  --Test case 
go
SELECT dbo.fn_CheckTextAnswer('alex ', 'Cairo');  --Test case 



EXEC AddQuestions      
	@NewExamID=127763,
    @CourseID = 4,
    @InstructorID = 4,
    @ExamType = 'MCQ',
    @ExamDegree = 60,
    @StartTime = '10:00:00',
    @EndTime = '11:00:00',
    @TotalTime = '01:00:00',
    @NumQuestions = 3;

	SELECT * FROM Exam WHERE exam_id=(SELECT TOP 1 exam_id FROM Exam ORDER BY exam_id DESC);
	go


----to set degree 
EXEC SetQuestionDegree @ExamID = 2, @QuestionID = 1, @Degree = 5;


-- update studet result 
EXEC UpdateStudentResult  --test case 
    @StudentID = 1,
    @ExamID = 3;

	-----------=================

-------------------count of exam for each student 
select * from VStudentExam;
 
--------------------to select dgrees 
select *  
from VExam_Results
  

DECLARE -- Declare variables for each column

    @std_ID INT,
    @std_Fname NVARCHAR(50),
    @std_Lname NVARCHAR(50),
    @exam_id INT,
    @exam_degree INT;

DECLARE exam_result_cursor    -- Dclare Cursor 
CURSOR FOR   
SELECT
    s.std_ID,
    s.std_Fname,
    s.std_Lname,
    se.exam_id,
    se.Result AS exam_degree

FROM  Student s JOIN Student_Exam se 
                    ON s.std_ID = se.std_ID;

OPEN exam_result_cursor;  -- Open the cursor

	FETCH NEXT 
	FROM exam_result_cursor INTO     -- Fetch the first row
		 @std_ID, @std_Fname, @std_Lname, @exam_id, @exam_degree;


WHILE @@FETCH_STATUS = 0    -- Loop through the results
BEGIN
    -- Print the current row (you can change this to INSERT or other logic)
    PRINT 'Student ID: ' + CAST(@std_ID AS VARCHAR) +
          ', Name: ' + @std_Fname + ' ' + @std_Lname +
          ', Exam ID: ' + CAST(@exam_id AS VARCHAR) +
          ', Degree: ' + CAST(@exam_degree AS VARCHAR);

    -- Fetch next row
    FETCH NEXT 
	FROM exam_result_cursor INTO 
        @std_ID, @std_Fname, @std_Lname, @exam_id, @exam_degree;
END

-- Close and deallocate the cursor
CLOSE exam_result_cursor;
DEALLOCATE exam_result_cursor;

------------------------------------------------
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