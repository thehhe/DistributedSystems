CREATE VIEW dbo.IndividualCustomers
	AS
	SELECT Name, Surname, Phone, LoginName, Email, Street, City, PostalCode, Country
	FROM dbo.Customers
	WHERE IsCompany IS NULL OR IsCompany=0