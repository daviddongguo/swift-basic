//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

/**
 Creates a personalized greeting for a recipient.
 
 - Parameter recipient: The person being greeted.
 
 - Throws: `MyError.invalidRecipient`
 if `recipient` is "Derek"
 (he knows what he did).
 
 - Returns: A new string saying hello to `recipient`.
 */
func greeting(to recipient: String) throws -> String {
    guard recipient != "Derek" else {
        throw MyError.invalidRecipient
    }
    
    return "Greetings, \(recipient)!"
}

enum MyError: Error {
    case invalidRecipient
    case anotherError(reason: String)
}

do {
    try greeting(to: "Drek")
} catch MyError.invalidRecipient {
    print("cate a custome error")
}

//: [Next](@next)
