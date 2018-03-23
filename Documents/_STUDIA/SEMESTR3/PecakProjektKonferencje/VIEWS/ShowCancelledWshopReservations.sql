CREATE VIEW dbo.ShowCancelledWshopReservations
AS
SELECT WorkshopSignUpID, WorkshopID, ConferenceSignUpID, NumberOfPpl, NumberOfStudents, Cancelled
FROM dbo.WorkshopSignUps
WHERE (Cancelled=1)