CREATE TRIGGER addReservationPrice
ON dbo.ConferenceSignUps
AFTER INSERT, UPDATE
AS
BEGIN
	UPDATE dbo.ConferenceSignUps
	SET Price=(dbo.countAllPrice(dbo.ConferenceSignUps.ConferenceSignUpID))
	FROM dbo.ConferenceSignUps JOIN
	     inserted ON inserted.ConferenceSignUpID=dbo.ConferenceSignUps.ConferenceSignUpID
END