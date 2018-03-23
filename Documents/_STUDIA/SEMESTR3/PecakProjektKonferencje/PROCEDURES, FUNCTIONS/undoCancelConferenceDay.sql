SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE undoCancelConferenceDay
	@ConferenceDayID int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @buffor int
	DECLARE c CURSOR LOCAL FOR
		SELECT ConferenceSignUpID FROM dbo.ConferenceSignUps
		WHERE dbo.ConferenceSignUps.ConferenceSignUpID=@ConferenceDayID

	OPEN c 
	FETCH NEXT FROM c INTO @buffor
	WHILE @@FETCH_STATUS=0
	BEGIN
		EXEC undoCancelReservation @buffor
		FETCH NEXT FROM c INTO @buffor
	END

	CLOSE c
	DEALLOCATE c

	UPDATE dbo.Workshops
	SET Cancelled=0
	WHERE dbo.Workshops.ConferenceDayID=@ConferenceDayID
END
GO
