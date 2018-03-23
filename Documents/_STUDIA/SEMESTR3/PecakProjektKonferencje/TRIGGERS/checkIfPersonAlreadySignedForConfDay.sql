CREATE TRIGGER checkIfPersonAlreadySignedForConfDay
ON dbo.SignedConferences
AFTER INSERT
AS
BEGIN
	IF (SELECT COUNT(*)
		FROM inserted as SC INNER JOIN
			 dbo.ConferenceSignUps as CSU ON CSU.ConferenceSignUpID=SC.ConferenceSignUpID INNER JOIN
			 dbo.ConferenceSignUps as CSU2 ON CSU2.ConferenceDayID=CSU.ConferenceDayID INNER JOIN
			 dbo.SignedConferences as SC2 ON SC2.ConferenceSignUpID=CSU2.ConferenceSignUpID
		WHERE (SC2.PersonID=SC.PersonID)
		)>1
	BEGIN
		RAISERROR('ERROR: Person already signed for this conference day.', 16, 1)
		ROLLBACK TRANSACTION
		RETURN
	END
END