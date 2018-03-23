CREATE TRIGGER checkConferenceDayLimit
ON dbo.ConferenceSignUps
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS (SELECT 'TRUE'
			   FROM inserted 
			   JOIN ConferenceDays as CD ON inserted.ConferenceDayID=CD.ConferenceDayID
			   JOIN ConferenceSignUps as CSU ON CD.ConferenceDayID=CSU.ConferenceDayID
			   WHERE inserted.ConferenceDayID=CD.ConferenceDayID
			   GROUP BY CSU.ConferenceDayID, CD.Places
			   HAVING SUM(CSU.NumberOfPpl)>CD.Places)
	BEGIN
		RAISERROR('The limit has been exceeded.', 16, 1)
		ROLLBACK TRANSACTION
		RETURN
	END
END