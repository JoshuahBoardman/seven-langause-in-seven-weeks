@main def board: Unit = {
  val stuff = new TicTacToe(
    ("X", "X", "X"),
    ("X", "X", "O"),
    ("O", "X", "_")) 
  stuff.winByRow()
  stuff.winByCollom()
  stuff.winByDiagnal()
  stuff.printBoard()
} 

class TicTacToe(row1: Tuple3[String, String, String],
  row2: Tuple3[String, String, String],
  row3: Tuple3[String, String, String]) {

  /*def validBoard() = {
    val row1 = this.row1
    val row2 = this.row2
    val row3 = this.row3
  }*/

  def winByRow( ): Boolean = {
    val row1 = this.row1.toList
    val row2 = this.row2.toList
    val row3 = this.row3.toList
     
    val winByRow = row1.distinct.length == 1 ||
      row2.distinct.length == 1 ||
      row3.distinct.length == 1
   
    return winByRow
  }

  def winByCollom(): Boolean = {
    var winByCollom = false

    var index = 0
    row1.toList.foreach { element => {
      val value = row2(index) == element && 
        row3(index) == element
        if (value) winByCollom = value
        index += 1
      }}
    return winByCollom
  }

  def winByDiagnal(): Boolean = {
    val centerValue = row2(1)
    val winByDiagnal = (row1(0) == centerValue && row3(2) == centerValue) || 
      (row1(2) == centerValue && row3(0) == centerValue) 
    return winByDiagnal
  }

  def printBoard() = {
    println(this.row1)
    println(this.row2)
    println(this.row3)
  }
}
