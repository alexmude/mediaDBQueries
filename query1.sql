-- list last names and emails of all customers who made purchased in the store

SELECT c.FirstName, c.LastName
FROM customers c
JOIN invoices inv on c.CustomerId = inv.InvoiceId;