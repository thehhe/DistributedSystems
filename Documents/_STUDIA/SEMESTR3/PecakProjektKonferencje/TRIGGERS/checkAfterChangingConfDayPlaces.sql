CREATE TRIGGER checkAfterChangingConfDayPlaces
ON dbo.ConferenceDays
AFTER UPDATE
AS
BEGIN
	IF EXISTS (SELECT 'TRUE'
			   FROM inserted 
			   INNER JOIN ConferenceSignUps as CSU ON inserted.ConferenceDayID=CSU.ConferenceDayID
			   WHERE inserted.ConferenceDayID=CSU.ConferenceDayID
			   GROUP BY CSU.ConferenceDayID, inserted.Places
			   HAVING SUM(CSU.NumberOfPpl)>inserted.Places)
	BEGIN
		RAISERROR('ERROR: New limit is lower than the number of reservations.', 16, 1)
		ROLLBACK TRANSACTION
		RETURN
	END
END