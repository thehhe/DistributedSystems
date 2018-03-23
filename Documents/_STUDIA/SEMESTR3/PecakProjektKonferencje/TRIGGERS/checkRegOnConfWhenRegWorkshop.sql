CREATE TRIGGER checkRegOnConfWhenRegWorkshop
ON dbo.SignedWorkshops
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS(SELECT *
			  FROM inserted as SW INNER JOIN
			  dbo.WorkshopSignUps as WSU ON WSU.WorkshopSignUpID=SW.WorkshopSignUpID INNER JOIN
			  dbo.Workshops as W ON W.WorkshopID=WSU.WorkshopID INNER JOIN
			  dbo.SignedConferences as SC ON SC.SignedConferenceID=SW.SignedConferenceID INNER JOIN
			  dbo.ConferenceSignUps as CSU ON CSU.ConferenceSignUpID=SC.ConferenceSignUpID
			  WHERE W.ConferenceDayID!=CSU.ConferenceDayID)
	BEGIN
		RAISERROR('ERROR: Reservation is not made for that conference day.', 16, 1)
		ROLLBACK TRANSACTION
		RETURN
	END
END