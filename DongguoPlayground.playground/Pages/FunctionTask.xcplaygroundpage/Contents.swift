//: [Previous](@previous)

import Foundation
//: ## Variadic Parameters
/**
 *  A variadic parameter is a parameter that accepts zero or more values of a certain type.
 *  It is denoted by three consecutive dots, ..., following a parameter’s data type in the function definition.
 */
func totalStudents(students: String...) -> Int {
  let numStudents = students.count
  return numStudents
}

// Prints: 4
print(totalStudents(students: "Jamie", "Michael", "Rose", "Idris"))

print(type(of: Character("a")))
print(type(of: 45))
print(type(of: 45.11))

//: [Next](@next)
