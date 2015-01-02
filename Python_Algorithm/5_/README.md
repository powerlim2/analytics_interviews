Algorithm Question In Python
============================

## Question About Search

```python
L = [1, 5, 3, 7, 4, 2, 6, 8, 10]
```

Write a code to identify the number of elements in the list that satisfy the following condition: `x % 4 == 3`

## Answer:

Use generator expression

```python
print sum(1 for x in L if x % 4 == 3)  # Theta(N), O(N), Omega(N) i love you
```

Output:
```
2
```