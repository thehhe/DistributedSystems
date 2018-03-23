CREATE TRIGGER considerWorkshopDiscount
ON dbo.SignedWorkshops
AFTER INSERT
AS
BEGIN
	IF (SELECT SC.IDCard
		FROM inserted INNER JOIN 
			 dbo.SignedConferences as SC ON SC.SignedConferenceID=inserted.SignedConferenceID
		) IS NOT NULL
	BEGIN
		UPDATE dbo.WorkshopSignUps
		SET NumberOfStudents+=1
		FROM inserted
		WHERE dbo.WorkshopSignUps.WorkshopSignUpID=inserted.WorkshopSignUpID
	END
END