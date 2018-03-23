CREATE PROCEDURE [dbo].[CustomersPayments]
@param int --CustomerID
AS
BEGIN
	SET NOCOUNT ON
	SELECT dbo.Conferences.Name AS Conference,
		   dbo.Customers.Name+' '+dbo.Customers.Surname AS Customer,
	       dbo.ConferenceSignUps.Price AS Cost,
		   (SELECT SUM(ISNULL(P.Payment,0)) FROM ConferenceSignUps AS CS LEFT JOIN
												 Payments as P ON CS.ConferenceSignUpID=P.ConferenceSignUpID
											WHERE CS.ConferenceSignUpID=dbo.ConferenceSignUps.ConferenceSignUpID AND dbo.ConferenceSignUps.Cancelled IS NULL) AS AlreadyPaid,
		   dbo.ConferenceSignUps.Price - (SELECT SUM(ISNULL(P.Payment,0)) FROM ConferenceSignUps AS CS LEFT JOIN
																			   Payments as P ON CS.ConferenceSignUpID=P.ConferenceSignUpID
																		  WHERE CS.ConferenceSignUpID=dbo.ConferenceSignUps.ConferenceSignUpID AND dbo.ConferenceSignUps.Cancelled IS NULL) AS ToPay
	FROM dbo.ConferenceSignUps INNER JOIN
		 dbo.Customers ON dbo.ConferenceSignUps.CustomerID = dbo.Customers.CustomerID INNER JOIN
		 dbo.ConferenceDays ON dbo.ConferenceSignUps.ConferenceDayID = dbo.ConferenceDays.ConferenceDayID INNER JOIN
		 dbo.Conferences ON dbo.ConferenceDays.ConferenceID=dbo.Conferences.ConferenceID
	WHERE dbo.Customers.CustomerID=@param AND dbo.Customers.IsCompany = 0 AND dbo.ConferenceSignUps.Cancelled IS NULL

	UNION

	SELECT dbo.Conferences.Name AS Conference, 
		   dbo.Customers.CompanyName AS Customer,
		   dbo.ConferenceSignUps.Price AS Cost,
		   (SELECT SUM(ISNULL(P.Payment,0)) FROM ConferenceSignUps as CS LEFT JOIN
												 Payments as P ON CS.ConferenceSignUpID=P.ConferenceSignUpID
											WHERE CS.ConferenceSignUpID=dbo.ConferenceSignUps.ConferenceSignUpID AND dbo.ConferenceSignUps.Cancelled IS NULL) AS AlreadyPaid,
		   dbo.ConferenceSignUps.Price - (SELECT SUM(ISNULL(P.Payment,0)) FROM ConferenceSignUps AS CS LEFT JOIN
																				Payments as P ON CS.ConferenceSignUpID=P.ConferenceSignUpID
																		   WHERE CS.ConferenceSignUpID=dbo.ConferenceSignUps.ConferenceSignUpID AND dbo.ConferenceSignUps.Cancelled IS NULL) AS ToPay
	FROM dbo.ConferenceSignUps INNER JOIN
		 dbo.Customers ON dbo.ConferenceSignUps.CustomerID = dbo.Customers.CustomerID INNER JOIN
		 dbo.ConferenceDays ON dbo.ConferenceSignUps.ConferenceDayID = dbo.ConferenceDays.ConferenceDayID INNER JOIN
		 dbo.Conferences ON dbo.ConferenceDays.ConferenceID=dbo.Conferences.ConferenceID
	WHERE dbo.Customers.CustomerID=@param AND dbo.Customers.IsCompany = 1 AND dbo.ConferenceSignUps.Cancelled IS NULL
END