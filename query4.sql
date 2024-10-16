--  List states have more than 10 unique customers.

select State, count(distinct customerId) as unique_customers
from customers
group by state
having count(distinct customerId) > 10

