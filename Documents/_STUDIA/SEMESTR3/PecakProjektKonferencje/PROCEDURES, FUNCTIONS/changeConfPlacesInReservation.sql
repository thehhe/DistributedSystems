SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE changeConfPlacesInReservation
	@ConferenceSignUpID int,
	@NewNrOfPpl int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.ConferenceSignUps
	SET NumberOfPpl = @NewNrOfPpl
	WHERE ConferenceSignUpID=@ConferenceSignUpID
END
GO
