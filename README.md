# Sudoku solver in Prolog

### The task assignment description.

Write a sudoku solver. At the entrance you will receive a game board with any number of pre-filled cells. Your task is to complete the Sudoku if there is a solution.


### Features were implemented.

Predicate solve_sudoku(+Matrix) finds (with usage of Brute Force algorithm) one possible solutution to any given correct 9x9 Sudoku and prints the solution. 

In case input matrix does not follow at least one rule of original sudoku (each row, column and 3x3 square needs to be filled out with the numbers 1-9, without repeating any numbers within the row, column or square) fails.

No predicate uses constraint solvers or similar libraries. 


## Example usage

Predicate solve_sudoku(+Matrix) takes a matrix 9x9 (represented as list of lists) and prints solved Sudoku if it exists, otherwise fails.

Tests were taken from https://www.sudokuonline.io and the most difficult one was created by author of code:

EASY LEVEL: 

solve_sudoku(
[

[0,0,0,2,6,0,7,0,1],
[6,8,0,0,7,0,0,9,0],
[1,9,0,0,0,4,5,0,0],
[8,2,0,1,0,0,0,4,0],
[0,0,4,6,0,2,9,0,0],
[0,5,0,0,0,3,0,2,8],
[0,0,9,3,0,0,0,7,4],
[0,4,0,0,5,0,0,3,6],
[7,0,3,0,1,8,0,0,0]
]).

Output:

[4,3,5,2,6,9,7,8,1]
[6,8,2,5,7,1,4,9,3]
[1,9,7,8,3,4,5,6,2]
[8,2,6,1,9,5,3,4,7]
[3,7,4,6,8,2,9,1,5]
[9,5,1,7,4,3,6,2,8]
[5,1,9,3,2,6,8,7,4]
[2,4,8,9,5,7,1,3,6]
[7,6,3,4,1,8,2,5,9]

true.


MEDIUM LEVEL:

solve_sudoku(
[

[0,3,0,0,5,6,0,8,0],
[8,0,5,0,0,0,3,0,7],
[0,4,0,8,0,0,0,1,0],
[1,0,0,0,3,0,6,0,0],
[2,0,0,0,0,0,0,0,8],
[0,0,3,0,9,0,0,0,4],
[0,6,0,0,0,9,0,5,0],
[5,0,8,0,0,0,2,0,1],
[0,1,0,7,2,0,0,4,0]
]).

Output:

[7,3,1,2,5,6,4,8,9]
[8,2,5,9,4,1,3,6,7]
[9,4,6,8,7,3,5,1,2]
[1,9,7,4,3,8,6,2,5]
[2,5,4,6,1,7,9,3,8]
[6,8,3,5,9,2,1,7,4]
[4,6,2,1,8,9,7,5,3]
[5,7,8,3,6,4,2,9,1]
[3,1,9,7,2,5,8,4,6]

true.

HARD LEVEL:

solve_sudoku(
[

[9,0,0,0,7,0,5,0,0],
[0,0,4,2,0,8,3,0,0],
[0,7,0,0,0,0,0,6,4],
[5,0,2,0,0,0,7,0,0],
[0,0,0,3,0,0,0,0,0],
[0,0,6,9,0,2,1,8,0],
[8,1,0,0,9,4,0,0,0],
[0,0,0,0,0,0,0,1,0],
[0,0,0,7,0,0,0,0,0]
]).

Output:

[9,6,8,4,7,3,5,2,1]
[1,5,4,2,6,8,3,7,9]
[2,7,3,5,1,9,8,6,4]
[5,9,2,1,8,6,7,4,3]
[4,8,1,3,5,7,6,9,2]
[7,3,6,9,4,2,1,8,5]
[8,1,5,6,9,4,2,3,7]
[3,4,7,8,2,5,9,1,6]
[6,2,9,7,3,1,4,5,8]

true.

IMPOSSIBLE LEVEL:

solve_sudoku(
[

[7,0,0,0,3,1,0,8,5],
[0,3,0,2,0,0,0,0,0],
[0,0,0,4,7,5,9,0,0],
[0,0,0,0,0,0,0,6,7],
[0,0,6,0,0,0,1,0,0],
[1,4,0,0,0,0,0,0,0],
[0,0,7,9,1,4,0,0,0],
[6,0,0,5,0,0,0,7,0],
[5,0,0,0,6,7,0,0,9]
]).

Output:

[7,2,9,6,3,1,4,8,5]
[4,3,5,2,9,8,7,1,6]
[8,6,1,4,7,5,9,2,3]
[9,5,8,1,4,3,2,6,7]
[2,7,6,8,5,9,1,3,4]
[1,4,3,7,2,6,5,9,8]
[3,8,7,9,1,4,6,5,2]
[6,9,4,5,8,2,3,7,1]
[5,1,2,3,6,7,8,4,9]

true.


CREATED BY ME (MEGA EVIL LEVEL!!!):

solve_sudoku(
[

[3,0,1,6,7,0,0,0,4],
[0,0,0,0,3,1,0,0,0],
[0,0,0,5,4,0,0,6,0],
[0,0,0,0,0,0,0,0,0],
[0,0,8,0,0,6,0,7,0],
[0,0,6,1,0,0,3,8,2],
[6,0,0,4,1,0,0,0,0],
[8,0,0,0,6,0,0,0,0],
[7,3,0,0,0,0,0,5,1]
]).

Output:

[3,5,1,6,7,2,8,9,4]
[4,6,9,8,3,1,5,2,7]
[2,8,7,5,4,9,1,6,3]
[5,2,3,9,8,7,4,1,6]
[1,4,8,3,2,6,9,7,5]
[9,7,6,1,5,4,3,8,2]
[6,9,2,4,1,5,7,3,8]
[8,1,5,7,6,3,2,4,9]
[7,3,4,2,9,8,6,5,1]

true.

NO SOLUTIONS:

Duplicate in 3x3 matrix:

solve_sudoku(
[

[1,0,0,0,6,0,2,0,1],
[0,5,9,0,0,0,0,0,2],
[0,1,0,2,0,0,0,0,3],
[0,0,0,1,0,0,0,0,4],
[6,0,0,5,0,0,0,0,5],
[3,0,0,0,0,0,4,6,6],
[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,7,0,9],
[8,0,0,7,4,0,0,8,0]
]).

Output:


Duplicate in a column: 

solve_sudoku(
[

[3,0,1,6,7,0,0,0,4],
[0,0,0,0,3,1,0,0,0],
[0,0,0,5,4,0,0,6,0],
[0,7,0,0,0,0,0,0,0],
[0,3,8,0,0,6,0,7,0],
[0,0,6,1,0,0,3,8,2],
[6,0,0,4,1,0,0,0,0],
[8,0,0,0,6,0,0,0,0],
[7,3,0,0,0,0,0,5,1]
]).

Output:

false.

Duplicate in a row: 

solve_sudoku(
[

[3,0,1,6,7,0,0,0,4],
[0,0,0,0,3,1,0,0,0],
[0,0,0,5,4,0,0,6,0],
[0,0,0,0,0,0,0,0,0],
[0,0,8,0,6,6,0,7,0],
[0,0,6,1,0,0,3,8,2],
[6,0,0,4,1,0,0,0,0],
[8,0,0,0,6,0,0,0,0],
[7,3,0,0,0,0,0,5,1]
]).

Output:

false.
