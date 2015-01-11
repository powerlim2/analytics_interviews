Algorithm Question In Python
============================

## Question:

We have 3 string variables: A, B and C. We want to check whether C is a complete ordered shuffle of A and B.
How would you write a function to solve this problem efficiently?

```python
A = "abc"
B = "def"
C1 = "abdecf"  # ordered and complete
C2 = "badecf"  # not ordered for A
C3 = "abedcf"  # not ordered for B
C4 = "abcde"   # not complete

for c in [C1, C2, C3, C4]:
    print is_shuffled(A, B, c)
```

**Expected Outcome:**

```
True
False
False
False
```

## Answer


