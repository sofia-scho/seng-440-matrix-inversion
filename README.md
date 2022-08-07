# SENG 440: Embedded Systems
## Final Project
### Matrix Inversion

This is our final project for optimizing Gauss-Jordan matrix inversion using optimization techniques taught in the Embedded Systems course at the University of Victoria by professor Mihai Sima.

## Setup

``` ssh <netlink>@seng440.ece.uvic.ca ```

``` mkdir /tmp/<name> ```

``` git clone https://github.com/sofia-scho/seng-440-matrix-inversion.git ```

``` cd /tmp/<name> ```

``` arm-linux-gcc main.c -o main -O3 ```

``` lftp user1@arm ``` Enter password provided by professor.

``` put main ```

``` exit ```

``` telnet arm ```

Login with username "user1" and the password provided by professor.

``` ./main ```


## Optimization

The optimization techniques we implemented are mostly found within the **invert_matrix** function. The techniques we used are:

1. Function inlining
2. Register keyword for (some) integers
3. Loop unrolling
4. Loop fusion
5. Removing redundant or unused code

## Global Variables

We kept global variable usage to a minimum. 
Our global variables are:
 **MATRIX_SIZE** and **MAX_SCALE**

 In the optimized version these global variables were replaced with the value itself (integers) to avoid going to memory.



