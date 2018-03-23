SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE makeConferenceReservation
	@CustomerID int,
	@ConferenceDayID int,
	@NumberOfPpl int 
AS
BEGIN
	SET NOCOUNT ON;
	IF (SELECT IsCompany
		FROM Customers
		WHERE CustomerID=@CustomerID)=1
	BEGIN
		INSERT INTO ConferenceSignUps (CustomerID, ConferenceDayID, NumberOfPpl)
		VALUES (@CustomerID, @ConferenceDayID, @NumberOfPpl)
	END
	ELSE
		INSERT INTO ConferenceSignUps (CustomerID, ConferenceDayID, NumberOfPpl)
		VALUES (@CustomerID, @ConferenceDayID, 1) --idividual customer can only register himself
END
GO
