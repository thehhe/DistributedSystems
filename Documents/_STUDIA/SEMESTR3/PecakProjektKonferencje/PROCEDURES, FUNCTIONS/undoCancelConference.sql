SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE undoCancelConference
	@ConferenceID int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.Conferences
	SET Cancelled=0
	WHERE dbo.Conferences.ConferenceID=@ConferenceID

	DECLARE @buffor int
	DECLARE c CURSOR LOCAL FOR
		SELECT ConferenceDayID FROM dbo.ConferenceDays
		WHERE dbo.ConferenceDays.ConferenceID=@ConferenceID

	OPEN c 
	FETCH NEXT FROM c INTO @buffor
	WHILE @@FETCH_STATUS=0
	BEGIN
		EXEC undoCancelConferenceDay @buffor
		FETCH NEXT FROM c INTO @buffor
	END

	CLOSE c
	DEALLOCATE c

END
GO
