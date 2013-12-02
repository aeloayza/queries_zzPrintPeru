/* Query Sum of sales group by day, filter by date range */
select order_date,sum(amount) from c3rn2_phonecase_orders where order_date between '2013-02-28'and '2013-03-08' group by 		date(order_date);

/* Query that shows sales per AID (Affiliate ID) */
select id, order_no, order_date, amount from c3rn2_phonecase_orders where aid=1484;

/* Query show number of sales per product (filter by date range) (group by: day, week, month, or year)*/
/*week*/
select week(PO.order_date), O.case_id, O.case_name, sum(O.qty) from  c3rn2_phonecase_order_items as O inner join c3rn2_phonecase_orders as PO on (O.oid=PO.id)  where O.case_id='3' group by week(PO.order_date);
/*month*/
select month(PO.order_date), O.case_id, O.case_name, sum(O.qty) from  c3rn2_phonecase_order_items as O inner join c3rn2_phonecase_orders as PO on (O.oid=PO.id)  where O.case_id='3' group by month(PO.order_date);
/*year*/
select year(PO.order_date), O.case_id, O.case_name, sum(O.qty) from  c3rn2_phonecase_order_items as O inner join c3rn2_phonecase_orders as PO on (O.oid=PO.id)  where O.case_id='3' group by year(PO.order_date);
/* Query show number of sales per device (phone model)(filter by date range) (group by: day, week, month, or year)*/
/*week*/
Select week(PO.order_date), D.id, D.device_name, sum(O.qty) from  ((c3rn2_phonecase_order_items as O inner join c3rn2_phonecase_orders as PO on O.oid=PO.id) inner join (c3rn2_phonecase_cases as C inner join c3rn2_phonecase_devices D on (C.device_id=D.id)) on (O.case_id=C.id)) group by D.id, week(PO.order_date);
/*month*/
Select month(PO.order_date), D.id, D.device_name, sum(O.qty) from  ((c3rn2_phonecase_order_items as O inner join c3rn2_phonecase_orders as PO on O.oid=PO.id) inner join (c3rn2_phonecase_cases as C inner join c3rn2_phonecase_devices D on (C.device_id=D.id)) on (O.case_id=C.id)) group by D.id, month(PO.order_date);

