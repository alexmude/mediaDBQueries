/* List the names of all artists who performed MPEG (video or audio) tracks in either the "Brazilian Music" 
or the "Grunge" playlists */

SELECT DISTINCT ar.Name AS ArtistName
FROM playlist_track pt
JOIN playlists pl ON pt.PlaylistId = pl.PlaylistId
JOIN tracks t ON pt.TrackId = t.TrackId
JOIN albums al ON t.AlbumId = al.AlbumId
JOIN artists ar ON al.ArtistId = ar.ArtistId
JOIN media_types mt ON t.MediaTypeId = mt.MediaTypeId
WHERE pl.Name IN ('Brazilian Music', 'Grunge')
AND mt.Name LIKE '%MPEG%';