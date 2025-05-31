-----------------------------Insert Data into Department Table-------------------------
--By Mostafa Hamed
------------------------------------------------------------------------------------------
use Examination_Sytem
go 
INSERT INTO Department (dept_id, dept_name)
VALUES 
(1, 'Industrial Systems'),
(2, 'Content Development'),
(3, 'Infrastructure network and security services'),
(4, 'Information Systems'),
(5, 'Software engineering and developments'),
(6, 'Cognitive Computing and Artificial Intelligence'),
(7, 'QA Engineering & Validation');

-----------------------------Insert Data into Intake Table-------------------------
-------------------------------------------------------------------------------------
use Examination_Sytem 
go
INSERT INTO Intake(int_ID, int_name, s_date, e_date)
VALUES 
(1, 'intake_1', '1980-01-10', '1981-01-06'),
(2, 'intake_2', '1981-10-01', '1982-01-06'),
(3, 'intake_3', '1982-10-01', '1983-01-06'),
(4, 'intake_4', '1983-10-01', '1984-01-06'),
(5, 'intake_5', '1984-10-01', '1985-01-06'),
(6, 'intake_6', '1985-10-01', '1986-01-06'),
(7, 'intake_7', '1986-10-01', '1987-01-06'),
(8, 'intake_8', '1987-10-01', '1988-01-06'),
(9, 'intake_9', '1988-10-01', '1989-01-06'),
(10, 'intake_10', '1989-10-01', '1990-01-06'),
(11, 'intake_11', '1990-10-01', '1991-01-06'),
(12, 'intake_12', '1991-10-01', '1992-01-06'),
(13, 'intake_13', '1992-10-01', '1993-01-06'),
(14, 'intake_14', '1993-10-01', '1994-01-06'),
(15, 'intake_15', '1994-10-01', '1995-01-06'),
(16, 'intake_16', '1995-10-01', '1996-01-06'),
(17, 'intake_17', '1996-10-01', '1997-01-06'),
(18, 'intake_18', '1997-10-01', '1998-01-06'),
(19, 'intake_19', '1998-10-01', '1999-01-06'),
(20, 'intake_20', '1999-10-01', '2000-01-06'),
(21, 'intake_21', '2000-10-01', '2001-01-06'),
(22, 'intake_22', '2001-10-01', '2002-01-06'),
(23, 'intake_23', '2002-10-01', '2003-01-06'),
(24, 'intake_24', '2003-10-01', '2004-01-06'),
(25, 'intake_25', '2004-10-01', '2005-01-06'),
(26, 'intake_26', '2005-10-01', '2006-01-06'),
(27, 'intake_27', '2006-10-01', '2007-01-06'),
(28, 'intake_28', '2007-10-01', '2008-01-06'),
(29, 'intake_29', '2008-10-01', '2009-01-06'),
(30, 'intake_30', '2009-10-01', '2010-01-06'),
(31, 'intake_31', '2010-10-01', '2011-01-06'),
(32, 'intake_32', '2011-10-01', '2012-01-06'),
(33, 'intake_33', '2012-10-01', '2013-01-06'),
(34, 'intake_34', '2013-10-01', '2014-01-06'),
(35, 'intake_35', '2014-10-01', '2015-01-06'),
(36, 'intake_36', '2015-10-01', '2016-01-06'),
(37, 'intake_37', '2016-10-01', '2017-01-06'),
(38, 'intake_38', '2017-10-01', '2018-01-06'),
(39, 'intake_39', '2018-10-01', '2019-01-06'),
(40, 'intake_40', '2019-10-01', '2020-01-06'),
(41, 'intake_41', '2020-10-01', '2021-01-06'),
(42, 'intake_42', '2021-10-01', '2022-01-06'),
(43, 'intake_43', '2022-10-01', '2023-01-06'),
(44, 'intake_44', '2023-10-01', '2024-01-06'),
(45, 'intake_45', '2024-10-01', '2025-01-06');
-----------------------------Insert Data into Traack Table-------------------------
-------------------------------------------------------------------------------------
use Examination_Sytem
go 
INSERT INTO Traack(track_id, track_name, dept_id)
VALUES 
--Industrial Systems   (dept_id = 1)
(1,'Embedded Systems', 1),
(2,'Wireless Communications', 1),
(3,'Digital IC Design', 1),
(4,'Industrial Automation', 1),

