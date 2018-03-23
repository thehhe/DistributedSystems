SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE undoCancelWorkshop
	@WorkshopID int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.Workshops
	SET Cancelled=0
	WHERE dbo.Workshops.WorkshopID=@WorkshopID

	DECLARE @buffor int
	DECLARE c CURSOR LOCAL FOR
		SELECT WorkshopSignUpID FROM dbo.WorkshopSignUps
		WHERE dbo.WorkshopSignUps.WorkshopID=@WorkshopID

	OPEN c 
	FETCH NEXT FROM c INTO @buffor
	WHILE @@FETCH_STATUS=0
	BEGIN
		EXEC undoCancelWorkshopReservation @buffor
		FETCH NEXT FROM c INTO @buffor
	END

	CLOSE c
	DEALLOCATE c
END
GO
