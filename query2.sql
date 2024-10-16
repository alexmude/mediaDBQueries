-- List the name of each album and the artist who created it.

SELECT alb.title, art.name
from albums alb 
JOIN artists art on alb.AlbumId = art.ArtistId;