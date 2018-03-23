CREATE VIEW dbo.ShowCancelledConferenceReservations
	AS
	SELECT ConferenceSignUpID, ConferenceDayID, CustomerID, SignUpDate, Price, NumberOfPpl, NumberOfStudents, Cancelled
	FROM dbo.ConferenceSignUps
	WHERE (Cancelled=1)