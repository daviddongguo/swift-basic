enum ClientError: Error{
    case tooLongName(message: String = "")
    case duplicateUserName(message: String = "... duplicate userName")
}

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
        var apartmentNumberString = ""
        if let unwrapped = apartmentNumber {
            apartmentNumberString = "\(unwrapped) "
        }
        
        var postalCodeString = ""
        if let unwrapped = postalCode {
            postalCodeString = ", \(unwrapped)"
        }
        
        return "Address(\(apartmentNumberString)\(buildingNumber) \(street), \(city), \(province), \(country)\(postalCodeString))"
    }
    
}



class Person: Equatable {
    let SIN: Int
    private(set) var firstName: String
    private(set) var lastName: String
    
    init?(SIN: Int, firstName: String, lastName: String) throws {
        guard firstName.count <= 20 else {
            throw ClientError.tooLongName(message: "\(firstName) bad firstName")
        }
        self.firstName = firstName
        
        guard lastName.count <= 20 else {
            throw ClientError.tooLongName(message: "\(lastName) bad lastName")
        }
        self.lastName = lastName
        
        self.SIN = SIN
    }
    
    func setFirstName(_ firstName: String) throws {
        guard firstName.count <= 20 else {
            throw ClientError.tooLongName(message: "\(firstName) bad firstName")
        }
        self.firstName = firstName
    }
    
    func setLastName(_ lastName: String) throws {
        guard lastName.count <= 20 else {
            throw ClientError.tooLongName(message: "\(lastName) bad lastName")
        }
        self.lastName = lastName
    }
    
    // Proper use of equal method in swift
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.SIN == rhs.SIN
    }
    
    var description: String {
        return "Person(SIN: \(SIN), firstName: \(firstName), lastName: \(lastName)"
    }
    
}

class Client: Person {
    var userName: String
    var password: String? = nil
    var addresses: [Address] = []
    var phone: String?
    
    init?(SIN: Int, firstName: String, lastName: String, userName: String, addresses: [Address], phone: String? = nil) throws {
        self.userName = userName
        self.addresses = addresses
        self.phone = phone
        do {
            try super.init(SIN: SIN, firstName: firstName, lastName: lastName)
        } catch {
            throw error
        }
    }
    
    func updateAddress(_ address: Address) {
        self.addresses = []
        self.addresses.append(address)
    }
    
    // Proper use of toString() in Swift
    override var description: String {
        var phoneString = ""
        if let unwrapped = phone {
            phoneString = "phone: \(unwrapped), "
        }
        
        var addressesString = "["
        for i in 0..<addresses.count {
            addressesString.append("\(i + 1): \(addresses[i].description)")
        }
        addressesString.append("]")
        
        return "Client(userName: \(userName), \(phoneString)info: \(super.description), addresses: \(addressesString))"
    }
    
    // Proper use of equal method in swift
    static func == (lhs: Client, rhs: Client) -> Bool {
        return lhs.userName == rhs.userName
    }
    
}


class ClientDataCollection {
    var clientList: [Client]
    init(_ clientList: [Client] = []) {
        self.clientList = clientList
    }
    
    /**
     * a.
     * add: This method can be used to insert one or more new clients to the ArrayList (Overload or any other way)
     */
    func add(_ clients: Client?... ) throws {
        if(clients.isEmpty) {
            return
        }
        for client in clients {
            if let unwrapped = client {
                let clientInList = self.clientList.first{$0.userName == unwrapped.userName}
                if clientInList != nil {
                    throw ClientError.duplicateUserName(message: "\(unwrapped.userName) duplicate userName")
                }
                
                self.clientList.append(unwrapped)
            }
            
            
        }
    }
    
    /**
     * b.
     * update: Find a client by userName and update the client address
     */
    func update(userName: String = "", address: Address) -> Void {
        if let client = findClientByUserName(userName) {
            client.updateAddress(address)
        }
    }
    
