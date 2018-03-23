CREATE PROCEDURE [dbo].[PeopleSignedForWorkshop]
@param int --WorkshopID
AS
BEGIN
	SET NOCOUNT ON
	SELECT dbo.People.*
	FROM dbo.WorkshopSignUps INNER JOIN
		 dbo.SignedWorkshops ON dbo.WorkshopSignUps.WorkshopSignUpID = dbo.SignedWorkshops.WorkshopSignUpID INNER JOIN
		 dbo.SignedConferences ON dbo.SignedConferences.SignedConferenceID = dbo.SignedWorkshops.SignedConferenceID INNER JOIN
		 dbo.People ON dbo.People.PersonID = dbo.SignedConferences.PersonID
	WHERE dbo.WorkshopSignUps.WorkshopID=@param AND (dbo.WorkshopSignUps.Cancelled IS NULL OR dbo.WorkshopSignUps.Cancelled=0)
	ORDER BY dbo.People.PersonID
END
