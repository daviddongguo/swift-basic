//
//  ClientDataCollection.swift
//  swift_final_test
//
//  Created by david on 2023-03-06.
//

import Foundation

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
        print("\n\(clientList.count) clients as below: ")
        for client in clientList {
            print(client.description)
        }
    }
    
}
