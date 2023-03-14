@main def board: Unit = {
  val stuff = new TicTacToe(
    ("O", "O", "X"),
    ("X", "X", "O"),
    ("O", "X", "X")) 
  stuff.printBoard()
  stuff.evaluateBoard()
} 

class TicTacToe(row1: Tuple3[String, String, String],
  row2: Tuple3[String, String, String],
  row3: Tuple3[String, String, String]) {

  def evaluateBoard(): Unit = {
    val correctMoves = checkMoveNumber()
    val winningMarking = checkForWin()
    val fullBoard = checkForFullBoard()
    //val correctInput = checkforincorrectinput()

    /*if (!correctInput) {
      println("All marks on the board must be an O, X, or blank")
      return
    }*/ 

    if (!correctMoves) {
      println("The order of moves played is invalid")
      return
    }

    if (winningMarking != "") println(winningMarking + " is the winner")
    if (winningMarking == "") println("There is no winner")
    if (winningMarking == "" && fullBoard) println ("The game is a draw") 
    if (winningMarking == "" && !fullBoard) println ("But the game will go on") 
  } 

  /*def checkforincorrectinput(): Boolean = {
    var index = 0
    var correctInput = true
    row1.toList.foreach { element => 
        if ((element != "O" || element != "X" || element != "") ||
          (row2(index) != "O" || row2(index) != "X" || row2(index) != "") ||
          (row3(index) != "O" || row3(index) != "X" || row3(index) != "")) {
            correctInput = false
          }
          index += 1
      }
    println(correctInput)
    return correctInput
  }*/

  def checkMoveNumber(): Boolean = {
    val boardValue = getBoardValues() 
    val numberOfX = boardValue(0)
    val numberOfO = boardValue(1)
    var correctNumberOfMoves = false
    if(numberOfX == numberOfO || numberOfX == numberOfO + 1 || numberOfX == numberOfO - 1) correctNumberOfMoves = true
    return correctNumberOfMoves
  }

  def checkForFullBoard(): Boolean = {
    val boardValues = getBoardValues()
    val numberOfX = boardValues(0)
    val numberOfO = boardValues(1)
    val fullBoard = 9
  
    var isFullBoard = false
    if( numberOfX + numberOfO == fullBoard) isFullBoard = true

    return isFullBoard 
  }

  def getBoardValues(): List[Int] = {
  val rows = List(row1, row2, row3)

    var numberOfX = 0
    var numberOfO = 0

    rows.foreach { row => {
      numberOfX += row.toList.count(element => element == "X")
      numberOfO += row.toList.count(element => element == "O")
    }}

    return List(numberOfX, numberOfO)
  }

  def checkForWin(): String = {
    var winningMarking = ""
    val rows = winByRow() 
    val colloms = winByCollom()
    val diagnals = winByDiagnal()

    if (rows != "") winningMarking = rows
    if (colloms != "") winningMarking = colloms
    if (diagnals != "") winningMarking = diagnals
    return winningMarking
  }

  def winByRow(): String = {
    var winningMarking = ""
    if( row1.toList.distinct.length == 1 && (row1(0) == "X" || row1(0) == "O")) winningMarking = row1(0)
    if( row2.toList.distinct.length == 1 && (row2(0) == "X" || row2(0) == "O")) winningMarking = row2(0)
    if( row3.toList.distinct.length == 1 && (row3(0) == "X" || row3(0) == "O")) winningMarking = row3(0)
    return winningMarking
  }

  def winByCollom(): String = {
    var winningMarking = ""

    var index = 0
    row1.toList.foreach { element => {
      val isWin = row2(index) == element && 
        row3(index) == element
        if (isWin && (row1(0) == "X" || row1(0) == "O")) winningMarking = element
        index += 1
      }}
    return winningMarking
  }

  def winByDiagnal(): String = {
    val centerValue = row2(1)
    var winningMarking = ""
    val isWin = (row1(0) == centerValue && row3(2) == centerValue) || 
      (row1(2) == centerValue && row3(0) == centerValue) 
    if(isWin && (row1(0) == "X" || row1(0) == "O")) winningMarking = centerValue
    return winningMarking 
  }

  def printBoard() = {
    println(this.row1)
    println(this.row2)
    println(this.row3)
  }
}
