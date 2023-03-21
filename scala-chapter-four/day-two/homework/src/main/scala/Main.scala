import words.*

@main def hello: Unit =  {
  val theWords = List("yo", "hi", "swiga", "this actually works", "wow", "daRn", "Shoot")
  val theNumber = assignmentOne(theWords)
  println(theNumber)
  val secondAssignment = assignmentTwo(theWords)
  println(secondAssignment)
}

def assignmentOne(words:List[String]): Int = {
  words.foldLeft(0)((sum, value) => sum + value.size)
}

def assignmentTwo(words:List[String]): List[String] = {
  val filteredList = words.map(word => {
    var filteredWord = word

    if(blackList contains word.toLowerCase) filteredWord = blackList(word.toLowerCase)
    filteredWord
  })
  filteredList
}
