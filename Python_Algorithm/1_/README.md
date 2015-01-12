Algorithm Question In Python
============================

## Question About Recursive Algorithm

**Writing a function to recursively calculate a factorial of value n.**

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


def main():
    """
    Check the accuracy of the custom function.
    """
    import math
    A = math.factorial(20)
    B = Factorial(20)
    print A == B


if __name__ == "__main__":
    main()
```

screen output:
```
True
```