//: [Previous](@previous)

//import Foundation

for i in 1...30 {
    print("\(i): \(fizzBuzz(i))")
}

func fizzBuzz(_ num: Int) -> String {
    switch (num % 3 == 0, num % 5 == 0) {
    case(true, true):
        return "Fizz Buzz"
    case(true, false):
        return "Fizz"
    case(false, true):
        return "Buzz"
    default:
        return ""
    }
}


//: [Next](@next)
