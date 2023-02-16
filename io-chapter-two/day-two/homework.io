LearningObject := Object clone

"\nFibbinacci \n----------------" println

 LearningObject Fib := method(nthNumber,
    firstNumber := 1
    secondNumber := 1
    nextNumber := 0
    index := 0
    
    while(index <= nthNumber,
        nextNumber = firstNumber + secondNumber
        secondNumber = firstNumber
        firstNumber = nextNumber
        index = index + 1
        nextNumber println
       )
    return nextNumber
) 

/*LearningObject Fib := method(n,
    if(n <=2, return 1)
    return Fib(n - 1) + Fib(n - 2)
)*/

LearningObject Fib(8) println

"\nImproved Division \n----------------" println

 Number divide := Number getSlot("/")

 Number / := method(number,
    value := if(number == 0, 0, self divide(number))
    return value 
 )

 basicOutput := 2/3 
 basicOutput println
 zeroOutput := 2 / 0 
 zeroOutput println

"\nAdding Up a 2D Array \n----------------" println

twoDArray := list(
    list(2,4,5),
    list(2,5,1),
    list(4,3,8),
    list(9,2,4),
    list(7,7,7,1)
    )

2DArraySum := method(twoDArray,
    return twoDArray flatten reduce(+)
)

2DArraySum(twoDArray) println

"\nAverage of a List  \n----------------" println

myList := list(1,4,9,1)
myList MyAverage := method(return self average)
myList MyAverage println



"\nMatrix \n----------------" println

Matrix := Object clone
Matrix listValue := list()

Matrix dim := method(x, y,
    listValue := self listValue
    listValue setSize(x) 
    listValue foreach(i,v,
        yList := list() setSize(y)
        listValue atPut(i, yList)

    )
)

Matrix set := method(x, y, value,
    listValue := self listValue
    listValue at(x) atPut(y, value)
)

Matrix get := method(x, y,
    listValue := self listValue
    return listValue at(x) at(y)
)

Matrix transpose := method(
    orgListValue := self listValue clone
    outputMatrix := Matrix clone
    outputMatrix dim(listValue at(0) size, listValue size)
    
    orgListValue foreach(xi, xv, 
        xv foreach(yi, yv,
        outputMatrix listValue at(yi) atPut(xi, yv)
        )
    )
    return outputMatrix listValue
)

Matrix toFile := method(path,
    listValue := self listValue
    matrixFile := File clone openForUpdating(path)
    listValue foreach(xi, xv,
        xv foreach(yi, yv,
            if(yv == nil, matrixFile write("0 "), matrixFile write(yv .. " "))
        )
        matrixFile write("\n")
   )
    matrixFile rewind
    matrixLines := matrixFile readLines
    matrixLines foreach(i, line, line println)

    matrixFile close
)

cool := Matrix

cool dim(3, 5)

cool set(0, 2, 6)

//cool get(0, 2) println

//cool transpose println

cool toFile("./matrix.txt")


"\nRandom Game \n----------------" println



