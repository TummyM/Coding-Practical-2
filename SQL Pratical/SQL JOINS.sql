---------------------------------------------------------------------------------------------------------
---Q1. List all orders along with customer name and product name
---Expected ouput: Orderid, orderdate, customername, productname and quantity
SELECT orderid,
       orderdate,
       customername,
       productname,
       quantity
FROM LEARN.BAT.P2 as A
INNER JOIN INFO_SET.DAT.P2 AS B
ON A.productid=B.productid
INNER JOIN BAT.DATA.P2 AS C ON A.CustomerID=C.CustomerID;
---------------------------------------------------------------------------------------------------------
---Q2.Which customers have placed at least one order
---Expected output: Customerid, customername, country, orderid and orderdate
SELECT A.customerid,
        customername,
       country,
       orderid,
       orderdate
FROM LEARN.BAT.P2 AS A
INNER JOIN BAT.DATA.P2 AS B
ON A.Customerid=B.Customerid
WHERE quantity>=1;
---------------------------------------------------------------------------------------------------------
---Q3. List all customers and any orders they might have placed. include customers who have not placed any orders
---Expected output: Customerid, customername, country, orderid, orederdate, productid and quantity
SELECT X.customerid,
       customername,
       country,
       orderid,
       orderdate,
       productid,
       quantity
FROM LEARN.BAT.P2 AS X
LEFT JOIN BAT.DATA.P2 AS Y
ON X.Customerid=Y.customerid;
---------------------------------------------------------------------------------------------------------
---Q4. List all products and how many times each was ordered(if any)
---Expected output: Prouctid, productname and totalorders
SELECT B.productid,
       productname,
       COUNT (C.productid) AS totalorders
FROM LEARN.BAT.P2 AS B
LEFT JOIN INFO_SET.DAT.P2 AS C
ON B.productid=C.productid
GROUP BY B.productid,
         productname
ORDER BY totalorders DESC;
---------------------------------------------------------------------------------------------------------
---Q5.Find all orders along with product details, including any products that might not have been ordered
---Expected output: Orderid, orderdate, productname,price and quantity
SELECT orderid,
       orderdate,
       y.productid,
       productname,
       price,
       quantity
FROM LEARN.BAT.P2 AS X
RIGHT JOIN INFO_SET.DAT.P2 AS Y
ON X.productid=Y.productid;
---------------------------------------------------------------------------------------------------------
---Q6.Which customers have made orders, and include customers even if they have placed an order
---Expected output: Customeid, customername, country, orderid, orderdate, productid and quantity
SELECT V.customerid,
       customername,
       country,
       orderid,
       orderdate,
       productid,
       quantity
FROM LEARN.BAT.P2 AS V
RIGHT JOIN BAT.DATA.P2 AS R
ON V.customerid=R.customerid;
---------------------------------------------------------------------------------------------------------
---Q7. List all products and orders, showing NULLs where products were never ordered or orders are missing product info.
SELECT W.customerid,
       customername,
       country,
       orderid,
       orderdate,
       productid,
       quantity
FROM BAT.DATA.P2 AS Z
FULL OUTER JOIN LEARN.BAT.P2 AS W
ON Z.customerid=W.customerid;
---------------------------------------------------------------------------------------------------------
---Q8. List all products and orders, showing NULLS where products where never ordered or orders are missing product info.
---Expected output: Productid, productname, price, orderid, orderdate, customerid and quantity
SELECT U.productid,
        productname,
        price,
        orderid,
        orderdate,
        customerid,
        quantity
FROM INFO_SET.DAT.P2 AS U
FULL OUTER JOIN LEARN.BAT.P2 AS I
ON U.productid=I.productid;

