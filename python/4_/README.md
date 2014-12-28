# Python Programming Interivew Question 4

### OOP Question:

**What will be the output of the code below?**


```python
class Parent(object):
    x = 1

class Child1(Parent):
    pass

class Child2(Parent):
    pass


print Parent.x, Child1.x, Child2.x

Child1.x = 2
print Parent.x, Child1.x, Child2.x

Parent.x = 3
print Parent.x, Child1.x, Child2.x
```

### Answer:

```
1 1 1
1 2 1
3 2 3
```

**Explanation:**
The changed value of `Parent.x` change the value of `Child2.x` but not changed the value of `Child1.x`. In python, class variables are internally handled as dictionaries. If a variable name is not found in the dictionary of the current class, the class hierarchy are searched until the referenced variable name is found. If the referenced variable is not found, `AttributeError` occurs.

- Setting `x = 1` in the `Parent` class makes the class variable `x` referenceable in that class and any of its children. 
- If child class overrides that value (`Child1.x = 2`) then the value is changed in that child only. 
- If the value in Parent is changed, the change is also effective on any children that have not yet overridden the value.




