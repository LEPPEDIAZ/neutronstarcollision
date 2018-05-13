-- Paso 1 Proporcione una consulta que incluya el nombre de la canción comprada Y el nombre del artista con cada línea de pedido de la factura.

select i.*, t.name as 'track', ar.name as 'artist'

from invoiceline as i

	join track as t on i.trackid = t.trackid

	join album as al on al.albumid = t.albumid

	join artist as ar on ar.artistid = al.artistid

-- Paso 2 Proporcione una consulta que muestre todas las Pistas, pero no muestre ninguna ID. La tabla resultante debe incluir el nombre del álbum, el tipo de medio y el género.

select t.name as 'track', t.composer, t.milliseconds, t.bytes, t.unitprice, a.title as 'album', g.name as 'genre', m.name as 'media type'

from track as t

	join album as a on a.albumid = t.albumid

	join genre as g on g.genreid = t.genreid

	join mediatype as m on m.mediatypeid = t.mediatypeid



-- Paso 3 Proporcione una consulta que muestre las ventas totales realizadas por cada agente de ventas.

select e.*, count(i.invoiceid) as 'Total Number of Sales'

from employee as e

	join customer as c on e.employeeid = c.supportrepid

	join invoice as i on i.customerid = c.customerid

group by e.employeeid

-- Paso 4 Proporcione una consulta que muestre la cantidad de clientes asignados a cada agente de ventas.
select i.*, t.name as 'track', ar.name as 'artist'
from invoiceline as i, custumer as c
  join invoice as i on c.customerid = i.customerid

	join track as t on i.trackid = t.trackid

	join album as al on al.albumid = t.albumid

	join artist as ar on ar.artistid = al.artistid



seleccione e. *, count (c.customerid) como 'TotalCustomers'

del empleado como e

unirse al cliente como c en e.employeeid = c.supportrepid

grupo por e.employeeid



-- Paso 5 Proporcione una consulta que muestre las ventas totales por país. ¿Qué clientes del país gastaron más?

seleccione i.billingcountry, sum (total) como 'TotalSales'

de la factura como yo

grupo por billingcountry

orden por totalsales desc



-- Paso 6 Proporcione una consulta que muestre la pista más comprada de 2013.

select *, count (t.trackid) como recuento

de invoiceline como il

unir factura como yo en i.invoiceid = il.invoiceid

unir track como t en t.trackid = il.trackid

donde i.invoicedate entre '2013-01-01' y '2013-12-31'

grupo por t.trackid

orden por cuenta desc

--Paso 7 preferencias de los clientes
seleccione e. *, count (i.invoiceid) como 'Preferencias de los clientes'

del empleado como e

unirse al cliente como c en e.employeeid = c.supportrepid

unir factura como yo en i.customerid = c.customerid

grupo por e.employeeid

