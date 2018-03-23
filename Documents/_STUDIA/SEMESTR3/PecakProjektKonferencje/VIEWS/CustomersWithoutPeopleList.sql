CREATE VIEW dbo.CustomersWithoutPeopleList
	AS
	SELECT Cust.Name+' '+Cust.Surname as Name, Phone, LoginName, Email, C.Name as ConferenceName,
		   SignUps.NumberOfPpl as SignedPeople, SignUps.NumberOfPpl-(SELECT COUNT(*)
																	 FROM dbo.SignedConferences as S
																	 WHERE S.ConferenceSignUpID=SignUps.ConferenceSignUpID) as PeopleMissing
	FROM dbo.Customers as Cust
		INNER JOIN dbo.ConferenceSignUps as SignUps ON SignUps.CustomerID=Cust.CustomerID
		INNER JOIN dbo.ConferenceDays as CD ON SignUps.ConferenceDayID=CD.ConferenceDayID
		INNER JOIN dbo.Conferences as C ON CD.ConferenceID=C.ConferenceID
	WHERE DATEADD(DAY, 14, GETDATE())>=C.DateFrom AND (SignUps.Cancelled=0 OR SignUps.Cancelled IS NULL) AND (Cust.IsCompany=0 OR Cust.IsCompany IS NULL)
		  AND SignUps.NumberOfPpl-(SELECT COUNT(*)
							       FROM dbo.SignedConferences as S
							       WHERE S.ConferenceSignUpID=SignUps.ConferenceSignUpID)>0
	
	UNION

	SELECT CompanyName, Phone, LoginName, Email, C.Name as ConferenceName,
		   SignUps.NumberOfPpl as SignedPeople, SignUps.NumberOfPpl-(SELECT COUNT(*)
																	 FROM dbo.SignedConferences as S
																	 WHERE S.ConferenceSignUpID=SignUps.ConferenceSignUpID) as PeopleMissing
	FROM dbo.Customers as Cust
		INNER JOIN dbo.ConferenceSignUps as SignUps ON SignUps.CustomerID=Cust.CustomerID
		INNER JOIN dbo.ConferenceDays as CD ON SignUps.ConferenceDayID=CD.ConferenceDayID
		INNER JOIN dbo.Conferences as C ON CD.ConferenceID=C.ConferenceID
	WHERE DATEADD(DAY, 14, GETDATE())>=C.DateFrom AND (SignUps.Cancelled=0 OR SignUps.Cancelled IS NULL) 
	      AND SignUps.NumberOfPpl-(SELECT COUNT(*)
								   FROM dbo.SignedConferences as S
								   WHERE S.ConferenceSignUpID=SignUps.ConferenceSignUpID)>0