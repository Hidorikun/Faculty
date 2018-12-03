# Lab 8
#
#### Requirement
>
Given a directed graph, find a Hamiltonean cycle, if one exists. Use multiple threads to parallelize the search.
#
#### Algorithm
*   backtracking : 
    * generate all possible paths starting from each node, and check each one if it is a hamiltonian cycle 
    * in parallelized version we have one thread executing the backtrack for one node

#### Parallelization
Used the Thread class along with the ArrayBlockingQueue. 

### Results:  
note: by level 'x' i am reffering that the graph will have x * 10 nodes

| Tables     | Level 1 | Level 10 | Level 20 | Level 30 | Level 40 | Level 50 | Level 60 | Level 70 | Level 80 | Level 90 | Level 100
| ---------- |:--------:|:-------:|:---------:|:-------:|:---------:|:-------:|:---------:|:-------:|:---------:| :---------:| :---------:|
| sequential | 3 ms |  7 ms | 17 ms | 48 ms | 132 ms | 149 ms | 669 ms |  784 ms | 879 ms | 1056 ms | 1495 ms
| parallel   | 1 ms | 8 ms |9 ms | 32 ms | 57 ms | 75 ms | 161 ms | 237 ms | 340 ms | 462 ms| 692 ms

Throughout the tests i've put those algorithm through, the results were conclusive
By parallelizing the backtracking algorithm we optain results up to 3 times faster

### Conclusions

1. Parallelism should be used when talking about backtracking



