-module(problem_one).
-export([decode_letters/2]).

decode_letters(Letters, Indexes) ->
    [FirstLetter|_] = Letters,
    Character = unicode:characters_to_binary([FirstLetter]),
    String = binary_to_list(Character),

    [FirstIndex|_] = Indexes,
    DecodedValue = decode_letters(Letters, Indexes, String, FirstIndex),
    DecodedValue.

decode_letters(_, _, String, 0) ->
    String;

decode_letters(Letters, Indexes, String, Index) ->
    UnicodeLetter = lists:nth(Index + 1, Letters),
    BinaryLetter = unicode:characters_to_binary([UnicodeLetter]),
    Letter = binary_to_list(BinaryLetter),
    NewString = String ++ Letter,

    NewIndex = lists:nth(Index + 1, Indexes),
    DecodedValue = decode_letters(Letters, Indexes, NewString, NewIndex),
    DecodedValue.


    
