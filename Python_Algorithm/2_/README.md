Algorithm Question In Python
============================

## Question About Recursive Algorithm 2

**Writing a function to recursively calculate a Fibonacci sequence at position n.**

HINT:
![fib_eq](fib.png)

## Answer:

```python
from math import sqrt


def Fibonacci(n, cache=dict()):
    '''
    caching the computed value to remove redundant recursive computations
    '''
    assert isinstance(n, int)   # the input must be an integer

    if cache.has_key(n):
        return cache.get(n)
    else:
        if n < 2:
            cache[n] = n
        else:
            cache[n] = Fibonacci(n-2) + Fibonacci(n-1)
        return cache.get(n)


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
    A = Fibonacci(18)
    B = Fib(18)
    print A == B


if __name__ == "__main__":
    main()
```

screen output:
```
True
```