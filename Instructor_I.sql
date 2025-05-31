
--Created By Mohamed_Saleh 
------creste a rule to the degree column and add a default value to it
go
create rule Examdegreee as @degree between 0 and 100   --Exam dgree must be 0 to 100
go 
EXEC sp_bindrule 'Examdegreee' , 'Exam.Exam_degree'       
go
create default df_exam_degree AS 100;  --default of exam dgree 

exec sp_bindefault 'df_exam_degree', 'Exam.Exam_degree';


go
create default df_que_degree AS 5;   --Default degree column
go 
exec sp_bindefault 'df_que_degree', 'StudentAnswers.questionDegree';

-------------trigger that check the valid instructor and Exam time
go
create or alter trigger trg_ValidateInstructorAndTime
on Exam
after insert
as
begin
    SET NOCOUNT ON;
    
    declare @InvalidCreator BIT = 0
    declare @InvalidTime BIT = 0
    
    -- Check if creator is the course instructor
    select @InvalidCreator = 1
    from inserted i
    JOIN course c ON i.c_id = c.c_id
    where c.inst_id <> i.inst_id
    
    -- Check for valid time
    select @InvalidTime = 1
    from inserted
    where Exam_Stime >= Exam_Etime
    
    if @InvalidCreator = 1
    begin
        RAISERROR('Only the instructor of a course can create exams for that course.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    end
    
    if @InvalidTime = 1
    begin
        RAISERROR('Exam end time must be after start time.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    end
end

-------procedure used to add Exam data
go
create or alter procedure sp_CreateExam
    @exam_id int,
    @ExamName varchar(25),
    @ExamDate int,
    @StartTime time(7),
    @EndTime time(7),
    @ExamType varchar(40),
	@courseID int,
    @InstructorID int
as
begin
	SET NOCOUNT ON

    begin try
        begin transaction
        insert into Exam (exam_id, a_option, year, exam_type, Exam_degree, Exam_Stime, Exam_Etime, c_id, inst_id)
        values (@exam_id, @ExamName, @ExamDate, @ExamType, 90, @StartTime, @EndTime, @courseID,@InstructorID)
        commit transaction;
    end try


    begin catch
        if @@TRANCOUNT >0
            ROLLBACK TRANSACTION
			throw   
    end catch
end


EXEC sp_CreateExam    --test_case 
	@exam_id =11,
    @ExamName ='Exam',
    @ExamDate = 2025,
    @StartTime = '09:00:00',
    @EndTime = '11:00:00',
    @ExamType = 'MCQ',
	@CourseID = 1,
    @InstructorID = 1;

------------function to check which exam should the student take
go
create or alter function fn_CheckStudentExam(
          @StudentID int,
          @ExamID int 
)
returns bit
as
begin
    DECLARE @Result BIT = 0;
    
    if EXISTS (
        SELECT 1 FROM Student_Exam se join Exam e on se.exam_id= e.exam_id WHERE se.std_ID = @StudentID AND se.exam_id = @ExamID  AND (se.Result < 50 or se.Result is null)
    )
    set @Result = 1;
    
    return @Result;
end

print(dbo.fn_CheckStudentExam(1,2))  --test_case        


CREATE TYPE IDList AS TABLE (StudentID INT);
---------------add students to the exam---------------
go
create proc sp_AddStudentsToExam
    @ExamID int,
    @StudentIDs IDList readonly,
    @AllowRetakes bit = 0, 
    @InstructorID int 
as
begin

    declare @CourseID int, @ExamType varchar(25);
    begin try
        begin transaction;
      
        select @CourseID = c_id, @ExamType = a_option from Exam where exam_id = @ExamID;

        if EXISTS (
            select 1 from @StudentIDs s
            where NOT EXISTS (
                select 1 from Student_Exam se join Exam e on se.exam_id = e.exam_id where e.c_id = @CourseID AND se.std_ID = s.StudentID
            )
        )
        throw 50002, 'Error: One or more students are not enrolled in this course.', 1;

       
        if @AllowRetakes = 0
        begin
            if EXISTS (
                select 1 from @StudentIDs s
                where dbo.fn_CheckStudentExam(s.StudentID, @ExamID) = 1
            )
            throw 50003, 'Error: Some students have already taken this exam.', 1;

 ----- Block students who took the same type of exam in the course (e.g., midterms & finals)
            IF EXISTS (
                SELECT 1 FROM @StudentIDs s
                WHERE dbo.fn_CheckStudentExam(s.StudentID, @CourseID) = 1
                AND @ExamType IN ('Exam', 'Corrective')
            )
            THROW 50004, 'Error: Some students have already taken an exam of this type in the course.', 1;
        END
        
        insert into  StudentAnswers(StudentID,ExamID)
        SELECT @ExamID, s.StudentID
        FROM @StudentIDs s
        WHERE NOT EXISTS (
            SELECT 1 FROM Student_Exam WHERE exam_id = @ExamID AND std_ID = s.StudentID
        )

        declare @AddedCount int = @@ROWCOUNT;
        declare @SkippedCount int = (select COUNT(*) from @StudentIDs) - @AddedCount
        
        SELECT @AddedCount AS StudentsAdded, @SkippedCount AS StudentsSkipped, 'Success' AS Result;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        
        SELECT 0 AS StudentsAdded, 0 AS StudentsSkipped, ERROR_MESSAGE() AS Result;
    END CATCH
END;


DECLARE @Students IDList;    --Test_Case 
INSERT INTO @Students VALUES (11), (12), (13);


EXEC sp_AddStudentsToExam    --Test_Case 
    @ExamID = 5,
    @StudentIDs = @Students,
    @AllowRetakes = 0,
    @InstructorID = 3;

DECLARE @Students IDList;   --Test_Case 
INSERT INTO @Students VALUES (11), (12), (13);
EXEC sp_AddStudentsToExam
    @ExamID = 5,
    @StudentIDs = @Students,
    @AllowRetakes = 1,
    @InstructorID = 3;

------------Function to check similarity in answers
go
create function fn_CheckTextAnswer(
    @StudentAnswer varchar(MAX),
    @CorrectAnswer varchar(MAX)
)
returns decimal(3,2)
as
begin
    
    declare @Similarity decimal(3,2)
    
    if lower(trim(@StudentAnswer)) = lower(trim(@CorrectAnswer))
        set @Similarity = 1.0
    else if soundex(@StudentAnswer) = soundex(@CorrectAnswer)
        set @Similarity = 0.8
    else
        set @Similarity = 0.3
    
    return @Similarity
end

SELECT dbo.fn_CheckTextAnswer('Cairo', 'Cairo');  --Test case 


--====================
USE Examination_Sytem;
GO

CREATE PROCEDURE Insert_Question
    @que_type NVARCHAR(25),
    @b_a_answer NVARCHAR(100) = NULL,        -- Optional (for Text questions)
    @correct_answer TEXT = NULL,             -- Optional (MCQ & True/False)
    @que_test TEXT,
    @c_id INT,
    @exam_id INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewID INT;

    -- Get next available question ID
    SELECT @NewID = ISNULL(MAX(que_id), 0) + 1 FROM Question;

    -- Insert the new question
    INSERT INTO Question (que_id, que_type, b_a_answer, correct_answer, que_test, c_id, exam_id)
    VALUES (@NewID, @que_type, @b_a_answer, @correct_answer, @que_test, @c_id, @exam_id);

    -- Output confirmation
    PRINT 'Question inserted with ID = ' + CAST(@NewID AS VARCHAR);
END


EXEC Insert_Question
    @que_type = 'MCQ',
    @que_test = 'What does HTML stand for?',
    @correct_answer = 'A',
    @c_id = 4,
    @exam_id = 1;

EXEC Insert_Question
    @que_type = 'Text',
    @b_a_answer = 'Hyper Text Markup Language',
    @que_test = 'Define HTML.',
    @c_id = 4,
    @exam_id = 1;
