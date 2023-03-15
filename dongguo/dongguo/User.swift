//
//  User.swift
//  dongguo
//
//  Created by map07 on 2023-03-15.
//
enum UserError: Error{
    case duplicateUserName(message: String = "... duplicate userName")
}

class User: Equatable, CustomStringConvertible {
    private(set) var Id: Int = 1
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
    
    init(firstName: String, lastName: String, userName: String, password: String, question: String, answer: String) {
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
    
    func setId(_ Id: Int) {
        self.Id = Id
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
        return "\(self.Id): \(self.userName)"
    }
}

class UserCollection {
    var list: [User]
    private(set) var count = 0
    init() {
        self.list = []
    }
    
    func find(_ Id: Int) -> User? {
        return self.list.first{$0.Id == Id}
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
        user.setId(self.list.count)
        self.list.append(user)
        
    }
    
    func isValidatedPassword(_ user: User?, password: String) -> Bool {
        guard let unwrapped = user else {
            return false
        }
        return unwrapped.password == password
    }
    
    func updatePassword(id: Int, oldPassword: String, newPassword: String) -> Bool {
        guard let user = find(id) else {
            return false
        }
        
        return user.updatePassword(oldPassword: oldPassword, newPassword: newPassword)
    }
    
    func printUsers() {
        print("users count: \(self.list.count)")
        for user in self.list {
            print(user.description)
        }
    }
}
