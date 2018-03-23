SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE makeWorkshopReservation
	@WorkshopID int,
	@ConferenceSignUpID int,
	@NumberOfPpl int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @CustomerID AS int
	SET @CustomerID = (SELECT Cust.CustomerID
					   FROM Customers as Cust
					   INNER JOIN ConferenceSignUps as CSU ON CSU.CustomerID=Cust.CustomerID
					   WHERE CSU.ConferenceSignUpID=@ConferenceSignUpID)
	IF (SELECT IsCompany
		FROM Customers
		WHERE CustomerID=@CustomerID)=1
	BEGIN
		INSERT INTO WorkshopSignUps (WorkshopID, ConferenceSignUpID, NumberOfPpl)
		VALUES (@WorkshopID, @ConferenceSignUpID, @NumberOfPpl)
	END
	ELSE
		INSERT INTO WorkshopSignUps (WorkshopID, ConferenceSignUpID, NumberOfPpl)
		VALUES (@WorkshopID, @ConferenceSignUpID, 1) --idividual customer can only register himself
END
GO
