CREATE VIEW dbo.ShowCancelledConferences
	AS
	SELECT ConferenceID, Name, DateFrom, DateTo, Street, City, PostalCode, Country, Cancelled
	FROM dbo.Conferences
	WHERE (Cancelled=1)