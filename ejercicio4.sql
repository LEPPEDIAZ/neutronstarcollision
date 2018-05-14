select c.firstname, c.lastname, i.invoiceid, i.invoicedate, i.billingcountry

from customer as c, invoice as i

where c.country = 'Brazil' and

c.customerid = i.customerid;



select e.firstname, e.lastname, i.invoiceid, i.customerid, i.invoicedate, i.billingaddress, i.billingcountry, i.billingpostalcode, i.total

from customer as c, invoice as i

on c.customerid = i.customerid

join employee as e

on e.employeeid = c.supportrepid

order by e.employeeid;



select e.firstname as 'employee first', e.lastname as 'employee last', c.firstname as 'customer first', c.lastname as 'customer last', c.country, i.total

from employee as e

	join customer as c on e.employeeid = c.supportrepid

	join invoice as i on c.customerid = i.customerid
  
  
select count(i.invoicelineid)

from invoiceline as i

where i.invoiceid = 37


select invoiceid, count(invoicelineid)

from invoiceline

group by invoiceid


select i.*, t.name

from invoiceline as i, track as t

on i.trackid = t.trackid


select invoice.*, count(invoiceline.invoicelineid) as '# of line items'

from invoice, invoiceline

on invoice.invoiceid = invoiceline.invoiceid

group by invoice.invoiceid


select e.*, count(i.invoiceid) as 'Total Number of Sales'

from employee as e

	join customer as c on e.employeeid = c.supportrepid

	join invoice as i on i.customerid = c.customerid

group by e.employeeid





