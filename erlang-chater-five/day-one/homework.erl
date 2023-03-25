-module(homework).
-export([words_in_string/1]).
-export([count_to_ten/0]).
-export([ print_message/1]).

% Assignment One:
words_in_string(String) -> words_in_string(string:trim(String), 0).

words_in_string([], NumberOfWords) -> NumberOfWords + 1;
words_in_string([$\s|Rest], NumberOfWords) -> words_in_string(Rest, NumberOfWords + 1);
words_in_string([_|Rest], NumberOfWords) -> words_in_string(Rest, NumberOfWords).


% Assignment Two:
count_to_ten() -> count_to_ten(0).

count_to_ten(10) -> 10;
count_to_ten(Count) ->
    io:format("~p~n", [Count]),
    count_to_ten(Count + 1).

% Assignment Three:
print_message(success) -> io:format("success~n");
print_message({Error, Message}) -> io:format("Error: ~p, Message: ~p~n", [Error, Message]).
    