--Content Developments  (dept_id = 2)
(5,'Game Programming', 2),
(6,'Game Art', 2),
(7,'VFX Compositing', 2),
(8,'2D Animation and Motion Graphics', 2),
(9,'FX Dynamics and Simulation', 2),
(10,'3D Generalist', 2),
(11,'3D Animation', 2),
(12,'CG Technical Director', 2),

-- Infrastructure Network And Security Services (dept_id = 3)
(13,'Systems Administration', 3),
(14,'Cyber Security', 3),
(15,'Cloud Architecture', 3),

-- Information Systems (dept_id = 4)
(16,'Geoinformatics', 4),
(17,'ERP Consulting', 4),
(18,'Architecture, Engineering and Construction Informatics', 4),
(19,'Data Management', 4),
(20,'Data Science', 4),

--Software engineering and developments (dept_id = 5)
(21,'Open Source Applications Development', 5),
(22,'Cloud Platform Development', 5),
(23,'Enterprise & Web Apps Development (Java)', 5),
(24,'Mobile Applications Development (Native)', 5),
(25,'Professional Development & BI-infused CRM', 5),
(26,'Web & User Interface Development', 5),
(27,'Telecom Applications Development', 5),
(28,'Mobile Applications Development (Cross Platform)', 5),
(29,'Integrated Software Development & Architecture', 5),

--Cognitive Computing and Artificial Intelligence  (dept_id = 6)
(30,'AI and Machine Learning', 6),

--QA Engineering & Validation   (dept_id = 7)
(31,'Software Testing & Quality Assurance', 7);
----------------------------------------Insert Data into User Table---------------
-----------------------------------------------------------------------------------
use Examination_Sytem
go
INSERT INTO [user] (acc_ID, user_name, password, role)
VALUES 
(0, 'Admin', '1234', 'Admin '),
(1,  'Mostafa', 1234, 'Training Manager'),
(2,  'Rania',   2632, 'Training Manager'),
(3,  'Sherif',  3443, 'Training Manager'),
(4,  'Dina',    3433, 'Training Manager'),
(5,  'Tarek',   3434, 'Training Manager'),
(6,  'Eman',    5443, 'Training Manager'),
(7,  'Ibrahim', 4857, 'Training Manager'),
(8,  'Maha',    2868, 'Training Manager'),
(9,  'Khaled',  3252, 'Training Manager'),
(10, 'Fatma',   2346, 'Training Manager'),
(11, 'Rami',    4434, 'Training Manager'),
(12, 'Doaa',    5533, 'Training Manager'),
(13, 'Walid',   4343, 'Training Manager'),
(14, 'Laila',   2422, 'Training Manager'),
(15, 'Hazem',   2323, 'Training Manager'),
(16, 'Shereen', 2323, 'Training Manager'),
(17, 'Hesham',  2323, 'Training Manager'),
(18, 'Dalia',   3223, 'Training Manager'),
(19, 'Fady',    3232, 'Training Manager'),
(20, 'Rana',    2322, 'Training Manager'),
(21, 'ahmed', 2333, 'Instructors'),
(22, 'laila', 3234, 'Instructors'),
(23, 'omar', 5454, 'Instructors'),
(24, 'salma', 5765, 'Instructors'),
(25, 'hassan', 0989, 'Instructors'),
(26, 'mona',  3434, 'Instructors'),
(27, 'tamer', 3434, 'Instructors'),
(28, 'nourhan', 2356, 'Instructors'),
(29, 'mahmoud', 8697, 'Instructors'),
(30, 'mohamed', 3434, 'student'),
(31, 'ahmed', 564, 'student'),
(32, 'ali', 3463434, 'student'),
(33, 'fatma', 53355, 'student'),
(34, 'mariam', 3445334, 'student'),
(35, 'omar', 3453434, 'student'),
(36, 'youssef', 34367674, 'student'),
(37, 'heba', 386786436434, 'student'),
(38, 'samir', 343535434, 'student'),
(39, 'nada', 32342434, 'student'),
(40, 'adel', 354353434, 'student'),
(41, 'hany', 343454334, 'student'),
(42, 'wael', 34344334, 'student'),
(43, 'karim', 343434, 'student'),
(44, 'dalia', 344534, 'student'),
(45, 'sherif', 3434, 'student'),
(46, 'amr', 1213434, 'student'),
(47, 'khaled', 1213434, 'student'),
(48, 'ramy', 223434, 'student'),
(49, 'hossam', 341234, 'student');



