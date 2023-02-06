def CreateNewFile(fileName, initialMessage='Hello, World')
  newFile = File.open("./#{fileName}.md", 'a+') {|file| file.write("#{initialMessage}")}
end

def ReadFile(fileName)
  file =  File.open("./#{fileName}.md") {|file| puts file.read}
end

def WriteToFile(fileName, message)
  file = File.open("./#{fileName}.md", "w+") {|file| file.write("<br> #{message}")}
end

def ArraySliceByNumber(array, number) 
  index = 0
  lastElmentDisplayed = 0
  arraySections = ""
  array.each do |element|
    iRange = array[index...index + number]
    index = index + 1
    next if (index < lastElmentDisplayed)
    lastElmentDisplayed = index + number 
    arraySections = arraySections + "#{iRange} "
  end
  return arraySections
end


def ArraySliceByNumberTwo(array, number)
  array.each 
end

testArray =  ["a",2,"b",4,"c",6,"d",8,"e",10,"f",12,"g",14,"h",16]
array_output = ArraySliceByNumber(testArray, 4)

CreateNewFile("array-output", array_output)
ReadFile("array-output")

