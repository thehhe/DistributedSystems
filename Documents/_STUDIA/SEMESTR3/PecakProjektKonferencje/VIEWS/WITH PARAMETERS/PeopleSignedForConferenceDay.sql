CREATE PROCEDURE [dbo].[PeopleSignedForConferenceDay]
@param int --ConfDayOD
AS
BEGIN
	SET NOCOUNT ON
	SELECT dbo.People.*
	FROM dbo.SignedConferences LEFT JOIN
		 dbo.ConferenceSignUps ON dbo.ConferenceSignUps.ConferenceSignUpID=dbo.SignedConferences.ConferenceSignUpID LEFT JOIN
		 dbo.People ON dbo.People.PersonID = dbo.SignedConferences.PersonID
	WHERE dbo.ConferenceSignUps.ConferenceDayID=@param AND (dbo.ConferenceSignUps.Cancelled IS NULL OR dbo.ConferenceSignUps.Cancelled=0)
END