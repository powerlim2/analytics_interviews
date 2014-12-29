Algorithm Question In Python
============================

## Question About Generator

**Writing a function to iteratively calculate a Fibonacci sequence to the infinite**

(print out first 10 values in the sequence)

## Answer:

```python
def Fibonacci():
    a, b = 0, 1
    yield a
    yield b
    while True:
        a, b = b, a + b
        yield b


def main():
    Fib = Fibonacci()
    print " ".join([str(Fib.next()) for i in xrange(10)])


if __name__ == "__main__":
    main()
```

screen output:
```
0 1 1 2 3 5 8 13 21 34
```