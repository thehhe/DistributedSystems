SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE cancelConferenceDay
	@ConferenceDayID int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @buffor int
	DECLARE c CURSOR LOCAL FOR
		SELECT CSU.ConferenceSignUpID FROM dbo.ConferenceSignUps as CSU
		WHERE CSU.ConferenceDayID=@ConferenceDayID

	OPEN c
	FETCH NEXT FROM c INTO @buffor
	WHILE @@FETCH_STATUS=0
	BEGIN
		EXEC cancelReservation @buffor
		FETCH NEXT FROM c INTO @buffor
	END

	CLOSE c
	DEALLOCATE c

	UPDATE dbo.Workshops
	SET Cancelled=1
	WHERE Workshops.ConferenceDayID=@ConferenceDayID
END
GO
