SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE undoCancelReservation
	@ConferenceSignUpID int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.ConferenceSignUps
	SET Cancelled=0
	WHERE dbo.ConferenceSignUps.ConferenceDayID=@ConferenceSignUpID

	DECLARE @buffor int
	DECLARE c CURSOR LOCAL FOR
		SELECT WorkshopSignUpID FROM dbo.WorkshopSignUps
		WHERE dbo.WorkshopSignUps.ConferenceSignUpID=@ConferenceSignUpID

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