------------------------------------------------------------------------------------------
------------------------------------BY:Ahmed Hesham-----------------------
----------------------------------------Insert data into training_manager table---------------
use Examination_Sytem
go
insert into Training_Manager (mng_id, mng_fname, mng_lname, mng_email, account_id)
values 
(1, 'Mostafa', 'Ali', 'mo.ali@iti.gov.eg', 1),
(2, 'Rania', 'Fahmy', 'rania.fahmy@iti.edu.eg', 2),
(3, 'Sherif', 'Nabil', 'sherif.nabil@iti.edu.eg',3),
(4, 'Dina', 'Youssef', 'dina.youssef@iti.edu.eg', 4),
(5, 'Tarek', 'Mahmoud', 'tarek.mahmoud@iti.edu.eg', 5),
(6, 'Eman', 'Kamal', 'eman.kamal@iti.edu.eg', 6),
(7, 'Ibrahim', 'Hassan', 'ibrahim.hassan@iti.edu.eg', 7),
(8, 'Maha', 'Ali', 'maha.ali@iti.edu.eg', 8),
(9, 'Khaled', 'Tawfik', 'khaled.tawfik@iti.edu.eg', 9),
(10, 'Fatma', 'Sami', 'fatma.sami@iti.edu.eg',10),
(11, 'Rami', 'Nour', 'rami.nour@iti.org.eg', 11),
(12, 'Doaa', 'Ali', 'doaa.ali@iti.org.eg', 12),
(13, 'Walid', 'Saad', 'walid.saad@iti.org.eg',13),
(14, 'Laila', 'Farid', 'laila.farid@iti.org.eg', 14),
(15, 'Hazem', 'Gamal', 'hazem.gamal@iti.org.eg',15),
(16, 'Shereen', 'Zaki', 'shereen.zaki@iti.org.eg',16),
(17, 'Hesham', 'Reda', 'hesham.reda@iti.org.eg', 17),
(18, 'Dalia', 'Mostafa', 'dalia.mostafa@iti.org.eg', 18),
(19, 'Fady', 'Magdy', 'fady.magdy@iti.org.eg', 19),
(20, 'Rana', 'Nasser', 'rana.nasser@iti.org.eg', 20);


----------------------------------------Insert data into Instructor table---------------
use Examination_Sytem
go
insert into Instructor(inst_id, inst_fname, inst_lname, nid, year_o_experince, ints_email, hire_date, city, street, specialization, acc_id)
values
(1, 'Ahmed', 'Hassan', '9', 5, 'ahmed.hassan@iti.gov.eg', '2019-09-01', 'Cairo', 'Tahrir St.', 'Embedded Systems', 21),
(2, 'Laila', 'Mahmoud', '8', 7, 'laila.mahmoud@iti.gov.eg', '2018-06-15', 'Alexandria', 'Corniche Rd.', 'Cyber Security',22),
(3, 'Omar', 'Ali', '2', 6, 'omar.ali@iti.gov.eg', '2020-01-10', 'Assiut', 'El Gamaa St.', 'Data Science', 23),
(4, 'Salma', 'Yousef', '4', 4, 'salma.yousef@iti.gov.eg', '2021-03-20', 'Mansoura', 'El Gomhoureya St.', '3D Animation', 24),
(5, 'Hassan', 'Ibrahim', '3', 8, 'hassan.ibrahim@iti.gov.eg', '2017-11-05', 'Ismailia', 'Ring Road', 'Cloud Architecture', 25),
(6, 'Mona', 'Gamal', '7', 7, 'mona.gamal@iti.edu.eg', '2017-06-15', 'Cairo', 'El-Mokattam', 'Data Science', 26),
(7, 'Tamer', 'Said', '1', 10, 'tamer.said@iti.edu.eg', '2014-09-01', 'Alexandria', 'Sidi Gaber', 'Cyber Security', 27),
(8, 'Nourhan', 'Hesham', '5', 5, 'nourhan.hesham@iti.edu.eg', '2019-03-20', 'Mansoura', 'Taha Hussein St.', 'AI and Machine Learning', 28),
(9, 'Mahmoud', 'Yassin', '6', 12, 'mahmoud.yassin@iti.edu.eg', '2012-11-10', 'Assiut', 'El-Geish St.', 'Embedded Systems',29)
----------------------------------------Insert data into course table---------------
use Examination_Sytem
go
insert into course (c_id, c_name, description, min_degree, max_degree)
values
(1, 'Introduction to Python', 'Basics of Python programming for beginners.', 50, 100),
(2, 'Data Structures & Algorithms', 'Covers core concepts of DS & algorithm design.', 60, 100),
(3, 'Database Systems', 'SQL, relational models, and database design.', 55, 100),
(4, 'Web Development', 'HTML, CSS, JavaScript, and web app structure.', 50, 100),
(5, 'Machine Learning Fundamentals', 'Intro to supervised and unsupervised learning.', 65, 100),
(6, 'Cyber Security Essentials', 'Network security, encryption, and threat analysis.', 60, 100),
(7, 'Cloud Computing Basics', 'AWS, Azure, and deployment strategies.', 55, 100),
(8, 'Mobile App Development', 'Creating native apps for Android & iOS.', 50, 100),
(9, 'Software Testing', 'Manual & automated testing techniques.', 60, 100),
(10, 'Operating Systems', 'Process management, memory, and concurrency.', 55, 100)

