John has a list of his monthly expenses from last year:

monthly_spending = [2689.56, 2770.38, 2394.04, 2099.91, 3182.20, 3267.12, 1746.83, 2545.72, 3328.20, 3147.30, 2462.61, 3890.45]

He wants to know his average expenses for each semester. Using a `for` loop, calculate John’s average expenses for the first semester (January to June) and the second semester (July to December).

---

We can use enumerate to tack the position
We can then use an if clause to break up the list at the halfway point, 6 months.

```python
monthly_spending = [2689.56, 2770.38, 2394.04, 2099.91, 3182.20, 3267.12, 1746.83, 2545.72, 3328.20, 3147.30, 2462.61, 3890.45]

first_semester = 0
second_semester = 0

for index, value in enumerate(monthly_expenses):
	if index < 6:
		first_semester += value
	else:
		second_semester += value

first_sem_avg = first_semester / 6
second_sem_avg = second_semester / 6

print(f"Your First Semester Average is: {first_sem_average}")
print(f"Your Second Semester Average is: {second_sem_average}")
```

---

Who Spent more.

john_monthly_spending = [2689.56, 2770.38, 2394.04, 2099.91, 3182.20, 3267.12, 1746.83, 2545.72, 3328.20, 3147.30, 2462.61, 3890.45]
 
sam_monthly_spending = [1969.62, 3939.37, 2241.59, 3968.27, 3068.80, 1755.02, 3885.66, 2491.67, 3828.49, 3171.32, 2771.32, 3380.37]

```python
john_monthly_spending = [2689.56, 2770.38, 2394.04, 2099.91, 3182.20, 3267.12, 1746.83, 2545.72, 3328.20, 3147.30, 2462.61, 3890.45]
 
sam_monthly_spending = [1969.62, 3939.37, 2241.59, 3968.27, 3068.80, 1755.02, 3885.66, 2491.67, 3828.49, 3171.32, 2771.32, 3380.37]

months_john_spent_more = 0
 
for i in range(len(john_monthly_spending)):
    if john_monthly_spending[i] > sam_monthly_spending[i]:
        months_john_spent_more += 1
 
print("Number of months John spent more money than Sam:", months_john_spent_more)
```

**Explanation**

We initialise the variable `months_john_spent_more` with the value zero. Then we use a for loop with `range(len())` to iterate over the indices of the `john_monthly_spending` list.

Within the loop, we compare John's expenses with Sam's expenses for the corresponding month using the index `i`. If John's expenses are greater than Sam's for a particular month, we increment the `months_john_spent_more` variable. Finally, we print out the total number of months where John spent more money than Sam.

