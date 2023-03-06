enum ClientError: Error{
    case invalidNamelength(message: String = "")
    case duplicateUserName(message: String = "... duplicate userName")
}

struct Address: Hashable{
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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(apartmentNumber)
        hasher.combine(buildingNumber)
        hasher.combine(street)
        hasher.combine(city)
        hasher.combine(province)
        hasher.combine(country)
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
            throw ClientError.invalidNamelength(message: "\(firstName) bad firstName")
        }
        self.firstName = firstName
        
        guard lastName.count <= 20 else {
            throw ClientError.invalidNamelength(message: "\(lastName) bad lastName")
        }
        self.lastName = lastName
        
        self.SIN = SIN
    }
    
    func setFirstName(_ firstName: String) throws {
        guard firstName.count <= 20 else {
            throw ClientError.invalidNamelength(message: "\(firstName) bad firstName")
        }
        self.firstName = firstName
    }
    
    func setLastName(_ lastName: String) throws {
        guard lastName.count <= 20 else {
            throw ClientError.invalidNamelength(message: "\(lastName) bad lastName")
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
    var addresses: Set<Address> = []
    var phone: String?
    
    init?(SIN: Int, firstName: String, lastName: String, userName: String, addresses: Set<Address>, phone: String? = nil) throws {
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
        self.addresses.insert(address)
    }
    
    // Proper use of toString() in Swift
    override var description: String {
        var phoneString = ""
        if let unwrapped = phone {
            phoneString = "phone: \(unwrapped), "
        }
        
        var addressesString = "["
        for (i, address) in addresses.enumerated() {
            addressesString.append("\(i + 1): \(address.description)")
            if i != addresses.count - 1 {
                addressesString.append(", ")
            }
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
        guard !clients.isEmpty else {
            return
        }
        
        for client in clients {
            if let client = client {
                if clientList.contains(where: { $0.userName == client.userName }) {
                    throw ClientError.duplicateUserName(message: "Duplicate user name for \(client)")
                }
                self.clientList.append(client)
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
        if let clientIndex = clientList.firstIndex(where: { $0.userName == userName }) {
            clientList.remove(at: clientIndex)
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
        print("There are \(clientList.count) clients as below: ")
        for(i, client) in clientList.enumerated() {
            print("\(i + 1): \(client.description)")
        }
    }
    
}

let addressArray: [Address] = [
    Address(apartmentNumber: 21, buildingNumber: 275, street: "Rue Lakeshore Road", city: "Sainte-Anne-de-Bellevue", province: "QC", country: "CA", postalCode: "HX 3L9"),
    Address(apartmentNumber: 700, buildingNumber: 1840, street: "Century Park East Suit", city: "Los Angeles", province: "california", country: "Us", postalCode: "42 West"),
    Address(buildingNumber: 9336, street: "civic Center Drive", city: "Beverly Hills", province: "california", country: "Us" )
]


// a. Initialize all inherited attributes plus all client attributes
var clientCollection = ClientDataCollection()

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
    try clientCollection.add(John_Abbott)
    try clientCollection.add(Adam_Abbott, Tom_Sawyer, Anthoyn_Hopkins)
    
}catch {
    print("error")
}



print("\n// 1- Print ArrayList of clients in ClientDataCollection ")
ClientDataCollection.printClientList(clientCollection.clientList)

print("\n// 2- Find and Print clients by lastName: Abbott")
ClientDataCollection.printClientList(clientCollection.find(lastName: "Abbott"))

print("\n// 3- Update Anthony Hopkins address to Canada, Montreal...")
clientCollection.update(userName: "anthony", address: addressArray[0])
ClientDataCollection.printClientList(clientCollection.clientList)

print("\n// 4- Delete Anthony Hopkins")
clientCollection.delete(userName: "anthony")
ClientDataCollection.printClientList(clientCollection.clientList)

print("\n// 5- Try to enter Anthony Hopkins again with the wrong information")
do {
    print("\t firstName and lastName can not be logner than 20 characters")
    let _: Client? = try Client(SIN: 444, firstName: "Anthony", lastName: "123456789101112Anthony", userName: "anthony", addresses: [addressArray[2]], phone: "111222333")
}catch ClientError.invalidNamelength(let invalid) {
    print("Error: \(invalid)")
}catch ClientError.duplicateUserName(let invalid) {
    print("Error: \(invalid)")
}catch {
    print("Error: Unknown Error")
}

do {
    let anthony = try Client(SIN: 444, firstName: "Anthony", lastName: "Hopkins", userName: "anthony", addresses: [addressArray[2]], phone: "111222333")
    print("\t can not have a dulplicate client with the same userName")
    try clientCollection.add(anthony)
    try clientCollection.add(anthony)
}catch ClientError.invalidNamelength(let invalid) {
    print("Error: \(invalid)")
}catch ClientError.duplicateUserName(let invalid) {
    print("Error: \(invalid)")
}catch {
    print("Error: Unknown Error")
}
