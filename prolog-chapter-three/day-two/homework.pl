% Reverse the elements of a list
reverse([], _).
reverse([H], [H]).
reverse([head|tail], reversed_list) :- 
    reversed_list2 = [head|reversed_list], 
    reverse(tail, reversed_list2).


% find the smallest element of a list 
smallest([], _).
smallest([H], H).
smallest([H|T], Smallest_element) :-
    smallest(T, T_smallest),
    ( H > T_smallest ->
        Smallest_element = T_smallest
    ;   Smallest_element = H
    ).

% Sort the elements of a list




