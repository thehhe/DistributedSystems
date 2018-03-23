CREATE TRIGGER checkIfPaid
ON dbo.Payments
AFTER UPDATE, INSERT
AS
BEGIN
	IF EXISTS (SELECT 'TRUE'
			   FROM inserted INNER JOIN 
			   dbo.Payments as P ON P.ConferenceSignUpID=inserted.ConferenceSignUpID INNER JOIN
			   dbo.ConferenceSignUps as CSU ON CSU.ConferenceSignUpID=P.ConferenceSignUpID
			   GROUP BY inserted.ConferenceSignUpID, P.Payment, inserted.Payment, CSU.Price
			   HAVING (SUM(P.Payment)+inserted.Payment)>CSU.Price
			   )
	BEGIN
		RAISERROR('ERROR: Enough money has been paid.', 16, 1)
		ROLLBACK TRANSACTION
		RETURN
	END
END