#puts "Hello World"

randomNumber = rand(10)

puts "Guess a number between 0 - 9"

correctGuess = false

tries = 1

while !correctGuess  
  number = gets
  if number.to_i == randomNumber.to_i 
    puts "That is.... CORRECT!!!!"
    puts "It took you #{tries} tries"
    correctGuess = true
  elsif number.to_i > randomNumber.to_i
    puts "That number is a little bit high, try again."
  elsif number.to_i < randomNumber.to_i
    puts "That number is a bit low, try again."
  else
    puts "Your input is invalid, please enter a number"
  end
  tries = tries + 1
end

