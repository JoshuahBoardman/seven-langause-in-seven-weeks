-module(homework).
-export([getValue/2]).
-export([calculateItemCosts/1]).


% Assignment One:
getValue(List, Key) -> 
	[{Lock, Value}|Rest] = List,
	case Key of
		Lock -> Value;
		_ -> getKey(Rest, Key)
	end.

% Assignment Two:
calculateItemCosts(ShoppingList) -> 
    [{Item, Quantity * Price} || {Item, Quantity, Price} <- ShoppingList].
