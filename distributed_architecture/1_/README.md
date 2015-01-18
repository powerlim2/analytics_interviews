# Distributed Architecture

## Map Reduce Question


### Question

Using distributed architecture (Hadoop/Spark), write a program/pseudo-code to find the number of distinct names that start with the same letter.

* Example:

```
Text file: [Rachel, Rachel, Amanda, Rohit, Paul ]

Output: [(A,1), (P, 1), (R, 2)]
```


### Answer

The following answer is to use the Mapreduce in Hadoop. We can find the number of distinct names that start with the same letter with
a single Mapreduce step. 

```
# Map Reduce Steps: map - shuffle (optional)  - reduce
 
 
# Map Stage Output

 (Rachel, 1)
 (Rachel, 1)
 (Amanda, 1)
 (Rohit, 1)
 (Paul, 1)
 
 
# Shuffle Stage Output

 (Rachel, [1, 1])
 (Amanda, [1])
 (Rohit, [1])
 (Paul, [1])
 
 
# Reduce Stage Output - Final Output

- Ignore the value from Shuffle Stage Output.
- Only take the key from the Shuffle Stage output and build a hashtable with (first character of name, value++)

 [(R, 2), (A, 1), (P, 1)]
```

