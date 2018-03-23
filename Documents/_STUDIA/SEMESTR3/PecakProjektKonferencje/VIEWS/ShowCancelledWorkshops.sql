CREATE VIEW dbo.ShowCancelledWorkshops
AS
SELECT WorkshopID, ConferenceDayID, Name, BeginHour, EndHour, Places, Price
FROM Workshops
WHERE Cancelled=1