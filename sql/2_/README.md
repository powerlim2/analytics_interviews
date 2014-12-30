# Background SQL Question

## Question:

Tell me about at least 3 differences between `DELETE` and `TRUNCATE` in SQL.


## Answer:

**DELETE**
1. DELETE is a DML command (Data Manipulation Language commands are used for managing data within schema objects).
2. DELETE statement is executed using a row lock, each row in the table is locked for deletion.
3. We can specify filters in where clause
4. It deletes specified data if where condition exists.
5. Delete activates a trigger because the operation are logged individually.
6. Slower than truncate because, it keeps logs.
7. Rollback is possible.

**TRUNCATE**
1. TRUNCATE is a DDL command (Data Definition Language commands are used to define the database structure or schema.).
2. TRUNCATE TABLE always locks the table and page but not each row.
3. Cannot use Where Condition.
4. It Removes all the data.
5. TRUNCATE TABLE cannot activate a trigger because the operation does not log individual row deletions.
6. Faster in performance wise, because it doesn't keep any logs.
7. Rollback is not possible.

**DROP**
- The DROP command removes a table from the database.