----------------------------------------Insert data into branch table---------------
use Examination_Sytem
go
insert into Branch (branch_id, branch_name, mng_id, int_id)
values
(1, 'Cairo', 1, 45),
(2, 'Alexandria', 2, 44),
(3, 'Mansoura', 3, 43),
(4, 'Assiut', 4, 42),
(5, 'Ismailia', 5, 41),
(6, 'Minya', 6, 40),
(7, 'Sohag', 7, 39),
(8, 'Aswan', 8, 38),
(9, 'Banha', 9, 37),
(10, 'Zagazig', 10, 36),
(11, 'Qena', 11, 35),
(12, 'Damanhour', 12, 34),
(13, 'Beni Suef', 13, 33),
(14, 'Tanta', 14, 32),
(15, 'Fayoum', 15, 31),
(16, 'Matrouh', 16, 30),
(17, 'Kafr El-Sheikh', 17, 29),
(18, 'New Valley', 18, 28),
(19, 'Port Said', 19, 27),
(20, 'Smart Village', 20, 26)
------------------------------------------------------------------------------------
--------------------------------By:Nada Zohny---------------------------------------
--------------------------------------------------Now insert student records---------------
use Examination_Sytem
go
INSERT INTO Student (
    std_ID, std_Fname, std_Lname, GPA, enrol_date, DOB, 
    int_ID, acc_ID, track_id, branch_id
)
VALUES
-- Students in Cairo branch (branch_id = 1)
(1, 'Mohamed', 'Ahmed', 3.5, '2023-09-01', '2000-05-15', 45, 30, 1, 1),
(2, 'Ahmed', 'Mohamed', 3.2, '2023-09-01', '2001-07-22', 45,31, 2, 1),
(3, 'Ali', 'Mahmoud', 3.8, '2023-09-01', '2000-11-30', 45, 32, 3, 1),
(4, 'Fatma', 'Ibrahim', 3.9, '2023-09-01', '2001-03-18', 45, 33, 4, 1),

-- Students in Alexandria branch (branch_id = 2)
(5, 'Mariam', 'Hassan', 3.4, '2023-09-01', '2000-09-10', 44, 34, 5, 2),
(6, 'Omar', 'Youssef', 3.1, '2023-09-01', '2001-01-25', 44, 35, 6, 2),
(7, 'Youssef', 'Ali', 3.7, '2023-09-01', '2000-08-14', 44, 36, 7, 2),

-- Students in Mansoura branch (branch_id = 3)
(8, 'Heba', 'Samir', 3.6, '2023-09-01', '2001-04-05', 43, 37, 8, 3),
(9, 'Samir', 'Nagy', 3.3, '2023-09-01', '2000-12-20', 43, 38, 9, 3),
(10, 'Nada', 'Adel', 3.9, '2023-09-01', '2001-02-11', 43, 39, 10, 3),

