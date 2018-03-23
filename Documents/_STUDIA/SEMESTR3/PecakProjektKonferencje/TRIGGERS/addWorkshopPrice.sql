CREATE TRIGGER addWorkshopPrice
ON dbo.WorkshopSignUps
AFTER INSERT, UPDATE
AS
BEGIN
	UPDATE dbo.ConferenceSignUps
	SET Price=(dbo.countAllPrice(inserted.ConferenceSignUpID))
	FROM inserted
	WHERE inserted.ConferenceSignUpID=dbo.ConferenceSignUps.ConferenceSignUpID
END