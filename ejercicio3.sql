select i.*, t.name as 'track', ar.name as 'artist'

from invoiceline as i

	join track as t on i.trackid = t.trackid

	join album as al on al.albumid = t.albumid

	join artist as ar on ar.artistid = al.artistid


select t.name as 'track', t.composer, t.milliseconds, t.bytes, t.unitprice, a.title as 'album', g.name as 'genre', m.name as 'media type'

from track as t

	join album as a on a.albumid = t.albumid

	join genre as g on g.genreid = t.genreid

	join mediatype as m on m.mediatypeid = t.mediatypeid
