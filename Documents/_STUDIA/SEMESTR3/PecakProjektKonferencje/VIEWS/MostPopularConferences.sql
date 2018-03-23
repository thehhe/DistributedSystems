CREATE VIEW dbo.MostPopularConferences
	AS
	SELECT TOP 5 C.ConferenceID, C.Name, SUM(SU.NumberOfPpl) as PotentialAttenders
	FROM dbo.Conferences as C
		INNER JOIN dbo.ConferenceDays as CD on C.ConferenceID=CD.ConferenceID
		INNER JOIN dbo.ConferenceSignUps as SU on CD.ConferenceDayID=SU.ConferenceDayID
	WHERE SU.Cancelled IS NULL OR SU.Cancelled=0
	GROUP BY C.ConferenceID, C.Name
	ORDER BY PotentialAttenders DESC