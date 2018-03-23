CREATE TRIGGER considerConferenceDiscount
ON dbo.SignedConferences
AFTER INSERT
AS
BEGIN
	IF (SELECT inserted.IDCard
		FROM inserted
		) IS NOT NULL
	BEGIN
		UPDATE dbo.ConferenceSignUps
		SET NumberOfStudents+=1
		FROM inserted
		WHERE dbo.ConferenceSignUps.ConferenceSignUpID=inserted.ConferenceSignUpID
	END
END