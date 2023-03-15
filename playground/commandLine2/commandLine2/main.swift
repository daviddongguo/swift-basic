//
//  main.swift
//  commandLine2
//
//  Created by map07 on 2023-03-15.
//

import Foundation

print("Hello, World!")

enum UserError: Error{
    case duplicateUserName(message: String = "... duplicate userName")
}


class User: Equatable, CustomStringConvertible {
    
    private(set) var id: Int = 1
    private(set) var firstName: String?
    private(set) var lastName: String?
    private(set) var userName: String
    private(set) var password: String
    private(set) var question: String?
    private(set) var answer: String?
    
    // for debugging
    init(userName: String, password: String) {
        self.userName = userName.lowercased()
        self.password = password
    }
    
    init(id: Int, firstName: String, lastName: String, userName: String, password: String, question: String, answer: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.password = password
        self.userName = userName.lowercased()
        self.question = question
        self.answer = answer
    }
    
    func setUserName(_ userName: String) {
        self.userName = userName.lowercased()
    }
    
    func isValidatedPassword(_ password: String) -> Bool {
        return self.password == password
    }
    
    
    func updatePassword(oldPassword: String, newPassword: String) -> Bool {
        if !isValidatedPassword(oldPassword) {
            return false
        }
        self.password = newPassword
        return true
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.userName == rhs.userName
    }
    
    var description: String {
        return "\(self.id): \(self.userName)"
    }
}


class ListOfUsers {
    var list: [User]
    init(_ list: [User] = []) {
        self.list = list
    }
    func find(_ id: Int) -> User? {
        return self.list.first{$0.id == id}
    }
    
    func findByUserName(_ userName: String = "") -> User? {
        return self.list.first{$0.userName == userName}
    }
    
    func IsExistedUserName(_ userName: String = "") -> Bool {
        return findByUserName(userName) != nil
    }
    
    
    func add(_ user: User) throws {
        if IsExistedUserName(user.userName) {
            throw UserError.duplicateUserName(message: "Duplicate user name for \(user.userName)")
        }
        self.list.append(user)
    }
    
    func isValidatedPassword(_ user: User, password: String) -> Bool {
        return user.password == password
    }
    
    
    func updatePassword(id: Int, oldPassword: String, newPassword: String) -> Bool {
        guard var user = find(id) else {
            return false
        }
        
        return user.updatePassword(oldPassword: oldPassword, newPassword: newPassword)
    }
    
}




// a. Initialize all inherited attributes plus all client attributes
var listOfUsers = ListOfUsers()
let user = User(userName: "john", password: "j")



do {
    try listOfUsers.add(user)
    try listOfUsers.add(user)

}catch UserError.duplicateUserName(let invalid) {
    print("Error: \(invalid)")
}catch {
    print("Error: Unknown Error")
}



