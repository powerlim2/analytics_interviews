# Python Programming Interview Question 9

### Question About File IO:

Write a python script to print contents in a file with file IO exception handling.


### Answer:

```python
def get_contents(filename):
    try:
        with open(filename, 'r') as file:
            return file.read()
    except IOError:
        print "No such file exists!"


def main():
    print get_contents("file.txt")


if __name__ == "__main__":
    main()
```

