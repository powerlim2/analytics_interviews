# Python Programming Interview Question 8

### Question About Writing A Module:

We have two python files. In `Run.py` file, we import `IntSum()` function in `Math.py` file.

**1. Math.py**
```python
def IntSum(x, y):
    assert type(x) == type(y) == int
    return x + y

# test
print IntSum(1, 2)
print IntSum(1., 2)
print IntSum(1, 2.)
print IntSum(1., 2.)
```

**2. Run.py**
```python
from Math import IntSum

x, y = 3, 5
print IntSum(x, y)
```

How would you modify the python scripts to prevent from getting an error from testing when executing `Run.py` script?



### Answer:

Add if statement: `if __name__ == "__main__"` in `Math.py`.

**In Math.py**
```python
def IntSum(x, y):
    assert type(x) == type(y) == int
    return x + y


def main():
    """
    test IntSum() function. 
    """
    print IntSum(1, 2)
    print IntSum(1., 2)
    print IntSum(1, 2.)
    print IntSum(1., 2.)


if __name__ == "__main__":
    main()
```

- import: `__name__ == "Math"` (module's filename: Math.py).
- direct run: `__name__ == "__main__"`