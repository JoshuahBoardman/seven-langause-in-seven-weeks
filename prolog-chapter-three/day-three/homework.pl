valid_board([]).
valid_board([Head|Tail]) :-
  fd_all_different(Head), 
  valid_board(Tail).

format_sudoku([], _).
format_sudoku(List, N) :-
    append(Chunk, Rest, List),
    length(Chunk, N),
    write(Chunk), nl,
    format_sudoku(Rest, N).

valid_board_size([], 0).
valid_board_size(Board, Size) :-
    length(Board, List_size),
    Size is floor(sqrt(List_size)),
    Size ^ 2 =:= List_size.


sudoku_rows([], _, []).
sudoku_rows(Board, Size, [H|T]) :- 
   length(H, Size),
   append(H, Rest, Board),
   sudoku_rows(Rest, Size, T). 


sudoku(Board, Solution) :-
    valid_board_size(Board, Board_Size),
    fd_domain(Board, 1, Board_Size),
    Solution = Board,
    sudoku_rows(Board, Board_Sized, Rows),
    valid_board(Rows).




/*sudoku(Board, Solution) :-
  Solution = Board, 
  Board = [ A1, B1, C1, D1, 
            A2, B2, C2, D2, 
            A3, B3, C3, D3, 
            A4, B4, C4, D4], 
  fd_domain(Board, 1, 4), 

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

  valid_board([ Row1, Row2, Row3, Row4, 
                Column1, Column2, Column3, Column4, 
                Square1, Square2, Square3, Square4]),
       format_sudoku(Solution, 4).*/ 

/*sudoku(Board, Solution) :-
  Solution = Board, 
  Board = [ A1, B1, C1, D1, E1, F1, 
            A2, B2, C2, D2, E2, F2, 
            A3, B3, C3, D3, E3, F3, 
            A4, B4, C4, D4, E4, F4,
            A5, B5, C5, D5, E5, F5,
            A6, B6, C6, D6, E6, F6], 
     fd_domain(Board, 1, 6), 

  Row1 = [A1, B1, C1, D1, E1, F1], 
  Row2 = [A2, B2, C2, D2, E2, F2], 
  Row3 = [A3, B3, C3, D3, E3, F3], 
  Row4 = [A4, B4, C4, D4, E4, F4],
  Row5 = [A5, B5, C5, D5, E5, F5],
  Row6 = [A6, B6, C6, D6, E6, F6],

  Column1 = [A1, A2, A3, A4, A5, A6], 
  Column2 = [B1, B2, B3, B4, B5, B6], 
  Column3 = [C1, C2, C3, C4, C5, C6], 
  Column4 = [D1, D2, D3, D4, D5, D6], 
  Column5 = [E1, E2, E3, E4, E5, E6], 
  Column6 = [F1, F2, F3, F4, F5, F6], 

  Square1 = [A1, B1, C1, A2, B2, C2], 
  Square2 = [D1, E1, F1, D2, E2, F2], 
  Square3 = [A3, B3, C3, A4, B4, C4],
  Square4 = [D3, E3, F3, D4, E4, F4],
  Square5 = [A5, B5, C5, A6, B6, C6],
  Square6 = [D5, E5, F5, D6, E6, F6],

  valid_board([ Row1, Row2, Row3, Row4, Row5, Row6, 
                Column1, Column2, Column3, Column4, Column5, Column6, 
                Square1, Square2, Square3, Square4, Square5, Square6]).


sudoku(Board, Solution) :-
  Solution = Board, 
  Board = [ A1, B1, C1, D1, E1, F1, G1, H1, I1, 
            A2, B2, C2, D2, E2, F2, G2, H2, I2, 
            A3, B3, C3, D3, E3, F3, G3, H3, I3, 
            A4, B4, C4, D4, E4, F4, G4, H4, I4,
            A5, B5, C5, D5, E5, F5, G5, H5, I5,
            A6, B6, C6, D6, E6, F6, G6, H6, I6,
            A7, B7, C7, D7, E7, F7, G7, H7, I7,
            A8, B8, C8, D8, E8, F8, G8, H8, I8, 
            A9, B9, C9, D9, E9, F9, G9, H9, I9],
     fd_domain(Board, 1, 9), 

  Row1 = [A1, B1, C1, D1, E1, F1, G1, H1, I1], 
  Row2 = [A2, B2, C2, D2, E2, F2, G2, H2, I2], 
  Row3 = [A3, B3, C3, D3, E3, F3, G3, H3, I3], 
  Row4 = [A4, B4, C4, D4, E4, F4, G4, H4, I4],
  Row5 = [A5, B5, C5, D5, E5, F5, G5, H5, I5],
  Row6 = [A6, B6, C6, D6, E6, F6, G6, H6, I6],
  Row7 = [A7, B7, C7, D7, E7, F7, G7, H7, I7],
  Row8 = [A8, B8, C8, D8, E8, F8, G8, H8, I8],
  Row9 = [A9, B9, C9, D9, E9, F9, G9, H9, I9],

  Column1 = [A1, A2, A3, A4, A5, A6, A7, A8, A9], 
  Column2 = [B1, B2, B3, B4, B5, B6, B7, B8, B9], 
  Column3 = [C1, C2, C3, C4, C5, C6, C7, C8, C9], 
  Column4 = [D1, D2, D3, D4, D5, D6, D7, D8, D9], 
  Column5 = [E1, E2, E3, E4, E5, E6, E7, E8, E9], 
  Column6 = [F1, F2, F3, F4, F5, F6, F7, F8, F9], 
  Column7 = [G1, G2, G3, G4, G5, G6, G7, G8, G9], 
  Column8 = [H1, H2, H3, H4, H5, H6, H7, H8, H9], 
  Column9 = [I1, I2, I3, I4, I5, I6, I7, I8, I9], 

  Square1 = [A1, B1, C1, A2, B2, C2, A3, B3, C3], 
  Square2 = [D1, E1, F1, D2, E2, F2, D3, E3, F3],
  Square3 = [G1, H1, I1, G2, H2, I2, G3, H3, I3],
  Square4 = [A4, B4, C4, A5, B5, C5, A6, B6, C6], 
  Square5 = [D4, E4, F4, D5, E5, F5, D6, E6, F6],
  Square6 = [G4, H4, I4, G5, H5, I5, G6, H6, I6],
  Square7 = [A7, B7, C7, A8, B8, C8, A9, B9, C9], 
  Square8 = [D7, E7, F7, D8, E8, F8, D9, E9, F9],
  Square9 = [G7, H7, I7, G8, H8, I8, G9, H9, I9],

  valid_board([ Row1, Row2, Row3, Row4, Row5, Row6, Row7, Row8, Row9, 
                Column1, Column2, Column3, Column4, Column5, Column6, Column7, Column8, Column9, 
                Square1, Square2, Square3, Square4, Square5, Square6, Square7, Square8, Square9]).*/
