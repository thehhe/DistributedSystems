CREATE VIEW dbo.ShowNotPaidReservations
AS
SELECT dbo.ConferenceSignUps.ConferenceSignUpID, dbo.Customers.Name + ' ' + dbo.Customers.Surname AS Name, dbo.Customers.Phone, dbo.ConferenceSignUps.Price - (SELECT SUM(ISNULL(P.Payment, 0))
																																					FROM ConferenceSignUps CS LEFT JOIN
																																						 Payments as P ON CS.ConferenceSignUpID = P.ConferenceSignUpID
																																					WHERE CS.ConferenceSignUpID = dbo.ConferenceSignUps.ConferenceSignUpID AND (dbo.ConferenceSignUps.Cancelled IS NULL OR dbo.ConferenceSignUps.Cancelled=0)) AS ToPay,
																																					dbo.Conferences.Name AS 'Conference', dbo.ConferenceDays.CDay
FROM dbo.ConferenceSignUps LEFT JOIN
	 dbo.Customers ON dbo.ConferenceSignUps.CustomerID = dbo.Customers.CustomerID LEFT JOIN
	 dbo.ConferenceDays ON dbo.ConferenceDays.ConferenceDayID = dbo.ConferenceSignUps.ConferenceDayID LEFT JOIN
	 dbo.Conferences ON dbo.Conferences.ConferenceID = dbo.ConferenceDays.ConferenceID
WHERE (dbo.Customers.IsCompany = 0) AND (dbo.ConferenceSignUps.Cancelled IS NULL OR dbo.ConferenceSignUps.Cancelled=0) AND dbo.ConferenceSignUps.Price - (SELECT SUM(ISNULL(P.Payment, 0))
																										   FROM ConferenceSignUps AS CS LEFT JOIN
																											    Payments AS P ON P.ConferenceSignUpID=CS.ConferenceSignUpID
																										   WHERE CS.ConferenceSignUpID = dbo.ConferenceSignUps.ConferenceSignUpID AND dbo.ConferenceSignUps.Cancelled IS NULL) > 0 AND dbo.ConferenceDays.CDay >= DATEADD(day, 14, GETDATE())
UNION

SELECT dbo.ConferenceSignUps.ConferenceSignUpID, dbo.Customers.CompanyName, dbo.Customers.Phone, dbo.ConferenceSignUps.Price - (SELECT SUM(ISNULL(P.Payment, 0))
																											  FROM ConferenceSignUps as CS LEFT JOIN
																												   Payments as P ON CS.ConferenceSignUpID=P.ConferenceSignUpID
																											  WHERE CS.ConferenceSignUpID = dbo.ConferenceSignUps.ConferenceSignUpID AND dbo.ConferenceSignUps.Cancelled IS NOT NULL) AS ToPay,
																											  dbo.Conferences.Name AS 'Conference', dbo.ConferenceDays.CDay
FROM dbo.ConferenceSignUps LEFT JOIN
	 dbo.Customers ON dbo.ConferenceSignUps.CustomerID = dbo.Customers.CustomerID LEFT JOIN
	 dbo.ConferenceDays ON dbo.ConferenceDays.ConferenceDayID = dbo.ConferenceSignUps.ConferenceDayID LEFT JOIN
	 dbo.Conferences ON dbo.Conferences.ConferenceID = dbo.ConferenceDays.ConferenceID
WHERE (dbo.Customers.IsCompany = 1) AND dbo.ConferenceSignUps.Cancelled IS NULL AND dbo.ConferenceSignUps.Price - (SELECT SUM(ISNULL(P.Payment, 0))
																										  FROM ConferenceSignUps as CS LEFT JOIN
																											   Payments as P ON CS.ConferenceSignUpID=P.ConferenceSignUpID
																										  WHERE CS.ConferenceSignUpID = dbo.ConferenceSignUps.ConferenceSignUpID AND dbo.ConferenceSignUps.Cancelled IS NULL) > 0 AND dbo.ConferenceDays.CDay >= DATEADD(day, 14, GETDATE())