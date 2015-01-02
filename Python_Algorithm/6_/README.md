Algorithm Question In Python
============================

## Question:

```python
y = lambda x: 2*(x**2) + 3*x + 24
```

**Write a function to calculate the value of `y'(0)`, `y'(3)`, `y'(7)`, `y'(10)`.**

```python
# use the following function to check your answer
from scipy.misc import derivative as deriv

for v in [0, 3, 7, 10]:
    print "y'({}): {}".format(v, deriv(y, v, dx=1e-10))
```

## Answer:

```python
def Derivative(func, x, h=1e-10):
    """
    3 mathematical Formula for derivative:
    1. y'(x) = limit h -> 0: (y(x+h) - y(x))/h                 # Forward Difference
    2. y'(x) = limit h -> 0: (y(x) - y(x-h))/h                 # Backward Difference
    3. y'(x) = limit h -> 0: (y(x+ (1/2)*h) - y(x-(1/2)*h))/h  # Central Difference

    Here, the central difference is chosen for this function.
    """
    assert type(func).__name__ == "function"
    delta = func(x + (1./2*h)) - func(x - (1./2*h))
    return (delta / h)

for v in [0, 3, 7, 10]:
    print "y'({}) => Mine:{}, Scipy:{}".format(v, round(Derivative(y, v), 3), round(deriv(y, v, dx=1e-10), 3))
```

**Output:**

```
y'(0) => Mine:3.0, Scipy:3.0
y'(3) => Mine:15.0, Scipy:15.0
y'(7) => Mine:31.0, Scipy:31.0
y'(10) => Mine:43.0, Scipy:43.0
```

**Empirical Analysis:**

```
In [15]: %timeit Derivative(y, 10)
1000000 loops, best of 3: 1.53 us per loop

In [16]: %timeit deriv(y, 10, dx=1e-10)
10000 loops, best of 3: 27.5 us per loop
```

Note:
- My custom function is faster than Scipy's derivative function while the accuracy remains practically the same.
