//
//  Entities.swift
//  swift_final_test
//
//  Created by david on 2023-03-06.
//

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

class Person: Equatable {
    let SIN: Int = 0
    let firstName: String = ""
    let lastName: String = ""
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.SIN == rhs.SIN
    }
    
}
class Client: Person, CustomStringConvertible  {
    let userName: String = ""
    let password: String = ""
    var addresses: [Address] = []
    
    func updateAddress(_ address: Address) {
        self.addresses.append(address)
    }
    
    var description: String {
        return """
        {
            userName: \(self.userName),
            count: \(self.addresses.count)
        }
        """
    }
}
