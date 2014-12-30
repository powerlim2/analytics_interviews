# Background SQL Question

## Question:

What is the difference between `UNION` and `UNION ALL`?

## Answer:

`UNION` removes duplicate records (where all columns in the results are the same), `UNION ALL` does not.

There is a performance hit when using `UNION` vs `UNION ALL`, since the database server must do additional work to remove the duplicate rows,
but usually you do not want the duplicates (especially when developing reports). `UNION ALL` is more efficient.

**UNION Example:**

```sql
SELECT 'foo' AS bar UNION SELECT 'foo' AS bar
```

```
Result:

+-----+
| bar |
+-----+
| foo |
+-----+
1 row in set (0.00 sec)
```

**UNION ALL example:**

```sql
SELECT 'foo' AS bar UNION ALL SELECT 'foo' AS bar
```

```
Result:

+-----+
| bar |
+-----+
| foo |
| foo |
+-----+
2 rows in set (0.00 sec)
```