/* calculates the cumulative total sales in dollar
for each invoice and ranks the invoices based on the total sales amount */

WITH InvoiceTotals AS (
    SELECT 
        i.InvoiceId, 
        i.CustomerId,
        i.InvoiceDate,
        SUM(ii.UnitPrice * ii.Quantity) AS TotalInvoiceSales
    FROM invoices i
    JOIN invoice_items ii ON i.InvoiceId = ii.InvoiceId
    GROUP BY i.InvoiceId, i.CustomerId, i.InvoiceDate
)
SELECT 
    it.InvoiceId,
    it.CustomerId,
    it.InvoiceDate,
    it.TotalInvoiceSales,
    SUM(it.TotalInvoiceSales) OVER (PARTITION BY it.CustomerId ORDER BY it.InvoiceDate) AS CumulativeSales,
    ROW_NUMBER() OVER (PARTITION BY it.CustomerId ORDER BY it.TotalInvoiceSales DESC) AS InvoiceRank
FROM InvoiceTotals it
ORDER BY it.CustomerId, InvoiceRank;