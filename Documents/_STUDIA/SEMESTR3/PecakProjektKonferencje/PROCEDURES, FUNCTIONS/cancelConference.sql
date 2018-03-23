SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE cancelConference
	@ConferenceID int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.Conferences
	SET Cancelled=1
	WHERE dbo.Conferences.ConferenceID=@ConferenceID

	DECLARE @buffor int
	DECLARE c CURSOR LOCAL FOR
		SELECT CD.ConferenceDayID FROM dbo.ConferenceDays as CD 
		WHERE CD.ConferenceID=@ConferenceID
	OPEN c
	FETCH NEXT FROM c INTO @buffor
	WHILE @@FETCH_STATUS=0
	BEGIN
		EXEC cancelConferenceDay @buffor
		FETCH NEXT FROM c INTO @buffor
	END

	CLOSE c
	DEALLOCATE c
END
GO