-- Students in Assiut branch (branch_id = 4)
(11, 'Adel', 'Hany', 3.5, '2023-09-01', '2000-06-28', 42, 40, 11, 4),
(12, 'Hany', 'Wael', 3.2, '2023-09-01', '2001-10-15', 42, 41, 12, 4),
(13, 'Wael', 'Karim', 3.8, '2023-09-01', '2000-07-03', 42, 42, 13, 4),

-- Students in Ismailia branch (branch_id = 5)
(14, 'Karim', 'Tamer', 3.4, '2023-09-01', '2001-05-19', 41, 43, 14, 5),
(15, 'Dalia', 'Sherif', 3.7, '2023-09-01', '2000-08-22', 41, 44, 15, 5),
(16, 'Sherif', 'Amr', 3.1, '2023-09-01', '2001-11-30', 41, 45, 16, 5),

-- Students in Minya branch (branch_id = 6)
(17, 'Amr', 'Khaled', 3.6, '2023-09-01', '2000-04-17', 40, 46, 17, 6),
(18, 'Khaled', 'Ramy', 3.3, '2023-09-01', '2001-09-08', 40, 47, 18, 6),
(19, 'Ramy', 'Hossam', 3.9, '2023-09-01', '2000-10-25', 40, 48, 19, 6),

-- Students in Sohag branch (branch_id = 7)
(20, 'Hossam', 'Essam', 3.5, '2023-09-01', '2001-12-12', 39, 49, 20, 7);

----------------------------------------Insert data into Student_phone table---------------
use Examination_Sytem
go
INSERT INTO Student_phone (std_ID, Phone_Number)
VALUES
-- Multiple phones for some students
(1, '01012345678'),
(1, '01012345679'),
(2, '01023456789'),
(3, '01034567890'),
(4, '01045678901'),
(5, '01056789012'),
(6, '01067890123'),
(7, '01078901234'),
(8, '01089012345'),
(9, '01090123456'),
(10, '01101234567'),
(10, '01101234568'),
(11, '01112345678'),
(12, '01123456789'),
(13, '01134567890'),
(14, '01145678901'),
(15, '01156789012'),
(16, '01167890123'),
(17, '01178901234'),
(18, '01189012345'),
(19, '01190123456'),
(20, '01201234567');

----------------------------------------Insert data into Instructor_Phone table---------------
use Examination_Sytem
go
INSERT INTO Instructor_Phone (inst_id, phone)
VALUES
-- Multiple phones for some instructors
(1, '01011223344'),
(1, '01011223345'),
(2, '01022334455'),
(3, '01033445566'),
(4, '01044556677'),
(5, '01055667788'),
(6, '01066778899'),
(7, '01077889900'),
(8, '01088990011'),
(9, '01099001122');

----------------------------------------Insert data into Instructor_Course table---------------
use Examination_Sytem
go
INSERT INTO Instructor_Course (inst_id, c_id)
VALUES
-- Instructor 1 (Embedded Systems) teaches relevant courses
(1, 1), -- Introduction to Python
(1, 10), -- Operating Systems
(1, 3), -- Database Systems

-- Instructor 2 (Cyber Security) teaches relevant courses
(2, 6), -- Cyber Security Essentials
(2, 10), -- Operating Systems
(2, 4), -- Web Development

-- Instructor 3 (Data Science) teaches relevant courses
(3, 5), -- Machine Learning Fundamentals
(3, 2), -- Data Structures & Algorithms
(3, 3), -- Database Systems

-- Instructor 4 (3D Animation) teaches relevant courses
(4, 4), -- Web Development
(4, 8), -- Mobile App Development
(4, 9), -- Software Testing

-- Instructor 5 (Cloud Architecture) teaches relevant courses
(5, 7), -- Cloud Computing Basics
(5, 3), -- Database Systems
(5, 10), -- Operating Systems

-- Instructor 6 (Data Science) teaches relevant courses
(6, 5), -- Machine Learning Fundamentals
(6, 2), -- Data Structures & Algorithms
(6, 1), -- Introduction to Python

-- Instructor 7 (Cyber Security) teaches relevant courses
(7, 6), -- Cyber Security Essentials
(7, 10), -- Operating Systems
(7, 9), -- Software Testing

