# Python Programming Interivew Question 3

### Question:

**What will be the output of the code below?**

Description: We are trying to build a function to extend a list (if exsits) by adding one item. If list is not predefined, it will generate a list with the specified 1 item. (Assume that you are using Python 2.7)

```python
def extendList(val, list=[]):
    list.append(val)
    return list

list1 = extendList(10)
list2 = extendList(123, [])
list3 = extendList('a')

print "list 1 = %s" % list1
print "list 2 = %s" % list2
print "list 3 = %s" % list3
```

Screen Output
```
list 1 = [10, 'a']
list 2 = [123]
list 3 = [10, 'a']
```

How would you modify the definition of `extendList` to product the presumably desired behavior?


### Answer:

```python
def extendList(val, list=None):
    if list is None:
        list = []
    list.append(val)
    return list

list1 = extendList(10)
list2 = extendList(123, [])
list3 = extendList('a')

print "list 1 = %s" % list1
print "list 2 = %s" % list2
print "list 3 = %s" % list3
```

Screen Output
```
list 1 = [10]
list 2 = [123]
list 3 = ['a']
```

What's happening here is that the new default list is created only once when the function is defined, and that same list is then used subsequently whenever `extendList` is invoked without a `list` argument being specified. This is because expressions in default argument are calculated when the function is defined, not when it's called.

- Pythonic approach to check if the list is None type is `is None`, not `list == None`.
