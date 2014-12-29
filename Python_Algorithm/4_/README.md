Algorithm Question In Python
============================

## Question About Looping

**Converting the following recursive Fibonacci sequence algorithm to an iterative algorithm using loop.**


```python
def Fibonacci(n):
    """
    Recursive Fibonacci sequence algorithm
    """
    assert type(n) == int   # the input must be an integer
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return Fibonacci(n-2) + Fibonacci(n-1)
```


## Answer:

```python
from math import sqrt


def Fibonacci_iterative(n):
    assert type(n) == int   # the input must be an integer
    a, b = 0, 1
    if n < 2:
        return n
    else:
        for i in xrange(n-1):
            a, b = b, a + b
        return b


def Fibonacci_recursive(n):
    """
    Recursive Fibonacci sequence algorithm
    """
    assert type(n) == int   # the input must be an integer
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return Fibonacci_recursive(n-2) + Fibonacci_recursive(n-1)


def Fib(n):
    """
    Efficient Fibonacci estimation: non-recursive approach.
    This is used to check the accuracy of Fibonacci() function.
    In terms of performance, this is the most preferred way to calculate the Fibonacci sequence.
    """
    return int( ((1 + sqrt(5)) ** n - (1 - sqrt(5)) ** n) / (2 ** n * sqrt(5)) )


def main():
    """
    Check the accuracy of the custom function.
    """
    import time

    t0 = time.clock()
    A = Fibonacci_iterative(20)
    print "Loop: %s" % str(time.clock() - t0)

    t1 = time.clock()
    B = Fibonacci_recursive(20)
    print "Recursive: %s" % str(time.clock() - t1)

    t2 = time.clock()
    C = Fib(20)
    print "Efficient Equation: %s" % str(time.clock() - t2)

    print A == B == C


if __name__ == "__main__":
    main()
```

screen output:
```
Loop: 2.00000000063e-05
Recursive: 0.01751
Efficient Equation: 2.10000000038e-05
True
```

- `loop` is as fast as `the efficient equation` while `recursive` is much slower than other two.
- when n is small, `loop` is actually faster than `the efficient equation`.

