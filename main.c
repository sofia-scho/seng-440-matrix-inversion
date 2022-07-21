#include "main.h"

int main(void)
{
    // int result_matrix[MATRIX_SIZE][MATRIX_SIZE];

    // invert_matrix((int**)test_matrix_1, (int**)result_matrix, MATRIX_SIZE);
    // print_matrix((int**)result_matrix, MATRIX_SIZE);

    // invert_matrix((int**)test_matrix_2, (int**)result_matrix, MATRIX_SIZE);
    // print_matrix((int**)result_matrix, MATRIX_SIZE);

    // invert_matrix((int**)test_matrix_3, (int**)result_matrix, MATRIX_SIZE);
    // print_matrix((int**)result_matrix, MATRIX_SIZE);

    print_matrix(test_matrix_1, MATRIX_SIZE);
    
    return 0;
}

void invert_matrix(int (*matrix)[MATRIX_SIZE], int (*inverted_matrix)[MATRIX_SIZE] , int size)
{

}

void print_matrix(int (*matrix)[MATRIX_SIZE], int matrix_size)
{
    int i, j;

    for(i = 0; i < matrix_size; i++)
    {
        for(j = 0; j < matrix_size; j++)
        {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }
}

