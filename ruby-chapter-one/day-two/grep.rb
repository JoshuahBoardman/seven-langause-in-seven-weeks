def GrepFile(path, phrase)
  file =  File.open(path)
  number = 1
  file.grep(phrase) do |line|
    puts "#{number}. #{line}"
    number = number + 1
  end
end

 
GrepFile("./text.txt", /good/)

