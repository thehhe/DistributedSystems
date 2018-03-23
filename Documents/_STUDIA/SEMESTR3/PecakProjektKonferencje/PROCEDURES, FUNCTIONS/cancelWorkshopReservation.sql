SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE cancelWorkshopReservation
	@WorkshopSignUpID int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE WorkshopSignUps
	SET Cancelled=1
	WHERE WorkshopSignUpID=@WorkshopSignUpID
END
GO
