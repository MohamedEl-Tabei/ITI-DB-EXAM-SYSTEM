
--Exam_Question

--Stored procedure to insert question into exam take two parameters question id and exam id
CREATE PROCEDURE SP_INSERT_QUESTION_TO_EXAM @QID INT , @EID INT
AS 
	BEGIN TRY
		INSERT INTO Exam_Question (E_Id,Q_Id)
		VALUES(@EID,@QID)
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE()
	END CATCH

-----------------------------------------
EXECUTE SP_INSERT_QUESTION_TO_EXAM 100,1
-----------------------------------------

--Stored procedure to display questions(HEAD,A,B,C,D,ANSWER,GRADE) of exam take one parameter exam id
CREATE PROCEDURE SP_SELECT_QUESTIONS_OF_EXAM @EID INT
AS 
	IF EXISTS(SELECT Exam_Id FROM Exam WHERE @EID=Exam_Id)
		SELECT Q.Tittle AS Question , QC.ch1 AS A , QC.ch2 AS B , QC.ch3 AS C , QC.ch4 AS D , Q.Answer , Q.Grade
		FROM Exam E , Question Q, Exam_Question EQ, Ques_Choice QC
		WHERE E.Exam_Id=@EID AND E.Exam_Id=EQ.E_Id AND Q.Q_Id=EQ.Q_Id AND Q.Q_Id=QC.Q_Id 
	ELSE
		SELECT 'Invalid exam id'
------------------------------------
EXECUTE SP_SELECT_QUESTIONS_OF_EXAM 2
------------------------------------