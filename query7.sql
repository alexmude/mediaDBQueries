-- Counts of artists published at least 10 MPEG tracks. 

SELECT COUNT(*) AS TotalArtists
FROM (
    SELECT ar.ArtistId
    FROM tracks t
    JOIN albums al ON t.AlbumId = al.AlbumId
    JOIN artists ar ON al.ArtistId = ar.ArtistId
    JOIN media_types mt ON t.MediaTypeId = mt.MediaTypeId
    WHERE mt.Name LIKE '%MPEG%'
    GROUP BY ar.ArtistId
    HAVING COUNT(t.TrackId) >= 10
) AS artist_counts;