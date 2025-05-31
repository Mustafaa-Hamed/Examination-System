--created by Mostafa Hamed
USE Examination_Sytem
GO
--Non-Clustered_Indexes

CREATE NONCLUSTERED INDEX Index_Student_TrackID  --Student by track_id
		ON Student(track_id)   

CREATE NONCLUSTERED INDEX Index_Student_BranchID  --Student by branch_id
		ON Student(branch_id)

--------------------------------------------------------------
---------------
-----------------------unique Index-----------------------------------------
IF NOT EXISTS (                         
    SELECT * FROM sys.indexes 
    WHERE name = 'UQ_Instructor_NID' 
      AND object_id = OBJECT_ID('Instructor')
)
BEGIN
    CREATE UNIQUE NONCLUSTERED INDEX Uniqe_Instructor_NID    --unique Index
    ON Instructor(nid)                                       --to insure that instructur cannot be dublicated 
END

--------------------------------------------------------------
---------------
--------------------------------------------------------------