    /**
     * c.
     * delete: Remove a client by userName
     */
    func delete(userName: String = ""){
        if let client = findClientByUserName(userName) {
            if let index = clientList.firstIndex(of: client){
                self.clientList.remove(at: index)
            }
        }
    }
    /**
     * d.
     * find: find clients by lastName and return an array of clients
     */
    func find(lastName: String = "") -> [Client] {
        return self.clientList.filter{$0.lastName == lastName}
    }
    
    
    /**
     * return a client or nil by userName
     */
    private func findClientByUserName(_ userName: String) -> Client? {
        self.clientList.first { client in
            client.userName == userName
        }
    }
    
    /**
     * print the clients array list
     */
    static func printClientList(_ clientList: [Client]) {
        var n = 1
        print("There are \(clientList.count) clients as below: ")
        for client in clientList {
            print("\(n): \(client.description)")
            n += 1
        }
    }
    
}

let addressArray: [Address] = [
    Address(apartmentNumber: 21, buildingNumber: 275, street: "Rue Lakeshore Road", city: "Sainte-Anne-de-Bellevue", province: "QC", country: "CA", postalCode: "HX 3L9"),
    Address(apartmentNumber: 700, buildingNumber: 1840, street: "Century Park East Suit", city: "Los Angeles", province: "california", country: "Us", postalCode: "42 West"),
    Address(buildingNumber: 9336, street: "civic Center Drive", city: "Beverly Hills", province: "california", country: "Us" )
]


// a. Initialize all inherited attributes plus all client attributes
var list = ClientDataCollection()

var John_Abbott: Client!
var Adam_Abbott: Client!
var Tom_Sawyer: Client!
var Anthoyn_Hopkins: Client!

do {
    
    John_Abbott = try Client(SIN: 111, firstName: "John", lastName: "Abbott", userName: "john", addresses: [addressArray[0]], phone: "5144575036")
    Adam_Abbott = try Client(SIN: 222, firstName: "Adam", lastName: "Abbott", userName: "abbott", addresses: [addressArray[0]], phone: "5144575036")
    Tom_Sawyer = try Client(SIN: 333, firstName: "Tom", lastName: "Sawyer", userName: "tom", addresses: [addressArray[1]], phone: "1234560000")
    Anthoyn_Hopkins = try Client(SIN: 444, firstName: "Anthony", lastName: "Hopkins", userName: "anthony", addresses: [addressArray[2]], phone: "111222333")
    
    // b. add them to DataCollection data structure
    try list.add(John_Abbott)
    try list.add(Adam_Abbott, Tom_Sawyer, Anthoyn_Hopkins)
    
}catch {
    print("error")
}






print("\n// 1- Print ArrayList of clients in ClientDataCollection ")
ClientDataCollection.printClientList(list.clientList)

print("\n// 2- Find and Print clients by lastName: Abbott")
ClientDataCollection.printClientList(list.find(lastName: "Abbott"))

print("\n// 3- Update Anthony Hopkins address to Canada, Montreal...")
list.update(userName: "anthony", address: addressArray[0])
ClientDataCollection.printClientList(list.clientList)

print("\n// 4- Delete Anthony Hopkins")
list.delete(userName: "anthony")
ClientDataCollection.printClientList(list.clientList)

print("\n// 5- Try to enter Anthony Hopkins again with the wrong information")
do {
    print("\t firstName and lastName can not be logner than 20 characters")
    let _: Client? = try Client(SIN: 444, firstName: "Anthony", lastName: "123456789101112Anthony", userName: "anthony", addresses: [addressArray[2]], phone: "111222333")
}catch ClientError.tooLongName(let invalid) {
    print("Error: \(invalid)")
}catch ClientError.duplicateUserName(let invalid) {
    print("Error: \(invalid)")
}catch {
    print("Error: Unknown Error")
}

do {
    let anthony = try Client(SIN: 444, firstName: "Anthony", lastName: "Hopkins", userName: "anthony", addresses: [addressArray[2]], phone: "111222333")
    print("\t can not have a dulplicate client with the same userName")
    try list.add(anthony)
    try list.add(anthony)
}catch ClientError.tooLongName(let invalid) {
    print("Error: \(invalid)")
}catch ClientError.duplicateUserName(let invalid) {
    print("Error: \(invalid)")
}catch {
    print("Error: Unknown Error")
}

