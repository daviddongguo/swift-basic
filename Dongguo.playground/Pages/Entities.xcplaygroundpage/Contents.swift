//: [Previous](@previous)

import Foundation

struct Address: Equatable {
    let apartmentNumber: Int = 0
    let buildingNumber: Int = 0
    let street: String
    let city: String
    let province: String
    let country: String
    let postalCode: String
}

struct Person: Equatable {
    let SIN: Int
    let firstName: String
    let lastName: String
}


//: [Next](@next)
