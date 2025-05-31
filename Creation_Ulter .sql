Create Database Examination_Sytem 
go 

CREATE TABLE Student (  --Created by Nada 
  std_ID int ,
  std_Fname nvarchar(20),
  std_Lname nvarchar(20),
  GPA float,
  enrol_date date,
  DOB date,
  int_ID int,
  acc_ID int UNIQUE,
  track_id int,
  branch_id int
constraint Student_PK primary key  (std_ID)
)


GO
CREATE TABLE Student_phone (  --Created by Nada
  std_ID int,
  Phone_Number char(11),
  constraint Student_phone_PK primary key  (std_ID,Phone_Number)
)
  
GO
CREATE TABLE Student_Exam (  --Created by Mahmoud 
  std_ID int,
  exam_id int,
  Result nvarchar(255),
  constraint Student_Exam_PK primary key  (std_ID, exam_id),
)

GO
CREATE TABLE Intake (     --Created by Mostafa
  int_ID  int ,
  int_name nvarchar(20),
  s_date  date,
  e_date   date,
  constraint Intake_PK primary key  (int_ID),
)



CREATE TABLE [Traack] (      --Created by Mostafa
  track_id int,
  track_name nvarchar(50),
  dept_id int,
  constraint Track primary key (track_id),
)



GO
CREATE TABLE Department (    --Created by Mostafa 
  dept_id int ,
  dept_name nvarchar(50),
   constraint Department_PK primary key (dept_id)

)


GO
CREATE TABLE Branch (      ----Created by Ahmed 
  branch_id int ,
  branch_name nvarchar(30),
  mng_id int,
  int_id int,
  constraint Branch_PK primary key (branch_id),
)


Go 
CREATE TABLE [Branch_Track_Intake] (  --Created by Mahmoud 
  track_id int,
  branch_id int,
  int_ID int,
  constraint Branch_Track_Intake_Pk PRIMARY KEY (track_id, branch_id, int_ID)
)



GO
CREATE TABLE Training_Manager (   ----Created by Ahmed
  mng_id int,
  mng_fname   nvarchar(20),
  mng_lname   nvarchar(20),
  mng_email   nvarchar(35),
  account_id  int,
  constraint Training_Manager_PK PRIMARY KEY (mng_id)
)



GO
CREATE TABLE [user] (      --Created by Mostafa
  acc_ID int ,
  user_name   nvarchar(25),
  password    nvarchar(15),
  role        nvarchar(25),
  constraint user_PK PRIMARY KEY (acc_ID)
)


GO
CREATE TABLE Instructor (     --Created by Ahmed 
  inst_id int,
  inst_fname nvarchar(25),
  inst_lname nvarchar(25),
  nid char UNIQUE,
  year_o_experince int,
  ints_email nvarchar(35),
  hire_date date,
  city nvarchar(25),
  street nvarchar(25),
  specialization nvarchar(25),
  acc_id int,
  constraint Instructor_PK PRIMARY KEY (inst_id)
)



GO
CREATE TABLE Instructor_Phone (      --Created by Nada
  inst_id int,
  phone nvarchar(35),
  constraint Instructor_Phone_PK PRIMARY KEY (inst_id,phone)
)



GO
CREATE TABLE course(      --Created by Ahmed 
  c_id int,
  c_name nvarchar(25),
  description nvarchar(25),
  min_degree int,
  max_degree int,
  constraint course_PK PRIMARY KEY (c_id)
)


GO
CREATE TABLE Instructor_Course (     --Created by Nada 
  inst_id int,
  c_id int,
  constraint Instructor_Course_PK PRIMARY KEY (inst_id , c_id)
)



GO
CREATE TABLE Exam (    -----Created by Mahmoud 
  exam_id int,
  a_option nvarchar(25),
  year int,
  exam_type nvarchar(40),
  Exam_degree float,
  Exam_Stime time,
  Exam_Etime time,
  total_time time,
  c_id int,
  inst_id int,
 constraint Exam_PK PRIMARY KEY (exam_id)
)



GO
CREATE TABLE Intake_Exam (   ----Created by Mahmoud 
  int_id int,
  exam_id int,
  constraint Intake_Exam_PK PRIMARY KEY (int_id,exam_id)
)


GO
CREATE TABLE Track_Course (     --Created by Mahmoud 
  track_id int,
  course_id int,
  constraint Track_Course_PK PRIMARY KEY (track_id , course_id )
)


GO
CREATE TABLE Question (   --reated by Mohamed Saleh 
  que_id int,
  que_type nvarchar(25),
  b_a_answer nvarchar(100),
  correct_answer text,
  que_test text,
  c_id int,
  exam_id int,
  constraint Question_PK PRIMARY KEY (que_id)
)


GO
CREATE TABLE MCQ (    --Created by Mohamed Saleh 
  mcq_id int,
  que_id int,
  [A] nvarchar(5),
  [B] nvarchar(5),
  [C] nvarchar(5),
  [D] nvarchar(5),
    constraint MCQ_Pk PRIMARY KEY (mcq_id,que_id)
)



CREATE TABLE StudentAnswers (
    AnswerID INT ,
    StudentID INT,
    ExamID INT,
    QuestionID INT,
    StudentResponse TEXT,
    Score INT,
	questionDegree int
	constraint answer_PK PRIMARY KEY(AnswerID),
    constraint std_FK FOREIGN KEY (StudentID) REFERENCES Student(std_ID),
    constraint exam_FK FOREIGN KEY (ExamID) REFERENCES Exam(exam_ID),
    constraint question_FK FOREIGN KEY (QuestionID) REFERENCES Question(Que_id)
)

--===========================================
--=============
--=============Seperation===================
--=============
--===========================================





