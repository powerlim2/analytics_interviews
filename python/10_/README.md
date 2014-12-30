# Python Programming Interview Question 10

### Question About Decorator:

Write an python function to store exception logs into a file and use the function as a decorator for other functions.



### Answer:

```python
def log_exceptions(func):
    def wrapper(*args, **kwargs):
        try:
            return func(*args, **kwargs)
        except:
            with open('exceptions.txt', 'a') as f:
                traceback.print_exc(file=f)
            raise

    return wrapper

@log_exceptions
def IntSum(a, b):
    assert type(a) == type(b) == int
    return a + b
```