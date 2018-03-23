CREATE VIEW dbo.Companies 
	AS
	SELECT CompanyName, Phone, LoginName, Email, Street, City, PostalCode, Country
	FROM dbo.Customers
	WHERE IsCompany=1
