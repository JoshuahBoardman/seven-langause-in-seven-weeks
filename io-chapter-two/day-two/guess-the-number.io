remainingChances := 10
attemptsMade := 0

"Hi there! :D" println
"I'm thinking of a number between 1 and 100." println 
"What number am I thinking of?" println

randomNumber := (Random value() * 100) roundDown

// TODO: check if the input is of number type otherwise send a message and ask again
while ( remainingChances > 0,
    attemptsMade = attemptsMade + 1
    userInput := File standardInput readLine asNumber
    
    relativeToAnswer := ""
    if ( userInput > randomNumber, relativeToAnswer = "high", relativeToAnswer = "low")

    if(userInput == randomNumber,
        ("You guessed the correct number in " .. attemptsMade .. " tries!!!! :D") println break,
        remainingChances = remainingChances - 1
        ("Your guess was a bit " .. relativeToAnswer .. ", you have " .. remainingChances .. " more tries") println
        )
    )


