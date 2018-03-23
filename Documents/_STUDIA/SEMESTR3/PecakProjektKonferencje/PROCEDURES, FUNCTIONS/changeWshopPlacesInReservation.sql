SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE changeWshopPlacesInReservation
	@WorkshopSignUpID int,
	@NewNrOfPpl int
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.WorkshopSignUps
	SET NumberOfPpl = @NewNrOfPpl
	WHERE WorkshopSignUpID=@WorkshopSignUpID
END
GO
