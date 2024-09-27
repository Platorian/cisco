## Min-maxing

Define a function named `largest_difference` that takes a list of numbers as its only parameter.

Your function should compute and return the difference between the largest and smallest number in the list.

For example, the call `largest_difference([1, 2, 3])` should return `2` because `3 - 1` is `2`.

You may assume that no numbers are smaller or larger than `-100` and `100`.

---

```python
def min_maxing(my_list):
    largest = max(my_list)
    smallest = min(my_list)
    diff = largest - smallest
    return diff

print(min_maxing([1,2,3]))
```

Had to change a few things to pass the challenge

```python
def largest_difference(my_list):
    largest = max(my_list)
    smallest = min(my_list)
    diff = largest - smallest
    return diff

print(largest_difference([1,2,3]))
```

