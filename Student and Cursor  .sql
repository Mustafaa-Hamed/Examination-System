--created by Mahmoud 
CREATE view VStudentExam as
select
  std_ID,
  exam_id,
  count(*) as attempt_count
from
  Student_Exam
group by
  std_ID,
  exam_id;

--================================ check student exam ==================================================

select * from VStudentExam;
------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------ 
 
CREATE view VExam_Results as
select
  s.std_ID,
  s.std_Fname,
  s.std_Lname,
  se.exam_id,

  Result as exam_degree
from
  Student s  join  Student_Exam se 
  ON s.std_ID = se.std_ID;


  --============================== student discover degree of exam ====================================

select *  
from VExam_Results
  
---------------------------------- 
-----Cursors 
----------------------------------
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


