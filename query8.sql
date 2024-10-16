/* List the playlist id and name of only those playlists that are longer than 2 hours,
 along with the length in hours rounded to two decimals. */

SELECT pl.PlaylistId, pl.Name, ROUND(SUM(t.Milliseconds / 3600000.0), 2) AS LengthInHours
FROM playlists pl
JOIN playlist_track pt ON pl.PlaylistId = pt.PlaylistId
JOIN tracks t ON pt.TrackId = t.TrackId
GROUP BY pl.PlaylistId, pl.Name
HAVING LengthInHours > 2
ORDER BY LengthInHours DESC;


SELECT 