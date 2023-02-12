"Hello World" println

BetterObject := Object clone
BetterObject description ::= "This is the better object.... duh....."


BetterObject doStuff :=  method(arg, setDescription(arg))

BetterObject description println
BetterObject doStuff("Im the best")
BetterObject description println
