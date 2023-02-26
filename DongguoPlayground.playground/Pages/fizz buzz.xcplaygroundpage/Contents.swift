//: [Previous](@previous)

//import Foundation

for i in 1...30 {
    print("\(i): \(fizzBuzz(i))")
}

func fizzBuzz(_ num: Int) -> String {
    switch (f: num % 3 == 0, b: num % 5 == 0) {
    case(f: true, b: true):
        return "Fizz Buzz"
    case(f: true, b: false):
        return "Fizz"
    case(f: false, b: true):
        return "Buzz"
    default:
        return ""
    }
}


//: [Next](@next)
