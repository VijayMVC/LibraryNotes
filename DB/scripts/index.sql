use LibraryNotes

-- exec [dbo].[OrdersSelectAll]


-- select id, Order_date from orders

-- drop index [Orders].ordersIndex
create  index ordersIndex
on [dbo].[Orders](Order_date asc)