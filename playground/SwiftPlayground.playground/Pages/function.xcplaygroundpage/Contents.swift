//: [Previous](@previous)

func add      (x: Int, y:Int) -> Int { return x+y }
func subtract (x: Int, y:Int) -> Int { return x-y }
func multiply (x: Int, y:Int) -> Int { return x*y }
func divide   (x: Int, y:Int) -> Int { return x/y }

var someOperation : (Int, Int) -> Int

someOperation = add
someOperation(3,4)

someOperation = subtract
someOperation(3,4)

someOperation = multiply
someOperation(3,4)

someOperation = divide
someOperation(3,4)
//: [Next](@next)
