CREATE TRIGGER checkIfPersonCanAttendWorkshop
ON dbo.SignedWorkshops
AFTER INSERT
AS
BEGIN
	IF (SELECT COUNT(*)
		FROM inserted as SU INNER JOIN
			 dbo.WorkshopSignUps as WSU ON WSU.WorkshopSignUpID=SU.WorkshopSignUpID INNER JOIN
			 dbo.Workshops as W ON W.WorkshopID=WSU.WorkshopID INNER JOIN
			 dbo.ConferenceDays as CD ON CD.ConferenceDayID=W.ConferenceDayID INNER JOIN
			 dbo.SignedConferences as SC ON SC.SignedConferenceID=SU.SignedConferenceID INNER JOIN
			 dbo.ConferenceDays as CD2 ON CD2.CDay=CD.CDay INNER JOIN
			 dbo.Workshops as W2 ON W2.ConferenceDayID=CD2.ConferenceDayID
		WHERE (W.BeginHour<W2.EndHour AND W.EndHour>W2.BeginHour)
		)>1
		OR
		(SELECT COUNT(*)
		 FROM inserted as SU INNER JOIN
		      dbo.WorkshopSignUps as WSU ON WSU.WorkshopSignUpID=SU.WorkshopSignUpID INNER JOIN
			  dbo.SignedConferences as SC ON SC.SignedConferenceID=SU.SignedConferenceID INNER JOIN
			  dbo.SignedWorkshops as SW2 ON SW2.WorkshopSignUpID=WSU.WorkshopSignUpID INNER JOIN
			  dbo.SignedConferences as SC2 ON SC2.SignedConferenceID=SW2.SignedConferenceID
		 WHERE SC2.PersonID=SC.PersonID)>1
	BEGIN
		RAISERROR('ERROR: Person already signed for this workshop or has another during desired workshop time.', 16, 1)
		ROLLBACK TRANSACTION
		RETURN
	END
END