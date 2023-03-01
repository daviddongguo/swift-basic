//: [Previous](@previous)

import Foundation
//: # Closures
/**
 * Closures are self-contained blocks of functionality.
 * Just like functions, closures take in arguments, execute instructions, and return a value or Void.
 */

//: ## Closures cannot have argument labels, only internal argument names

//: ## Closures can be passed as arguments into functions.
func combine(_ a: Int, _ b: Int, using combiner: (Int, Int) -> Int) -> Int {
  return combiner(a,b)
}

let add = { (a: Int, b: Int) -> Int in
  return a + b
}

let multiply = { (a: Int, b: Int) -> Int in
  return a * b
}

print(combine(2,5, using: add)) // Prints: 7
print(combine(2,5, using: multiply)) // Prints: 10

//: ## Closures can be passed as arguments into functions.
let sum = combine(2,5) { (a: Int, b: Int) -> Int in
  return a + b
}
print(sum) // Prints: 7

//: ## the arguments in parentheses, return type, and the keyword in can be omitted in exchange for shorthand argument labels
let multipler = combine(3, 3) {$0 * $1}
print(multipler)

//: ## Common Higher-order Functions
//: **filter** **map** **reduce** **sorted
/**
 * A higher-order function is a function that takes another function as an argument
 */
/*:
 ## Escaping Closures
 * A closure escapes a function when it’s called after the function returns.
 * This can happen when the closure is assigned to a variable.
 * Escaping closures must be marked with the @escaping tag in a function signature.
 */
struct TextSaver {
  var saveAction: (String) -> Void = { print("Saving '\($0)' to disk") }

  mutating func setSaveAction(to newAction: @escaping (String) -> Void) {
    saveAction = newAction
  }
}

var saver = TextSaver()
saver.saveAction("Hello World!")
// Prints: Saving 'Hello World!' to disk
saver.setSaveAction(to: { print("Saving '\($0)' to the cloud") })
saver.saveAction("Hello World!")
// Prints: Saving 'Hello World!' to the cloud

//: ## Capturing Values
//: A closure can capture constants and variables
//: from the surrounding context in which it’s defined.
//: When a closure captures a value, it keeps track of it and can manipulate the value even if the original function returns.


//: In Swift, the simplest form of a closure that can capture values is a nested function, written within the body of another function. A nested function can capture any of its outer function’s arguments and can also capture any constants and variables defined within the outer function.

/// - return () -> Int, means that it returns a function, rather than a simple value
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    /// - return an Int value eache time it's called
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    // incrementer is returned by makeIncrementer as a closure
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementByTen()
incrementBySeven()
incrementByTen()
incrementBySeven()

//: [Next](@next)
