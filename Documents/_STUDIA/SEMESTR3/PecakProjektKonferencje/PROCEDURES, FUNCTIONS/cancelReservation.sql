SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE cancelReservation
	@ConferenceSignUpID int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.ConferenceSignUps
	SET Cancelled=1
	WHERE dbo.ConferenceSignUps.ConferenceSignUpID=@ConferenceSignUpID

	UPDATE dbo.WorkshopSignUps
	SET Cancelled=1
	WHERE dbo.WorkshopSignUps.ConferenceSignUpID=@ConferenceSignUpID
END
GO
