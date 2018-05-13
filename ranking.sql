-- PASO 1 Proporcione una consulta que incluya el nombre de la canción comprada Y el nombre del artista con cada línea de pedido de la factura.

select i.*, t.name as 'track', ar.name as 'artist'

from invoiceline as i

	join track as t on i.trackid = t.trackid

	join album as al on al.albumid = t.albumid

	join artist as ar on ar.artistid = al.artistid
  
  -- PASO 2 Proporcione una consulta que muestre el número total de pistas en cada lista de reproducción. El nombre de la lista de reproducción debe incluirse en la tabla resultante.

select *, count(trackid) as '# of tracks'

from playlisttrack, playlist

on playlisttrack.playlistid = playlist.playlistid

group by playlist.playlistid

-- ¿Qué agente de ventas hizo más ventas en 2009?

select *, max(total) from

(select e.*, sum(total) as 'Total'

from employee as e

	join customer as c on e.employeeid = c.supportrepid

	join invoice as i on i.customerid = c.customerid

where i.invoicedate between '2009-01-00' and '2009-12-31'

group by e.employeeid)



-- ¿Qué agente de ventas hizo más ventas en 2010?

select *, max(total) from

(select e.*, sum(total) as 'Total'

from employee as e

	join customer as c on e.employeeid = c.supportrepid

	join invoice as i on i.customerid = c.customerid

where i.invoicedate between '2010-01-00' and '2010-12-31'

group by e.employeeid)



-- PASO 3 Qué agente de ventas hizo lo máximo en ventas sobre todos?

select *, max(total) from

(select e.*, sum(total) as 'Total'

from employee as e

	join customer as c on e.employeeid = c.supportrepid

	join invoice as i on i.customerid = c.customerid

group by e.employeeid)




-- PASO 3 querie que provee Customers 
select customerid, firstname, lastname, country

from customer

where not country = 'USA';



select * from customer

where country = 'Argentina';



-- PASO 9 Proporcione una consulta que muestre el nombre del total de la factura, el nombre del cliente, el país y el agente de venta de todas las facturas y clientes.

select e.firstname as 'employee first', e.lastname as 'employee last', c.firstname as 'customer first', c.lastname as 'customer last', c.country, i.total

from employee as e

	join customer as c on e.employeeid = c.supportrepid

	join invoice as i on c.customerid = i.customerid


-- PASO 10 Proporcione una consulta que incluya el nombre de la pista con cada línea de pedido de la factura.

select i.*, t.name

from invoiceline as i, track as t

on i.trackid = t.trackid


--  PASO 11 Proporcione una consulta que muestre todas las Pistas, pero no muestre ninguna ID. La tabla resultante debe incluir el nombre del álbum, el tipo de medio y el género.

select t.name as 'track', t.composer, t.milliseconds, t.bytes, t.unitprice, a.title as 'album', g.name as 'genre', m.name as 'media type'

from track as t

	join album as a on a.albumid = t.albumid

	join genre as g on g.genreid = t.genreid

	join mediatype as m on m.mediatypeid = t.mediatypeid


-- PASO 12 Proporcione una consulta que muestre las ventas totales por país. ¿Qué clientes del país gastaron más?

select i.billingcountry, sum(total) as 'TotalSales'

from invoice as i

group by billingcountry

order by totalsales desc



