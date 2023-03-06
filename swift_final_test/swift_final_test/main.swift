//
//  main.swift
//  swift_final_test
//
//  Created by david on 2023-03-06.
//

import Foundation

let addressArray: [Address] = [
    Address(apartmentNumber: 21, buildingNumber: 275, street: "Rue Lakeshore Road", city: "Sainte-Anne-de-Bellevue", province: "QC", country: "CA", postalCode: "HX 3L9"),
    Address(apartmentNumber: 700, buildingNumber: 1840, street: "Century Park East Suit", city: "Los Angeles", province: "california", country: "Us", postalCode: "42 West"),
    Address(buildingNumber: 9336, street: "civic Center Drive", city: "Beverly Hills", province: "california", country: "Us" )
]
var John_Abbott: Client!
var Adam_Abbott: Client!
var Tom_Sawyer: Client!
var Anthoyn_Hopkins: Client!

do {
    
    John_Abbott = try Client(SIN: 111, firstName: "John", lastName: "Abbott", userName: "john", addresses: [addressArray[0]], phone: "5144575036")
    Adam_Abbott = try Client(SIN: 222, firstName: "Adam", lastName: "Abbott", userName: "abbott", addresses: [addressArray[0]], phone: "5144575036")
    Tom_Sawyer = try Client(SIN: 333, firstName: "Tom", lastName: "Sawyer", userName: "tom", addresses: [addressArray[1]], phone: "1234560000")
    Anthoyn_Hopkins = try Client(SIN: 444, firstName: "Anthony", lastName: "Hopkins", userName: "anthony", addresses: [addressArray[2]], phone: "111222333")
    
}catch {
    print("error")
}

// a. Initialize all inherited attributes plus all client attributes
var list = ClientDataCollection()

// b. add them to DataCollection data structure
do {
    try list.add(John_Abbott)
    try list.add(Adam_Abbott, Tom_Sawyer, Anthoyn_Hopkins)
}

// 1- Print ArrayList of clients in ClientDataCollection
ClientDataCollection.printClientList(list.clientList)

// 2- Find and Print clients by lastName: Abbott
ClientDataCollection.printClientList(list.find(lastName: "Abbott"))

// 3- Update Anthony Hopkins address to Canada, Montreal, 21 275 Rue Lakeshore Road, Sainte-Anne-de-Bellevue, QC H9X 3L9 and Print ArrayList of clients in ClientDataCollection again and show updated address
list.update(userName: "anthony", address: addressArray[0])
ClientDataCollection.printClientList(list.clientList)


// 4- Delete Anthony Hopkins and Print ArrayList of clients in ClientDataCollection again and show Anthony Hopkins does not exist
list.delete(userName: "anthony")
ClientDataCollection.printClientList(list.clientList)

// 5- Try to enter Anthony Hopkins again with the wrong information and present all your validation functionality
do {
    let _: Client? = try Client(SIN: 444, firstName: "Anthony", lastName: "Anthony", userName: "anthony", addresses: [addressArray[2]], phone: "111222333")
    
    let anthony = try Client(SIN: 444, firstName: "Anthony", lastName: "Hopkins", userName: "anthony", addresses: [addressArray[2]], phone: "111222333")
    try list.add(anthony)
    try list.add(anthony)
}catch ClientError.tooLongName(let invalid) {
    print(invalid)
}catch ClientError.duplicateUserName(let invalid) {
    print(invalid)
}




