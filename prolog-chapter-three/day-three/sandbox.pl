% Sudoku

valid_bored([]).

valid_bored([H|T]) :- 
    fd_all_different(H),
    valid_bored(T).


sudoku(Bored, Solution) :-
    Solution = Bored,
    Bored = [A1,B1,C1,D1,
             A2,B2,C2,D2,
             A3,B3,C3,D3,
             A4,B4,C4,D4],
    fd_domain(Bored, 1, 4),

    Row1 = [A1, B1, C1, D1],
    Row2 = [A2, B2, C2, D2],
    Row3 = [A3, B3, C3, D3],
    Row4 = [A4, B4, C4, D4],

    Column1 = [A1, A2, A3, A4],
    Column2 = [B1, B2, B3, B4],
    Column3 = [C1, C2, C3, C4],
    Column4 = [D1, D2, D3, D4],

    Square1 = [A1, B1, A2, B2],
    Square2 = [C1, D1, C2, D2],
    Square3 = [A3, B3, A4, B4],
    Square4 = [C3, D3, C4, D4],
    
    valid_bored([Row1, Row2, Row3, Row4,
                 Column1, Column2, Column3, Column4,
                 Square1, Square2, Square3, Square4]).


% Eight Queens

queen((R, F)) :-
     fd_domain(R, 1, 8),
     fd_domain(F, 1, 8).

eight_queens(Queens) :-
    length(Queens, 8),
    Queen = queen((R,F)),
    fd_domain(Queens, Queen).


one_to_eight(Number) :- fd_domain(Number, 1, 8).

cols([], []).
cols([(_, Col)|QueensTail], [Col|ColsTail]) :-
cols(QueensTail, ColsTail).


thing(X) :- write(X).
