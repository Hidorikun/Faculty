# Lab 7.1
#
#### Requirement
>Given a sequence of n numbers, compute the sums of the first k numbers, for each k between 1 and n. Parallelize the computations, to optimize for low latency on a large number of processors. Use at most 2*n additions, but no more than 2*log(n) additions on each computation path from inputs to an output. Example: if the input sequence is 1 5 2 4, then the output should be 1 6 8 12.
#
#### Algorithms
*   regular linear algorithm:
    * Complexity: O(n)
    * Iterate through the input list, and for each step result[ i ] = input[ i ] + result[ i - 1 ]
#    
* binary tree algorithm:  
    * Complexity: O(n), but parellelized
    * This algorithm consists of 2 steps, in the forst one we generate partial sums of length 2^j, where j is between (1, logN) so as 1 < 2^j <= N. In the second step we "come back" and calculate the remaining non-calculated values. By comming back, we reffer to taking the maximum j obtained in the first step and bringing it back to 1, , on each level finding the elements that are at distance 2^j from a value that was calculated at step 1.
    * example:
        >       a = [1  2  3  4  5  6  7  8  9  10  11  12  13  14  15  16  17]
        * step 1:
            >              1  2    3  4    5  6    7  8    9  10  11  12   13  14  15  16  17        
            >               \ |     \ |     \ |     \ |     \ |     \ |      \ |     \ |             
            >     j = 1       3       7      11      15      19       23       27     31            
            >                   \     |         \     |         \     |          \     |             
            >                     \   |           \   |           \   |            \   |             
            >                       \ |             \ |             \ |              \ |             
            >     j = 2               10             26              42               59             
            >                           \             |                 \              |             
            >                             \           |                   \            |             
            >                               \         |                     \          |             
            >                                 \       |                       \        |             
            >                                   \     |                         \      |             
            >                                     \   |                           \    |             
            >                                       \ |                             \  |             
            >     j = 3                               36                             101            
            >                                           \                              |             
            >                                             \                            |             
            >                                               \                          |             
            >                                                 \                        |             
            >                                                   \                      |             
            >                                                     \                    |             
            >                                                       \                  |             
            >                                                         \                |             
            >                                                           \              |             
            >                                                             \            |             
            >                                                               \          |             
            >                                                                 \        |             
            >                                                                   \      |             
            >                                                                     \    |             
            >                                                                       \  |             
            >     j = 4                                                              137            

            After this step, notice how the elements at the positions power of 2 are calculated.
        * step 2 (look from the bottom up)
            >            1  2    3    4     5    6     7    8     9   10    11   12   13   14    15  16    17  
            >               |    |    |     |    |     |    |     |    |     |   |     |   |      |   |     |  
            >               |    v    |     v    |     v    |     v    |     v   |     v   |      v   |     v  
            >     j = 1     3--> 6    |--> 15  [11]--> 28   |--> 45  [19]-> 66   |--> 91  [27]->120   |--> 144
            >                         |          |          |          |         |         |          |        
            >                         |          |          |          |         |         |          |        
            >                         |          v          |          v         |         v          |        
            >     j = 2              10-------> 21          |-------->55       [42]------>105         |        
            >                                               |                    |                    |        
            >                                               |                    |                    |        
            >                                               |                    |                    |        
            >                                               |                    |                    |        
            >                                               |                    |                    |        
            >                                               |                    |                    |        
            >                                               |                    v                    |        
            >     j = 3                                    36------------------>78                    |        
            >                                                                                         |        
            >                                                                                         |        
            >                                                                                         |        
            >                                                                                         |        
            >                                                                                         |        
            >                                                                                         |        
            >                                                                                         |        
            >                                                                                         |        
            >                                                                                         |        
            >                                                                                         |        
            >                                                                                         |        
            >                                                                                         |        
            >                                                                                         |        
            >                                                                                         |        
            >                                                                                         |        
            >     j = 4                                                                             137       
            What happens here is that we go bottom up and we combine the elements that were previously computed with the ones that were only partially computed or not at all. The elements that we want to compute on each level (from 4 to 1) are the ones that are at 2^(j-1) distance from the computed elements. The elements we can be sure arer completed at each level j are multiples of 2^j, so k * 2^j, where k is between 1 and whatever number gets us out of range;

            To better understand this step let's do it level by level:

            *   At level j = 3, we know that the completed element is only 8 (1 * 2^3), as already (2 * 2^3) goes out of bounds. We look 2^(j-1) positions to his right, there's element 12, with current value of 42, so we combine that 42 with the value in 8, 36, and we get 78, which will replace the current value of element 12.

            *   At level j = 2, the completed elements are 4, 8, 12 aka (1 * 2^2), (2 * 2^2), (2 * 2^2). We look 2^(j-1) positions at their right and we update their current value as we did in level 3. Beware that the value of element 12 is now 78. We always take the highest value from the branch (which has the lowest position)

            *   At level j = 1, the completed elements will be all elements on an even position, and now the distance is 1 ( 1 * 2^0 ), so we can compute all the elements on odd positions.

#### Parallelization
Used Java's ThreadPool combined with custom Runnable objects to achieve parallelization;

### Results:  
note: by level 'x' i am reffering that the algorithms were used to generate prefixes for a list of size (100 * x) containing elements from 100 to 900.

| Tables                           | Level 1 | Level 50 | Level 100 | Level 150 | Level 200 | Level 250 | Level 300 |
| -------------------------------- |:--------:|:-------:|:---------:|:---------:|:---------:|:---------:|:---------:|
| regular linear algorithm         | 0 ms |  0 ms | 0 ms | 0 ms | 0 ms | 0 ms | 0 ms |
| binary tree algorithm sequential | 35 ms | 15 ms |13 ms |30 ms |67 ms |52 ms |29 ms |
| binary tree algorithm parallel   | 11 ms |21 ms |29 ms |29 ms |29 ms |44 ms |41 ms |

Throughout the tests i've put those algorithm through, the results were inconclusive.
The binary tree implementation might be optimized to yield better results in the parallel form than in the sequential form, however, in this instance I was not able to get a better performance out of it. The parallel version is on average worse than the sequential version.

### Conclusions

1. Although in theory, the binary tree algorithm may be faster than the naive one, due to technicalities of the language and the overhead added by parallelization, this could simply not be worth it.
