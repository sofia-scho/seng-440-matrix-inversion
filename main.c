#include <stdio.h>
#include <time.h>

//define the max scale factor of 2^24 as provided by the instructor


    

//the well-conditioned matrix to be inverted
int well_conditioned_matrix[6][6] = 
{
    {1, 2, 1, 1, 2, 1},
    {5, 2, 7, 1, 1, 3},
    {7, 1, 1, 4, 1, 2},
    {1, 1, 5, 2, 3, 7},
    {1, 2, 5, 2, 2, 1},
    {1, 2, 1, 1, 1, 2}
};

//allocating memory and defining the identity matrix to have row operations completed on it for the inversion
int well_conditioned_inversion_result[6][6] = 
{
    {1, 0, 0, 0, 0, 0},
    {0, 1, 0, 0, 0, 0},
    {0, 0, 1, 0, 0, 0},
    {0, 0, 0, 1, 0, 0},
    {0, 0, 0, 0, 1, 0},
    {0, 0, 0, 0, 0, 1},
};

//the ill-conditioned matrix to be inverted
int ill_conditioned_matrix[6][6] = 
{
    {1, 2, 1, 1, 2, 1},
    {5, 33, 7, 1, 1, 3},
    {7, 1, 1, 4, 1, 2},
    {1, 1, 5, 2, 3, 7},
    {1, 2, 5, 50, 2, 1},
    {1, 20, 1, 1, 1, 2}
};

//creating another matrix for the ill-conditioned result
int ill_conditioned_inversion_result[6][6] = 
{
    {1, 0, 0, 0, 0, 0},
    {0, 1, 0, 0, 0, 0},
    {0, 0, 1, 0, 0, 0},
    {0, 0, 0, 1, 0, 0},
    {0, 0, 0, 0, 1, 0},
    {0, 0, 0, 0, 0, 1},
};


/*
    the following vectors are showing the calculation used for the result perturbation when estimating the condition number of the matrix.

    the initial vector of six 1's has a norm of 1. when each element is perturbed by 50, the norm becomes approximately 125. 125/1 = 125 is used 
        to estimate the condition number as the relative change in the "answer"
*/

// //norm = 1
// int condition_test[MATRIX_SIZE] =
// {
//     1,
//     1,
//     1,
//     1,
//     1,
//     1
// };

// //norm = 125
// int perturbed_condition_test[MATRIX_SIZE] =
// {
//     51,
//     51,
//     51,
//     51,
//     51,
//     51
// };


//function declarations

//the inversion function. takes a pointer to the matrix to be inverted and the identity matrix, 
//      as well as the size of the matrix and the scale factor
void invert_matrix(int (*matrix)[6], int (*inverted_matrix)[6] , int size, int scale_factor);

//a utility function to print the matrix to the terminal
inline void print_matrix(int (*matrix)[6], int matrix_size);

//used to calculate scale factors and scale up the result matrix for greater precision.
int scale_up(int (*matrix)[6], int (*inverted_matrix)[6], int matrix_size);

//function to estimate the condition number of the matrix
int calculate_condition_number(int (*matrix)[6], int matrix_size);



int main(void)
{
    int scale_factor, condition_number;

    //start of program: start clock
    clock_t start = clock();
    printf("Start: %d\n", start);


    printf("ill-conditioned matrix:\n\n");
    print_matrix(ill_conditioned_matrix, 6);

    //calculate scale factor and condition number of the ill-conditioned matrix
    scale_factor = scale_up(ill_conditioned_matrix, ill_conditioned_inversion_result, 6);
    condition_number = calculate_condition_number(ill_conditioned_matrix, 6);

    //emit warning if the condition number is over 10
    if(condition_number > 10)
    {
        printf("warning! condition_number is over 10: %d\n\n", condition_number);
    }
    else
    {
        printf("condition_number: %d\n\n", condition_number);
    }

    //invert the matrix and place the result in the inversion_result matrix
    invert_matrix(ill_conditioned_matrix, ill_conditioned_inversion_result, 6, scale_factor);

    //print scaled results and scale factor
    print_matrix(ill_conditioned_inversion_result, 6);
    printf("scale factor: %d\n\n", scale_factor);





    //repeat above steps for well-conditioned matrix
    printf("well-conditioned matrix:\n\n");
    print_matrix(well_conditioned_matrix, 6);

    scale_factor = scale_up(well_conditioned_matrix, well_conditioned_inversion_result, 6);
    condition_number = calculate_condition_number(well_conditioned_matrix, 6);

    if(condition_number > 10)
    {
        printf("warning! condition_number is over 10: %d\n\n", condition_number);
    }
    else
    {
        printf("condition_number: %d\n\n", condition_number);
    }

    invert_matrix(well_conditioned_matrix, well_conditioned_inversion_result, 6, scale_factor);

    print_matrix(well_conditioned_inversion_result, 6);
    printf("scale factor: %d\n\n", scale_factor);
    
    //end of program: stop clock
    clock_t end = clock();
    printf("End: %d\n", end);

    double Clock_Num = ((double)(end-start)/CLOCKS_PER_SEC)*400000000;

    printf("Clock ticks: %f\n", Clock_Num);
    return 0;
}


