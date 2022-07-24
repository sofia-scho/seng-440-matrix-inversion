#include <stdio.h>

#define MATRIX_SIZE 6
#define MAX_SCALE 16777216  // 2^24

void invert_matrix(int (*matrix)[MATRIX_SIZE], int (*inverted_matrix)[MATRIX_SIZE] , int size, int scale_factor);
void print_matrix(int (*matrix)[MATRIX_SIZE], int matrix_size);
int scale_up(int (*matrix)[MATRIX_SIZE], int (*inverted_matrix)[MATRIX_SIZE], int matrix_size);
int calculate_condition_number(int (*matrix)[MATRIX_SIZE], int matrix_size);

int main(void)
{
    int matrix[MATRIX_SIZE][MATRIX_SIZE] = 
    {
        {1, 2, 1, 1, 2, 1},
        {5, 1, 7, 1, 1, 3},
        {7, 1, 9, 4, 1, 2},
        {1, 1, 5, 2, 6, 7},
        {1, 2, 5, 1, 2, 1},
        {8, 1, 1, 6, 1, 2}
    };

    int inversion_result[MATRIX_SIZE][MATRIX_SIZE] = 
    {
        {1, 0, 0, 0, 0, 0},
        {0, 1, 0, 0, 0, 0},
        {0, 0, 1, 0, 0, 0},
        {0, 0, 0, 1, 0, 0},
        {0, 0, 0, 0, 1, 0},
        {0, 0, 0, 0, 0, 1},
    };

    int scale_factor;

    scale_factor = scale_up(matrix, inversion_result, MATRIX_SIZE);
    print_matrix(matrix, MATRIX_SIZE);
    invert_matrix(matrix, inversion_result, MATRIX_SIZE, scale_factor);
    print_matrix(inversion_result, MATRIX_SIZE);
    printf("scale factor: %d\n", scale_factor);
    
    return 0;
}

void invert_matrix(int (*matrix)[MATRIX_SIZE], int (*inverted_matrix)[MATRIX_SIZE] , int size, int scale_factor)
{
    int i, j, k, scalar;
    int col_max, col_max_index;

    for(i = 0; i<size; i++)
    {

        col_max = 0;
        col_max_index = i;
        for(k = i; k < size; k++)
        {
            col_max = matrix[k][i];
            if (matrix[k][i] > col_max)
            {
                col_max = matrix[k][i];
                col_max_index = k;
            }
        }

        if (col_max_index != i)
        {
            for(k=0; k < size; k++)
            {
                int temp = 0;
                temp = matrix[i][k];
                matrix[i][k] = matrix[col_max_index][k];
                matrix[col_max_index][k] = temp;
            }

            for(k=0; k < size; k++)
            {
                int temp = 0;
                temp = inverted_matrix[i][k];
                inverted_matrix[i][k] = inverted_matrix[col_max_index][k];
                inverted_matrix[col_max_index][k] = temp;
            }
        }

        print_matrix(matrix, size);

        scalar = matrix[i][i];

        if(scalar == 0)
        {
            printf("divide by zero error\n\n");
            return;
        }

        for(j = 0; j<size; j++)
        {
            matrix[i][j] = matrix[i][j]/scalar;
            inverted_matrix[i][j] = inverted_matrix[i][j]/scalar;
        }

        for(k = 0; k < size; k++)
        {
            scalar = matrix[k][i];
            if(k!=i){
                for(j = 0; j<size; j++)
                {
                    matrix[k][j] -= matrix[i][j]*scalar;
                    inverted_matrix[k][j] -= inverted_matrix[i][j]*scalar;
                } 
            } 
        }

        print_matrix(matrix, size);
    }
}

void print_matrix(int (*matrix)[MATRIX_SIZE], int matrix_size)
{
    int i, j;

    for(i = 0; i < matrix_size; i++)
    {
        for(j = 0; j < matrix_size; j++)
        {
            printf("%10d ", matrix[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

int scale_up(int (*matrix)[MATRIX_SIZE], int (*inverted_matrix)[MATRIX_SIZE], int matrix_size)
{
    int max = 0; 
    int i, j, scale_factor;

    for(i = 0; i < matrix_size; i++)
    {
        for(j = 0; j < matrix_size; j++)
        {
            if (matrix[i][j] > max)
            {
                max = matrix[i][j];
            }
        }
    }

    scale_factor = MAX_SCALE / max;

    for(i = 0; i < matrix_size; i++)
    {
        for(j = 0; j < matrix_size; j++)
        {
            inverted_matrix[i][j] = inverted_matrix[i][j] * scale_factor;
        }
    }

    

    return scale_factor;
}

int calculate_condition_number(int (*matrix)[MATRIX_SIZE], int matrix_size)
{
    int condition_number;

    return condition_number;
}