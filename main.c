#include <stdio.h>

#define MATRIX_SIZE 6
#define MAX_SCALE 16777216  // 2^24

void invert_matrix(float (*matrix)[MATRIX_SIZE], float (*inverted_matrix)[MATRIX_SIZE] , int size);
void print_matrix(float (*matrix)[MATRIX_SIZE], int matrix_size);
int scale_up(float (*matrix)[MATRIX_SIZE], float (*inverted_matrix)[MATRIX_SIZE], int matrix_size);

int main(void)
{
    float matrix[MATRIX_SIZE][MATRIX_SIZE] = 
    {
        {1, 2, 0, 0, 2, 0},
        {5, 1, 7, 1, 0, 3},
        {7, 1, 9, 4, 1, 2},
        {0, 0, 5, 2, 6, 7},
        {1, 2, 5, 1, 2, 1},
        {8, 1, 1, 6, 1, 2}
    };

    float inversion_result[MATRIX_SIZE][MATRIX_SIZE] = 
    {
        {1, 0, 0, 0, 0, 0},
        {0, 1, 0, 0, 0, 0},
        {0, 0, 1, 0, 0, 0},
        {0, 0, 0, 1, 0, 0},
        {0, 0, 0, 0, 1, 0},
        {0, 0, 0, 0, 0, 1},
    };

    // int matrix[MATRIX_SIZE][MATRIX_SIZE] =
    // {
    //     {2, 4},
    //     {1, 3}
    // };

    // int inversion_result[MATRIX_SIZE][MATRIX_SIZE] = 
    // {
    //     {1, 0},
    //     {0, 1}
    // };

    int scale_factor;

    // scale_factor = scale_up(matrix, inversion_result, MATRIX_SIZE);
    print_matrix(matrix, MATRIX_SIZE);
    invert_matrix(matrix, inversion_result, MATRIX_SIZE);
    print_matrix(inversion_result, MATRIX_SIZE);
    // printf("scale factor: %d\n", scale_factor);
    
    return 0;
}

void invert_matrix(float (*matrix)[MATRIX_SIZE], float (*inverted_matrix)[MATRIX_SIZE] , int size)
{
    int i, j, k, scalar, identity_scalar;

    for(i = 0; i<size; i++)
    {
        if(matrix[i][i] == 0)
        {
            printf("unable to find inverse\n");
            return;
        }

        scalar = matrix[i][i];
        for(j = 0; j<size; j++)
        {
            matrix[i][j] /= scalar;
            inverted_matrix[i][j] /= scalar;
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
    }
}

void print_matrix(float (*matrix)[MATRIX_SIZE], int matrix_size)
{
    int i, j;

    for(i = 0; i < matrix_size; i++)
    {
        for(j = 0; j < matrix_size; j++)
        {
            printf("%10f ", matrix[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

int scale_up(float (*matrix)[MATRIX_SIZE], float (*inverted_matrix)[MATRIX_SIZE], int matrix_size)
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