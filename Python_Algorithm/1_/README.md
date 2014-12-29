Algorithm Question In Python
============================

## Question About Recursive Algorithm

**Writing a function to recursively calculate a factorial of value n.**

## Answer:

```python
def Factorial(x):
    assert type(x) == int   # the input must be an integer
    if x == 0:
        return 1
    else:
        return x * Factorial(x-1)


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