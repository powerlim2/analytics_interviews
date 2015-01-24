# Analytics SQL Question

Purchase_history:

```
member_id   date    Purchase
1   1/1/2014    100
1   1/2/2014    50
1   1/3/2014    250
2   1/2/2014    115
...
```

## Question

**Calculate cumulative purchase amount for each member by date.**


expected output:
```
member_id   date    Purchase
1   1/1/2014    100
1   1/2/2014    150
1   1/3/2014    400
2   1/2/2014    115
...
```

## Answer


```sql
SELECT
    X.member_id as member_id,
    X.date as date,
    SUM(Y.Purchase) as CumPurchase
FROM Purchase_history X
JOIN Purchase_history Y
ON X.member_id = Y.member_id
WHERE X.date >= Y.date
GROUP BY member_id, date
ORDER BY member_id, date
```
