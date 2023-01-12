--Script Name: Changing a table from identity to sequence (Manually)
--Script Type: Solution
--Article: https://raresql.com/2013/02/16/sql-server-2012-changing-a-table-from-identity-to-sequence-manually/
--Developed By: Muhammad Imran
--Date Created: 16 Feb 2013
--Date Modified: 10 Jan 2023

--Sample

--Create table
Create table dbo.[Student]
(
[StudentID] int identity(1,1),
[StudentName] varchar(50)
CONSTRAINT PK_Student_StudentID PRIMARY KEY CLUSTERED
([StudentID] ASC)
)
GO

--Insert record into table
Insert into dbo.Student values ('Imran'),('Bob'),('Sandra')
GO

--Browse table
Select * from dbo.Student

--End of sample

--Step-1

--Alter table
ALTER TABLE dbo.Student ADD StudentIDNew int NULL
GO

--End of step-1

--Step-2

--Update table
UPDATE dbo.Student
SET [StudentIDNew] = [StudentID]
GO
--End of step-2

--Step-3

Alter table
ALTER TABLE dbo.Student

--Drop constraint
DROP CONSTRAINT PK_Student_StudentID;
GO
--End of step-3

--Step-4

--Alter table
ALTER TABLE dbo.Student

--Drop column
DROP COLUMN [StudentID] ;
GO
--End of step-4

--Step-5

--Rename column
EXEC sp_rename 'dbo.Student.StudentIDNew',
'StudentID', 'COLUMN';
GO

--End of step-5

--Step-6

--Alter table
ALTER TABLE dbo.Student ALTER COLUMN [StudentID] int NOT NULL ;
GO

--End of step-6

--Step-7

--Alter table
ALTER TABLE dbo.Student

--Add constraint
ADD CONSTRAINT PK_Student_StudentID PRIMARY KEY CLUSTERED
([StudentID] ASC) ;
GO

--End of step-7

--Step-8

SELECT MAX(StudentID) FROM dbo.Student ;
GO

--End of step-8

--Step-9

--Create sequence
CREATE SEQUENCE dbo.StudentSeq
AS int
START WITH 4
INCREMENT BY 1 ;
GO

--End of step-9


--Step-10

--Alter table
ALTER TABLE dbo.Student

--Add constraint
ADD CONSTRAINT Const_StudentSeq DEFAULT (NEXT VALUE FOR dbo.StudentSeq)
FOR StudentID;
GO

--End of step-10

--Step-11

--Insert records into table
Insert into Student (StudentName) Values ('Mark')
Insert into Student (StudentName) Values ('Peter')

--Browse table
Select * from dbo.Student

--End of step-11
