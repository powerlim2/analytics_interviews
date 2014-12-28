# Python Programming Interivew Question 2

### Question:

**What will be the output of the code below?**

Assume that you are using Python 2.7

```python
def div1(x, y):
    print "%s/%s = %s" % (x, y, x/y)

def div2(x, y):
    print "%s//%s = %s" % (x, y, x//y)

div1(5, 2)
div1(5., 2)
div2(5, 2)
div2(5., 2.)
```

### Answer:

```
5/2 = 2
5./2 = 2.5
5//2 = 2
5.//2. = 2.0
```

Be default, Python automatically performs integer arithmetic if both operands are integers.
- `/` is a regular division when either numerator or denominator is a float type. 
- `//` is an integer division (floor). 
