@main def hello: Unit =  {
  val theWords = List("yo", "hi", "swiga", "this actually works", "wow")
  val theNumber = assignmentOne(theWords)
  println(theNumber)
}

def assignmentOne(words:List[String]): Int = {
  words.foldLeft(0)((sum, value) => sum + value.size)
}
