#include <stdio.h>

#define MATRIX_SIZE 6

void invert_matrix(int (*)[MATRIX_SIZE] , int (*)[MATRIX_SIZE] , int);
void print_matrix(int (*)[MATRIX_SIZE], int);

int test_matrix_1[MATRIX_SIZE][MATRIX_SIZE] = 
{
    {1, 2, 5, 4, 2, 4},
    {5, 3, 7, 1, 6, 3},
    {7, 1, 9, 4, 1, 2},
    {5, 5, 5, 2, 6, 7},
    {1, 2, 5, 1, 2, 9},
    {8, 7, 3, 6, 4, 2}
};
int test_matrix_2[MATRIX_SIZE][MATRIX_SIZE];
int test_matrix_3[MATRIX_SIZE][MATRIX_SIZE];

int identity_matrix[MATRIX_SIZE][MATRIX_SIZE] = 
{
    {1, 0, 0, 0, 0, 0},
    {0, 1, 0, 0, 0, 0},
    {0, 0, 1, 0, 0, 0},
    {0, 0, 0, 1, 0, 0},
    {0, 0, 0, 0, 1, 0},
    {0, 0, 0, 0, 0, 1},
};