-- Instructor 8 (AI and Machine Learning) teaches relevant courses
(8, 5), -- Machine Learning Fundamentals
(8, 1), -- Introduction to Python
(8, 2), -- Data Structures & Algorithms

-- Instructor 9 (Embedded Systems) teaches relevant courses
(9, 10), -- Operating Systems
(9, 1), -- Introduction to Python
(9, 3); -- Database Systems

------------------------------------------------------------------------------------
--------------------------------By:Mahmoud abdelkhalek ------------------------------------------

use Examination_Sytem 
go 
INSERT INTO Branch_Track_Intake (Track_id, branch_id, int_ID)
VALUES 
(1, 2, 1 ),
(2, 4, 3 ),
(3, 15, 4 ),
(4, 7, 6 ),
(5, 19, 5 ),
(6, 5, 4 ),
(7, 11, 9 ),
(8, 4, 6 ),
(9, 2, 3 ),
(10, 10, 4),
(11, 16, 1),
(12, 12, 5),
(13, 9, 5 ),
(14, 5, 1 ),
(15, 11, 3 ),
(16, 14, 6 ),
(17, 2, 3 ),
(18, 10, 4),
(19, 11, 1),
(20, 17, 5);

-----------------------------Insert Data into Exam Table-------------------------
-----------------------------------------------------------------------------------
use Examination_Sytem 
go 
INSERT INTO Exam (exam_id, a_option, year, exam_type, Exam_degree, Exam_Stime, Exam_Etime, total_time , c_id, inst_id) 
VALUES

(1, 'Exam', 2024, 'MCQ', 90, '10:00:00', '12:00:00', '02:00:00', 1, 4),
(2, 'Exam', 2024, 'Text', 75, '12:00:00', '14:00:00', '02:00:00', 4, 6),
(3, 'Exam', 2025, 'True/False', 85, '12:00:00', '14:00:00', '02:00:00', 7, 1),
(4, 'Exam', 2025, 'MCQ', 79, '10:00:00', '12:00:00', '02:00:00', 3, 9),
(5, 'Exam', 2025, 'True/False', 88, '14:00:00', '16:00:00', '02:00:00', 8, 3);



-----------------------------Insert Data into Track_Course Table-------------------------
----------------------------------------------------------------------------------

use Examination_Sytem 
go 
INSERT INTO Track_Course (track_id, course_id,exam_id)
VALUES
(2, 1,1),
(3, 1,1),
(1, 2,1),
(4, 3,2),
(3, 3,2),
(4, 5,3),
(5, 4,3),
(6, 3,4),
(7, 1,4),
(8, 2,5),
(9, 5,5),
(10,4,5);
-----------------------------Insert Data into Intake_Exam Table-------------------------
-----------------------------------------------------------------------------------------

use Examination_Sytem 
go 
INSERT INTO Intake_Exam (int_id, exam_id,c_id)
VALUES

-- course = 'Introduction to Python'--------
(5, 1,1),
(15, 1,1),
(20, 1,1),
(30, 1,1),
(35, 1,1),
(45, 1,1),

-- course = 'Data Structures & Algorithms'--------
(12, 2,2),
(27, 2,2),

-- course = 'Database Systems'--------
(10, 3,3),
(13, 3,3),
(25, 3,3),
(28, 3,3),
(40, 3,3),

-- course = 'Web Development'--------
(6, 4,4),
(14, 4,4),
(21, 4,4),
(29, 4,4),
(36, 4,4),

-- course = 'Machine Learning Fundamentals'--------
(7, 5,5),
(11, 5,5),
(22, 5,5),
(26, 5,5),
(37, 5,5),

-- course = 'Cyber Security Essentials'--------
(1, 6,6),
(16, 6,6),
(31, 6,6),
(41, 6,6),

-- course = 'Cloud Computing Basics'--------
(9, 7,7),
(24, 7,7),
(39, 7,7),

-- course = 'Mobile App Development'--------
(3, 8,8),
(8, 8,8),
(18, 8,8),
(23, 8,8),
(33, 8,8),
(38, 8,8),
(43, 8,8),

-- course = 'Software Testing'-------
(2, 9,9),
(17, 9,9),
(32, 9,9),
(42, 9,9),

