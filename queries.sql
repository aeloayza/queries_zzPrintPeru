/* Query Sum of sales group by day, filter by date range */
select order_date,sum(amount) from c3rn2_phonecase_orders where order_date between '2013-02-28'and '2013-03-08' group by 		date(order_date);

/* Query that shows sales per AID (Affiliate ID) */
select id, order_no, order_date, amount from c3rn2_phonecase_orders where aid=1484;

