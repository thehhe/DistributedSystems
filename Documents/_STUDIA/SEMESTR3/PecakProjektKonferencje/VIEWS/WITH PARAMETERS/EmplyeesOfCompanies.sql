CREATE PROCEDURE [dbo].[EmplyeesOfCompanies]
@param NVARCHAR(50) --CompanyName
AS
BEGIN
	SET NOCOUNT ON
	SELECT dbo.Customers.CompanyName AS CompanyName, dbo.People.PersonID, dbo.People.Name, dbo.People.Surname,
	dbo.People.Street, dbo.People.City, dbo.People.PostalCode, dbo.People.Country, dbo.People.Email,
	dbo.People.Phone
	FROM dbo.Customers INNER JOIN
	dbo.ConferenceSignUps ON dbo.Customers.CustomerID = dbo.ConferenceSignUps.CustomerID INNER JOIN
	dbo.SignedConferences ON dbo.ConferenceSignUps.ConferenceSignUpID = dbo.SignedConferences.ConferenceSignUpID INNER JOIN
	dbo.People ON dbo.SignedConferences.PersonID = dbo.People.PersonID
	WHERE (dbo.Customers.IsCompany = 1) AND dbo.Customers.CompanyName LIKE @param
END