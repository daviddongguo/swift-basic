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
    func add(_ clients: Client...) {
        for client in clients {
            self.clientList.append(client)
        }
    }
    
    /**
     * b.
     * update: Find a client by userName and update the client address
     */
    func update(userName: String = "", address: Address) {
        if var client = findClientByUserName(userName) {
            client.updateAddress(address)
        }
    }
    
    /**
     * c.
     * delete: Remove a client by userName
     */
    func delete(userName: String = ""){
        if var client = findClientByUserName(userName) {
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
    func printClientList() {
        for client in self.clientList {
            print(client.description)
        }
    }
    
}
