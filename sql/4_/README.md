# Analytics SQL Question


**Given a set of tables:**

```
Orders table (ORDER_ID, CUSTOMER_ID, ORDER_DATE)
Order detail table (ORDER_ID, PRODUCT_ID, PRICE, UNITS)
Customers table (CUSTOMER_ID, SIGNUP_DATE, COUNTRY)
```

## Question 1: Identify all customers which purchased product x

## Answer:

```sql
SELECT
  OT.CUSTOMER_ID as CUSTOMER_ID
FROM Order_table OT
JOIN Order_detail_table OD
ON OT.ORDER_ID = OD.ORDER_ID
WHERE OD.PRODUCT_ID = "x"
GROUP BY CUSTOMER_ID
```

## Question 2: Identify months in which revenue exceeded $1,000

## Answer:

```sql
SELECT
    MONTH(ORDER_DATE) AS ORDER_MONTH,
    PRICE * UNITS AS REVENUE
FROM (
    SELECT
      OT.ORDER_ID AS ORDER_ID,
      OT.ORDER_DATE AS ORDER_DATE,
      OT.CUSTOMER_ID AS CUSTOMER_ID,
      OD.PRODUCT_ID AS PRODUCT_ID,
      OD.PRICE AS PRICE,
      OD.UNITS AS UNITS
    FROM Order_table OT
    JOIN Order_detail_table OD
    ON OT.ORDER_ID = OD.ORDER_ID
)
GROUP BY ORDER_MONTH
HAVING REVENUE > 1000
```

## Question 3:

Assume the customer table is incomplete (i.e. not all customer_ids appear in this table).
Calculate how much revenue was earned from customers in the US, Canada, and UKNOWN

```sql
SELECT
    COUNTRY,
    PRICE * UNITS AS REVENUE
FROM (
    SELECT
      OT.ORDER_ID AS ORDER_ID,
      OT.ORDER_DATE AS ORDER_DATE,
      OT.CUSTOMER_ID AS CUSTOMER_ID,
      OD.PRODUCT_ID AS PRODUCT_ID,
      OD.PRICE AS PRICE,
      OD.UNITS AS UNITS
      IF(CT.COUNTRY IS NOT NULL, CT.COUNTRY, "UNKNOWN") AS COUNTRY /* STRING */
    FROM Order_table OT
    JOIN Order_detail_table OD
    ON OT.ORDER_ID = OD.ORDER_ID
    LEFT JOIN Customer_table CT
    ON OT.CUSTOMER_ID = CT.CUSTOMER_ID
)
GROUP BY COUNTRY
/* ORDER BY REVENUE DESC */
```