--==================Ulter Student Table =====================================
GO
ALTER TABLE Student
ADD constraint Student_Intake_FK FOREIGN KEY (int_ID) 
                                 REFERENCES Intake (int_ID)

ALTER TABLE Student
ADD constraint Student_user_FK FOREIGN KEY (acc_ID) 
                               REFERENCES [user] (acc_ID)


ALTER TABLE Student 
ADD constraint Student_Track_FK FOREIGN KEY (track_id) 
                                REFERENCES Traack (track_id)


ALTER TABLE Student
ADD constraint Student_Branch_FK FOREIGN KEY (branch_id) 
                                REFERENCES Branch (branch_id)


--==============Ulter Student Phone Table===============
ALTER TABLE Student_phone
ADD constraint Student_phone_Student_FK FOREIGN KEY (std_ID) 
                                        REFERENCES Student (std_ID)


--==============Ulter Student_Exam Table===============

ALTER TABLE Student_Exam
ADD constraint Student_Exam_Student_FK FOREIGN KEY (std_ID)
                                    REFERENCES Student (std_ID)
go 

ALTER TABLE Student_Exam
ADD constraint Student_Exam_Exam_FK   FOREIGN KEY (exam_id) 
                                      REFERENCES Exam (exam_id)

ALTER TABLE Student_Exam
add constraint check_result check(result between 50 and 100 )

--==============Ulter Track Table===============


ALTER TABLE Traack
ADD constraint Track_Department_FK  FOREIGN KEY (dept_id) 
                                    REFERENCES Department (dept_id)
go 
ALTER TABLE Traack
alter column track_name nvarchar(100);

--==============Ulter Branch Table===============

ALTER TABLE Branch
ADD constraint Branch_Training_Manager_FK FOREIGN KEY (mng_id) 
                                          REFERENCES Training_Manager(mng_id)
go 

ALTER TABLE Branch 
ADD constraint Branch_Intake_FK FOREIGN KEY (int_id) 
                                REFERENCES Intake (int_ID)

--==============Ulter Branch_Track_Intake Table===============
ALTER TABLE Branch_Track_Intake
ADD constraint Branch_Track_Intake_Track_FK  FOREIGN KEY (track_id) 
                                             REFERENCES Traack (track_id)

go 

ALTER TABLE Branch_Track_Intake 
ADD constraint Branch_Track_Intake_Branch_FK FOREIGN KEY  (branch_id) 
                                             REFERENCES   Branch (branch_id)
go 

ALTER TABLE Branch_Track_Intake
ADD constraint Branch_Track_Intake_IntakeFK FOREIGN KEY (int_ID) 
                                            REFERENCES Intake (int_ID)



--==============Ulter Training_Manager Table===============

ALTER TABLE Training_Manager
ADD constraint Training_Manager_user_FK FOREIGN KEY (account_id) 
                                        REFERENCES [user] (acc_ID)

--==============Ulter Instructor Table===============

ALTER TABLE Instructor
ADD constraint Instructor_user_FK  FOREIGN KEY (acc_id) 
                                   REFERENCES [user] (acc_ID)


--==============Ulter Instructor_Phone Table===============

ALTER TABLE Instructor_Phone
ADD constraint Instructor_Phone_Instructor_FK FOREIGN KEY (inst_id) 
                                              REFERENCES Instructor (inst_id)

--==============Ulter Instructor_Course Table===============

ALTER TABLE    Instructor_Course 
ADD constraint Instructor_Course_Instructor_FK FOREIGN KEY (inst_id) 
                                               REFERENCES Instructor (inst_id)
go 

ALTER TABLE Instructor_Course
ADD constraint Instructor_Course_course_FK  FOREIGN KEY (c_id) 
                                            REFERENCES course(c_id)


--==============Ulter Exam Table===============
ALTER TABLE Exam 
ADD constraint Exam_course_FK FOREIGN KEY (c_id) 
                              REFERENCES course(c_id)
go 

ALTER TABLE Exam
ADD  constraint  Exam_Instructor_FK   FOREIGN KEY (inst_id) 
                                      REFERENCES Instructor (inst_id)


--==============Ulter Intake_Exam Table===============
ALTER TABLE    Intake_Exam
ADD constraint Intake_Exam_Intake_FK  FOREIGN KEY (int_id) 
                                      REFERENCES Intake (int_ID)

go 

ALTER TABLE    Intake_Exam 
ADD constraint Intake_Exam_course_FK   FOREIGN KEY (c_id) 
                                       REFERENCES course (c_id)

--==============Ulter Track_Course Table===============

ALTER TABLE Track_Course
ADD constraint Track_Course_Track_F  FOREIGN KEY (track_id) 
                                     REFERENCES Traack(track_id)
go 

ALTER TABLE Track_Course 
ADD constraint Track_Course_Exam_FK   FOREIGN KEY (exam_id) 
                                      REFERENCES Exam (exam_id)

--==============Ulter Question Table===============

ALTER TABLE Question
ADD constraint  Question_course_FK FOREIGN KEY (c_id) 
                                   REFERENCES course (c_id)
go 

ALTER TABLE Question 
ADD constraint  Question_Exam_FK   FOREIGN KEY (exam_id) 
                                   REFERENCES Exam (exam_id)

--==============Ulter MCQ Table===============
ALTER TABLE MCQ
ADD constraint  MCQ_Question_FK   FOREIGN KEY (que_id) 
                                  REFERENCES Question (que_id)


--==============Ulter Course Table===============
ALTER TABLE Course
alter column description nvarchar(100)
go 
ALTER TABLE Course
alter column c_name nvarchar(100)

----alter the course table by adding instructor id as a foreign key
ALTER TABLE course
add inst_id int
go 
alter table course
add constraint inst__id_FK foreign key (inst_id) references Instructor(inst_id)



