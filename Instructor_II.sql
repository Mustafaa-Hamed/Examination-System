--Created By Ahmed Hesham 
use Examination_Sytem
go
-------------creating exam SP------------------------------------
CREATE OR ALTER PROC AddQuestions
	@NewExamID INT,
    @CourseID INT,
    @InstructorID INT,
    @ExamType VARCHAR(50),
    @ExamDegree INT,
    @StartTime TIME,
    @EndTime TIME,
    @TotalTime TIME,
    @NumQuestions INT
AS
BEGIN
    DECLARE @ExamID INT

    INSERT INTO Exam (exam_id, a_option, year, exam_type, Exam_degree, Exam_Stime, Exam_Etime, total_time, c_id, inst_id)
    VALUES (@NewExamID,'Exam', YEAR(GETDATE()), @ExamType, @ExamDegree, @StartTime, @EndTime, @TotalTime, @CourseID, @InstructorID)

	SELECT TOP 1 @ExamID = exam_id 
	FROM Exam 
	ORDER BY exam_id DESC;

    UPDATE TOP (@NumQuestions) Question
    SET exam_id = @ExamID
    WHERE c_id = @CourseID AND exam_id IS NULL
END
go
----------------------Test Case--------------------
---To work, some of exam_id at Question should be 'NULL'-----------
----------------------------
EXEC AddQuestions      
	@NewExamID=127163,
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

---------------------------setting degree on each question sp-----------------
CREATE OR ALTER PROC SetQuestionDegree
    @ExamID INT,
    @QuestionID INT,
    @Degree INT
AS
BEGIN
    UPDATE StudentAnswers
    SET questionDegree = @Degree
    WHERE ExamID = @ExamID AND QuestionID = @QuestionID;
END;
go
------------------------Test case---------------
EXEC SetQuestionDegree @ExamID = 2, @QuestionID = 1, @Degree = 5;
go
---------------After answering in 'StudentAnswers' table-----------------
-------------------------------setting total degree------------------------------------
CREATE PROC UpdateStudentResult
    @StudentID INT,
    @ExamID INT
AS
BEGIN
    DECLARE @TotalScore INT

    SELECT @TotalScore = SUM(ISNULL(Score, 0))
    FROM StudentAnswers
    WHERE StudentID = @StudentID AND ExamID = @ExamID

    UPDATE Student_Exam
    SET Result = @TotalScore
    WHERE std_ID = @StudentID AND exam_id = @ExamID
END


EXEC UpdateStudentResult  --test case 
      @StudentID = 1,
      @ExamID = 3;