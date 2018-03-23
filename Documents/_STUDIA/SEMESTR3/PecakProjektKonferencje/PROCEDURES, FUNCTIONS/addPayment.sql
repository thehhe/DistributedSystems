
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE addPayment
	@ConferenceSignUpID int,
	@Payment money
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Payments (ConferenceSignUpID, Payment)
	VALUES (@ConferenceSignUpID, @Payment)
END
GO
