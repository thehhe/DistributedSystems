CREATE PROCEDURE [dbo].[GenerateIDs]
@param INT --­­ConferenceDayId
AS
BEGIN
	SET NOCOUNT ON
	SELECT dbo.People.Name, dbo.People.Surname, dbo.Customers.CompanyName AS 'Name'
	FROM dbo.SignedConferences INNER JOIN
		 dbo.ConferenceSignUps ON dbo.ConferenceSignUps.ConferenceSignUpID = dbo.SignedConferences.ConferenceSignUpID INNER JOIN
		 dbo.Customers ON dbo.Customers.CustomerID = dbo.ConferenceSignUps.CustomerID INNER JOIN
		 dbo.People ON dbo.SignedConferences.PersonID = dbo.People.PersonID
	WHERE dbo.ConferenceSignUps.ConferenceDayID=@param AND (dbo.ConferenceSignUps.Cancelled IS NULL OR dbo.ConferenceSignUps.Cancelled=0)
END