-- course = 'Operating Systems'--------
(4, 10,10),
(19, 10,10),
(34, 10,10),
(44, 10,10);
---------------------------------------------------------------------------------
-----------------------------------By:Mohamed Saleh------------------------------
---------------------------------------------------------------------------------
insert into Question (que_id, que_type, b_a_answer, correct_answer, que_test, c_id, exam_id)
values  
(1, 'MCQ', Null, 'A', 'What is Python?', 1, 2),
(2, 'MCQ', Null, 'D', 'Which data type is immutable in Python?', 1, 2), 
(3, 'MCQ', Null, 'B', 'Which SQL command is used to retrieve data from a database?', 1, 2),
(4, 'MCQ', Null, 'A', 'Which type of database model organizes data in a tree-like structure?', 3, 1),
(5, 'MCQ', Null, 'B', 'Which of the following is NOT a type of database?', 3, 1),
(6, 'MCQ', Null, 'A', 'What does the len() function do in Python?', 1, 2),
(7, 'MCQ', Null, 'D', 'Which SQL clause is used to filter records in a query?', 3, 1), 
(8, 'MCQ', Null, 'D', 'Which keyword is used to define a function in Python?', 1, 2), 
(9, 'MCQ', Null, 'B', 'Which SQL statement is used to remove all records from a table but keep its structure?', 1, 2),
(10, 'MCQ', Null, 'A', 'what is database', 3, 1),
(11, 'MCQ', Null, 'D', 'what is unique key', 3, 1),
(12, 'MCQ', Null, 'B', 'what is primary key', 3, 1) ,
(13, 'True/False', Null, 'False', 'Python is A high-level programming language', 1, 2),
(14, 'True/False', Null, 'False', 'SQL stands for Structured Query Language', 3, 1),
(15, 'True/False', Null, 'False', 'List is immutable', 1, 2),
(16, 'True/False', Null, 'False', 'A primary key in a database must always be unique', 3, 1),
(17, 'Text', 'A collection of codes', Null, 'what is progarmming', 1, 2),
(18, 'Text', 'A software used to write sql', Null, 'what is DBMS', 3, 1),
(19, 'Text', 'A collection of functions and atrributes', Null, 'what is class defination', 1, 2),
(20, 'Text', 'list is mutable and tuple is immtuable', Null, 'what is the differnece between list and tuple', 3, 1),
(21, 'Text', 'if is a condition', Null, 'what is if', 3, 1);


-----------------insert into MCQ table-------------
use Examination_Sytem
go 
insert into MCQ (mcq_id, que_id, [A], [B], [C], [D])
values 
(1, 1, 'A','B','C','D'),
(3, 2, 'A','B','C','D'),
(4, 3, 'A','B','C','D'),
(5, 4, 'A','B','C','D'),
(6, 5, 'A','B','C','D'),
(7, 6, 'A','B','C','D'),
(8, 7, 'A','B','C','D'),
(9, 8, 'A','B','C','D'),
(10, 9, 'A','B','C','D'),
(11, 10, 'A','B','C','D'),
(12, 11, 'A','B','C','D'),
(13, 12, 'A','B','C','D');

---------------insert into  Student_Exam table------------
use Examination_Sytem
go 
insert into Student_Exam (std_ID,exam_id,Result)
values
(1,2,80),
(4,1,90),
(10,5,70),
(15,4,60),
(9,1,75),
(13,3,65),
(20,1,90),
(7,3,65),
(1,3,90),
(8,2,70);
-----------------------------------------
-----Insert Data into StudentAnswers-----
-----------------------------------------
USE Examination_Sytem;
GO
INSERT INTO StudentAnswers (AnswerID, StudentID, ExamID, QuestionID, StudentResponse, Score, questionDegree)
VALUES 
-- Student 1 answered question 1 in exam 2 (MCQ: correct answer is A)
(1, 1, 2, 1, 'A', 1, 1),

-- Student 1 answered question 2 in exam 2 (wrong answer)
(2, 1, 2, 2, 'B', 0, 1),

-- Student 4 answered question 4 in exam 1 (MCQ: correct answer is A)
(3, 4, 1, 4, 'A', 1, 1),

-- Student 10 answered question 20 in exam 5 (Text type question, good answer)
(4, 10, 5, 20, 'List is mutable; tuple is not', 1, 1),

-- Student 13 answered question 14 in exam 1 (True/False, correct answer is False)
(5, 13, 3, 14, 'False', 1, 1);

