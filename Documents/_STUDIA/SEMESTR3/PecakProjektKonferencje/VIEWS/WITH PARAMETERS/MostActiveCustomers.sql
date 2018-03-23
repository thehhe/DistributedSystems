CREATE PROCEDURE [dbo].[MostActiveCustomers]
AS
BEGIN
	SET NOCOUNT ON
	SELECT Name+' '+Surname AS FullName, (SELECT COUNT(*)
										FROM dbo.ConferenceSignUps
										WHERE (dbo.Customers.CustomerID = CustomerID) AND dbo.ConferenceSignUps.Cancelled IS NULL) AS TimesParticipated
	FROM dbo.Customers
	WHERE (IsCompany = 0)
	GROUP BY CustomerID, Name+' '+Surname

	UNION

	SELECT CompanyName, (SELECT COUNT(*)
						 FROM dbo.ConferenceSignUps
						 WHERE (dbo.Customers.CustomerID = CustomerID) AND dbo.ConferenceSignUps.Cancelled IS NULL) AS TimesParticipated
	FROM dbo.Customers
	WHERE (IsCompany = 1)
	GROUP BY CustomerID, CompanyName
	ORDER BY TimesParticipated DESC
END