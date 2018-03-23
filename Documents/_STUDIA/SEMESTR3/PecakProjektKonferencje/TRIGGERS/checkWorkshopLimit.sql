CREATE TRIGGER checkWorkshopLimit
ON dbo.WorkshopSignUps
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS (SELECT 'TRUE'
			   FROM inserted 
			   INNER JOIN Workshops as W ON inserted.WorkshopID=W.WorkshopID
			   INNER JOIN WorkshopSignUps as WSU ON inserted.WorkshopID=WSU.WorkshopID
			   GROUP BY W.WorkshopID, W.Places
			   HAVING SUM(WSU.NumberOfPpl)>W.Places)
	BEGIN
		RAISERROR('ERROR: The limit has been exceeded.', 16, 1)
		ROLLBACK TRANSACTION
		RETURN
	END
END