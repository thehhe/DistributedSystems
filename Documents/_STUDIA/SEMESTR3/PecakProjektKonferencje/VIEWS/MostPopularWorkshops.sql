CREATE VIEW dbo.MostPopularWorkshops
	AS
	SELECT TOP 5 dbo.Workshops.WorkshopID, dbo.Workshops.Name, SUM(dbo.WorkshopSignUps.NumberOfPpl) AS Attenders
	FROM dbo.WorkshopSignUps INNER JOIN
		 dbo.Workshops ON dbo.WorkshopSignUps.WorkshopID = dbo.Workshops.WorkshopID
	WHERE (dbo.WorkshopSignUps.Cancelled IS NULL OR dbo.WorkshopSignUps.Cancelled=0)
	GROUP BY dbo.Workshops.WorkshopID, dbo.Workshops.Name
	ORDER BY Attenders DESC