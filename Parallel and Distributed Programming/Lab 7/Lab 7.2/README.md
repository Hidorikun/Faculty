# Lab 7.2
#
#### Requirement
>Add n big numbers. We want the result to be obtained digit by digit, starting with the least significant one, and as soon as possible. For this reason, you should use n-1 threads, each adding two numbers. Each thread should pass the result to the next thread. Arrange the threads in a binary tree. Each thread should pass the sum to the next thread through a queue, digit by digit.
#
#### Algorithms
*   regular linear algorithm:
    * Complexity: O(n)
    * Iterate through the input list, and add the current number to the sum
#    
* binary tree algorithm:  
    * Complexity: O(n), but parellelized
    * Create N - 1 threads that add 2 numbers, and arrange them in a binary tree, comunicating with each other with queues

#### Parallelization
Used the Thread class along with the ArrayBlockingQueue. 

### Results:  
note: by level 'x' i am reffering that N = x * 10 input numbers, each one having x * 1 digits

| Tables                           | Level 1 | Level 10 | Level 16 
| -------------------------------- |:--------:|:-------:|:---------:|
| regular linear algorithm         | 0 ms |  0 ms | 0 ms |
| binary tree algorithm            | 15 ms | 47 ms |57 ms |

Throughout the tests i've put those algorithm through, the results were inconclusive. 
The binary tree implementation might be optimized to yield better results in the parallel form than in the sequential form, however, in this instance I was not able to get a better performance out of it. The parallel version is on average worse than the sequential version.

### Conclusions

1. Implementing such a complex algorithm for such a trivial problem might not be in our favour.



