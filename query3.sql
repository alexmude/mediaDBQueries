--  List of total number of unique customers for each state, ordered alphabetically by state

SELECT State, count(distinct customerId) as unique_customers
from customers
GROUP by state
order by state;