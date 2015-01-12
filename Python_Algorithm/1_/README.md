Algorithm Question In Python
============================

## Question About Recursive Algorithm

**Writing a function to recursively calculate a factorial of value n.** In many cases, you calculate the same factorial
values multiple times over time. Make sure that your algorithm handles such repetitive works efficiently.

## Answer:

```python
def Factorial(x, cache=dict()):
    '''
    Recursive Factorial Algorithm using Cache
    '''
    assert isinstance(x, int)   # the input must be an integer
    assert x >= 0

    if cache.has_key(x):
        return cache.get(x)
    else:
        if x < 2:
            cache[x] = 1
        else:
            cache[x] = x * Factorial(x-1)
        return cache.get(x)


def Factorial_Iterative(x, cache=dict()):
    '''
    Iterative Factorial Algorithm with Cache
    '''
    assert isinstance(x, int)   # the input must be an integer
    assert x >= 0

    if cache.has_key(x):
        return cache.get(x)
    else:
        total = 1
        if x < 2:
            cache[x] = 1
        else:
            for i in xrange(2, x+1):
                total *= i
                cache[i] = total

        return cache.get(x)


def main():
    """
    Check the accuracy of the custom function.
    """
    import math

    A = math.factorial(20)
    B = Factorial(20)
    C = Factorial_Iterative(20)

    print A == B == C


if __name__ == "__main__":
    main()
```

screen output:
```
True
```