SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE undoCancelWorkshopReservation
	@WorkshopSignUpID int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.WorkshopSignUps
	SET Cancelled=0
	WHERE dbo.WorkshopSignUps.WorkshopSignUpID=@WorkshopSignUpID
END
GO
