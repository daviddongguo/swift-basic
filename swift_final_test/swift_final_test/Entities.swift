//
//  Entities.swift
//  swift_final_test
//
//  Created by david on 2023-03-06.
//

import Foundation



struct Address {
    let apartmentNumber: Int?
    let buildingNumber: Int
    let street: String
    let city: String
    let province: String
    let country: String
    let postalCode: String?
    
    init(apartmentNumber: Int? = nil, buildingNumber: Int, street: String, city: String, province: String, country: String, postalCode: String? = nil) {
        self.apartmentNumber = apartmentNumber
        self.buildingNumber = buildingNumber
        self.street = street
        self.city = city
        self.province = province
        self.country = country
        self.postalCode = postalCode
    }
    
    var description: String {
//        var apartmentNumberString = ""
//        if let unwrapped = self.apartmentNumber {
//            apartmentNumberString = "\(unwrapped) "
//        }
        
        return "\(self.buildingNumber) \(self.street)"
    }
    
}

enum ClientError: Error{
    case tooLongName(message: String = "")
    case duplicateUserName(message: String = "... duplicate userName")
}

class Person: Equatable {
    let SIN: Int
    var firstName: String
    var lastName: String
    
    init(SIN: Int, firstName: String, lastName: String) throws {
        self.SIN = SIN
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func setFirstName(_ firstName: String) throws {
        if firstName.count > 20 {
            throw ClientError.tooLongName(message: "\(firstName) bad firstName")
        }
        self.firstName = firstName
    }
    
    func setLastName(_ lastName: String) throws {
        if lastName.count > 20 {
            throw ClientError.tooLongName(message: "\(lastName) bad LastName")
        }
        self.firstName = lastName
    }
    
    // Proper use of equal method in swift
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.SIN == rhs.SIN
    }
    
}
class Client: Person, CustomStringConvertible {
    var userName: String
    var password: String? = nil
    var addresses: [Address] = []
    var phone: String?
    
    init?(SIN: Int, firstName: String, lastName: String, userName: String, addresses: [Address], phone: String? = nil) throws {
        self.userName = userName
        self.addresses = addresses
        self.phone = phone
        try super.init(SIN: SIN, firstName: firstName, lastName: lastName)
    }
    
    
    func updateAddress(_ address: Address) {
        self.addresses = []
        self.addresses.append(address)
    }
    
    // Proper use of toString() in Swift
    var description: String {
        return """
        {
            userName: \(self.userName),
            address: [
                        {\(self.addresses.description)}
                     ]
        }
        """
    }
    
    // Proper use of equal method in swift
    static func == (lhs: Client, rhs: Client) -> Bool {
        return lhs.userName == rhs.userName
    }
        
}
