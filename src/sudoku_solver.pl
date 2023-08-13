% solve_sudoku(+Matrix).
% prints solved sudoku if it exists, otherwise fail
solve_sudoku(Matrix) :-
    % replace first 0 with 1 to 9
    try_matrix(Matrix, NewMatrix),
    % check if it is correct
    check_matrix(NewMatrix),
    % replace other 0 until they exist
    solve_sudoku(NewMatrix), !.

solve_sudoku(Answer) :-
    % case in which matrix does not have 0
    no_zero_in_matrix(Answer),
    % check if it is correct answer
    check_matrix(Answer),
    % print completed sudoku
    print_matrix(Answer), !.


% check_matrix(+Matrix). 
% returns true if matrix is correct (according to sudoku rules), otherwise fails
check_matrix(Matrix) :-
    % check rows
    check_rows(Matrix),
    % check columns
    transpose(Matrix, Transposed),
    check_rows(Transposed),
    % check 3x3 rows
    split_matrix(Matrix, Splited),
    check_rows(Splited), !.


% transpose(+Matrix, -Transposed).
transpose([Head|_], Transposed) :-
    Head = [],
    Transposed = [].

transpose(Matrix, [Column|Transposed]) :-
    first_column(Matrix, Column, NewMatrix),
    transpose(NewMatrix, Transposed).


% first_column(+Matrix, -Column, -NewMatrix).
first_column([], Column, NewMatrix) :-
    Column = [],
    NewMatrix = [].
    
first_column([Head|Tail], [Head2|Next], [Tail2|NextTail]) :-
    [Head2|Tail2] = Head,
    first_column(Tail, Next, NextTail).


% check_rows(+Matrix)
% check if rows of matrix does not have duplicates beside 0 (0 - we have not filled in yet)    
check_rows([]).
check_rows([Head|Tail]) :-
    check_row(Head),
    check_rows(Tail).

% check_row(+Row)
check_row(Row) :-
    % remove all 0 from the row
    exclude(=(0), Row, NonZero),
    % check no repetions in NonZero row
    no_repeats(NonZero), !.


% no_repeats(+List).
no_repeats([]).
no_repeats(List) :-
    % remove duplicates
    setof(X, member(X, List), Set),

    % if length is the same so there are no duplicates
    length(Set, Length),
    length(List, LengthOrig),
    Length = LengthOrig, !.   


% split_matrix(+Matrix, -Splited).
split_matrix([A,B,C,D,E,F,G,H,I], [[A1,A2,A3,B1,B2,B3,C1,C2,C3],[A4,A5,A6,B4,B5,B6,C4,C5,C6],[A7,A8,A9,B7,B8,B9,C7,C8,C9],[D1,D2,D3,E1,E2,E3,F1,F2,F3],[D4,D5,D6,E4,E5,E6,F4,F5,F6],[D7,D8,D9,E7,E8,E9,F7,F8,F9],[G1,G2,G3,H1,H2,H3,I1,I2,I3],[G4,G5,G6,H4,H5,H6,I4,I5,I6],[G7,G8,G9,H7,H8,H9,I7,I8,I9]]) :-
    [A1,A2,A3,A4,A5,A6,A7,A8,A9] = A,
    [B1,B2,B3,B4,B5,B6,B7,B8,B9] = B,
    [C1,C2,C3,C4,C5,C6,C7,C8,C9] = C,
    [D1,D2,D3,D4,D5,D6,D7,D8,D9] = D,
    [E1,E2,E3,E4,E5,E6,E7,E8,E9] = E,
    [F1,F2,F3,F4,F5,F6,F7,F8,F9] = F,
    [G1,G2,G3,G4,G5,G6,G7,G8,G9] = G,
    [H1,H2,H3,H4,H5,H6,H7,H8,H9] = H,
    [I1,I2,I3,I4,I5,I6,I7,I8,I9] = I.


% try_matrix(+Matrix, -NewMatrix).
% replace the first occurrence of 0 with a number from 1 to 9
try_matrix(Matrix, NewMatrix) :-
    replace_first_zero(Matrix, NewMatrix, 1);
    replace_first_zero(Matrix, NewMatrix, 2);
    replace_first_zero(Matrix, NewMatrix, 3);
    replace_first_zero(Matrix, NewMatrix, 4);
    replace_first_zero(Matrix, NewMatrix, 5);
    replace_first_zero(Matrix, NewMatrix, 6);
    replace_first_zero(Matrix, NewMatrix, 7);
    replace_first_zero(Matrix, NewMatrix, 8);
    replace_first_zero(Matrix, NewMatrix, 9), !.


% replace_first_zero(+Matrix, -NewMatrix, +Num).
% replace the first zero in the matrix with Num
replace_first_zero([Row|Other], [NewRow|Other], Num) :-
    replace_first_zero_in_row(Row, NewRow, Num), !.

replace_first_zero([Row|Other], [Row|NewRows], Num) :-
    replace_first_zero(Other, NewRows, Num), !.


% replace_first_zero_in_row(+Row, -NewRow, +Num)
% replace the first zero in the current row with Num
replace_first_zero_in_row([0|Tail], [Num|Tail], Num).

replace_first_zero_in_row([Head|Tail], [Head|NewTail], Num) :-
    replace_first_zero_in_row(Tail, NewTail, Num), !.


% print_matrix(+Matrix).
print_matrix([]).
print_matrix([H|T]) :- 
    write(H), 
    nl,
    print_matrix(T).


% no_zero_in_matrix(+Matrix).
% return true if matrix does not have 0
no_zero_in_matrix([]).
no_zero_in_matrix([Head|Tail]) :-
    not(member(0, Head)),
    no_zero_in_matrix(Tail), !.




/*

 Tests from https://www.sudokuonline.io:


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

IMPOSSIBLE LEVEL:
solve_sudoku(
[
[0,0,0,0,0,4,0,0,8],
[6,0,0,0,0,5,0,0,0],
[0,4,2,0,0,0,3,6,0],
[0,7,4,0,1,0,8,5,0],
[8,0,0,3,0,7,0,0,9],
[1,3,0,0,4,0,0,2,7],
[0,8,3,0,0,0,4,9,0],
[0,0,0,0,0,3,0,0,1],
[4,0,0,0,0,9,0,0,0]
]).


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

*/