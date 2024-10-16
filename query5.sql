-- List names of the artists who made an album containing the substring "symphony" in the album title 

SELECT ar.Name AS ArtistName
FROM albums al
JOIN artists ar ON al.ArtistId = ar.ArtistId
WHERE al.Title LIKE '%symphony%'