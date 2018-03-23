CREATE TRIGGER checkAfterChangingWorkshopPlaces
ON dbo.Workshops
AFTER UPDATE
AS
BEGIN
	IF EXISTS (SELECT 'TRUE'
			   FROM inserted 
			   INNER JOIN WorkshopSignUps as WSU ON inserted.WorkshopID=WSU.WorkshopID
			   GROUP BY WSU.WorkshopSignUpID, inserted.Places
			   HAVING SUM(WSU.NumberOfPpl)>inserted.Places)
	BEGIN
		RAISERROR('ERROR: New limit is lower than the number of reservations.', 16, 1)
		ROLLBACK TRANSACTION
		RETURN
	END
END