void invert_matrix(int (*matrix)[6], int (*inverted_matrix)[6] , int size, int scale_factor)
{
    //indices and temporary variables for pivoting
    register int i, j, k, col_max_index;
    int scalar, col_max, temp_one, temp_two, temp_three, temp_four;

    for(i = 0; i<size; i++)
    {

        col_max = 0;
        col_max_index = i;

        //this loop identifies what rows should be swapped to find the next pivot
        for(k = i; k < size; k++)
        {
            col_max = matrix[k][i];
            if (matrix[k][i] > col_max)
            {
                col_max = matrix[k][i];
                col_max_index = k;
            }
        }

        //if the new pivot is not in the right row
        if (col_max_index != i)
        {
            //swap rows to place the new pivot
            for(k=0; k < size; k+=2)
            {
                temp_one = matrix[i][k];
                matrix[i][k] = matrix[col_max_index][k];
                matrix[col_max_index][k] = temp_one;

                temp_two = matrix[i][k+1];
                matrix[i][k+1] = matrix[col_max_index][k+1];
                matrix[col_max_index][k+1] = temp_two;
            

            //repeat operation on the inverted matrix

                temp_three = matrix[i][k];
                inverted_matrix[i][k] = matrix[col_max_index][k];
                inverted_matrix[col_max_index][k] = temp_three;

                temp_four = matrix[i][k+1];
                inverted_matrix[i][k+1] = matrix[col_max_index][k+1];
                inverted_matrix[col_max_index][k+1] = temp_four;
            }
        }

        //the pivot
        scalar = matrix[i][i];

        //can't continue if the pivot somehow becomes 0. a non-invertible matrix
        if (scalar == 0)
        {
            printf("divide by zero error\n\n");
            return;
        }

        //scale the row to get the pivot to 1, repeat operation on the result matrix
        for(j = 0; j<size; j+=2)
        {
            matrix[i][j] = matrix[i][j]/scalar;
            inverted_matrix[i][j] = inverted_matrix[i][j]/scalar;

            matrix[i][j+1] = matrix[i][j+1]/scalar;
            inverted_matrix[i][j+1] = inverted_matrix[i][j+1]/scalar;
        }

        //stepping through the rows after the pivot, subtract the scaled pivot row from the remaining rows
        for(k = 0; k < size; k++)
        {
            scalar = matrix[k][i];
            if(k!=i){
                for(j = 0; j<size; j+=2)
                {
                    matrix[k][j] -= matrix[i][j]*scalar;
                    inverted_matrix[k][j] -= inverted_matrix[i][j]*scalar;

                    matrix[k][j+1] -= matrix[i][j+1]*scalar;
                    inverted_matrix[k][j+1] -= inverted_matrix[i][j+1]*scalar;
                } 
            } 
        }

        //repeat for remaining rows
    }
}

inline void print_matrix(int (*matrix)[6], int matrix_size)
{
    register int i, j;

    //step through each element and print to terminal
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

int scale_up(int (*matrix)[6], int (*inverted_matrix)[6], int matrix_size)
{
    int max = 0; 
    register int i, j;
    int scale_factor;

    //find the maximum element in the matrix
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

    //the scale factor becomes 2^24 / the max element in order to maximize precision
    scale_factor = 16777216/max;

    //scale the result matrix
    for(i = 0; i < matrix_size; i++)
    {
        for(j = 0; j < matrix_size; j++)
        {
            inverted_matrix[i][j] = inverted_matrix[i][j] * scale_factor;
        }
    }

    return scale_factor;
}

int calculate_condition_number(int (*matrix)[6], int matrix_size)
{
    int condition_number, norm, perturbed_norm;
    register int i, j;

    norm = 0;

    //estimate the norm of the matrix by finding the maximum absolute row sum
    for(i=0; i < matrix_size; i++)
    {
        int temp_max = 0;
        for(j=0; j < matrix_size; j++)
        {
            if(matrix[i][j] < 0)
            {
                temp_max += -matrix[i][j];
            }
            else
            {
                temp_max += matrix[i][j];
            }
        }
        
        if(temp_max > norm)
        {
            norm = temp_max;
        }
    }


    //create a new matrix, but perturb each element by 50
    int perturbed_matrix[6][6];
    for(i = 0; i < matrix_size; i++)
    {
        for(j = 0; j < matrix_size; j++)
        {
            perturbed_matrix[i][j] = matrix[i][j] + 50;
        }
    }

    perturbed_norm = 0;

    //repeat estimation of norm, but with perturbed matrix
    for(i=0; i < matrix_size; i++)
    {
        int temp_max = 0;
        for(j=0; j < matrix_size; j++)
        {
            if(perturbed_matrix[i][j] < 0)
            {
                temp_max += -perturbed_matrix[i][j];
            }
            else
            {
                temp_max += perturbed_matrix[i][j];
            }
        }
        
        if(temp_max > perturbed_norm)
        {
            perturbed_norm = temp_max;
        }
    }

    //125 was mentioned above as the perturbed norm ratio of the "answer vector". following the basic formula for the condition number,
    //      that ratio is divided by the ratio of the perturbed matrix norm to the first matrix norm to estimate the condition number
    condition_number = 125 / (perturbed_norm/norm);

    return condition_number;
}