# Simple Math Questions

## Question:

Find all integer values in X that satisfies (x - 3)(x + 2)/(x - 5) >= 0

- Range of X = [-10, 10]



## Answer:

```
-2, -1, 0, 1, 2, 3, 6, 7, 8, 9, 10
```

**Approach:**
We found that -2, 3, 5 are the roots of the equation. There are 4 ranges between the roots:

1. x < -2
2. -2 < x < 3
3. 3 < x < 5
4. x > 5

Let's first examine the first range by plugging -3 into the equation: (-3 - 3)(-3 + 2)/(-3 - 5) = (-6)(-1)/(-8) = - 3/4 < 0.
Therefore, the all values less then -2 does not satisfy the equation. We can examine the second range by plugging in -2, and 1.
-2 is working since it will give 0. (1 - 3)(1 + 2)/(1 - 5) = (-2)(3)/(-4) = 3/2 >= 0. Therefore, -2, -1, 1, 2, 3 are working.
We can plug in 4 to check the 3rd range. (4 - 3)(4 + 2)/(4 - 5) = (1)(6)/(-1) = -6 < 0. Therefore 4 is not working.
we cannot divide by 0 so 5 is not satisfying the condition. (6 - 3)(6 + 2)/(6 - 5) = (3)(8)/(1) = 24 >= 0. So any integer
larger than or equal to 6 satisfies the condition.
