//
//  Player.swift
//  CommandLineProject
//
//  Created by map07 on 2023-03-01.
//
struct Player {
    let name: String
    let type: Int
    var position: Int = 0
    var isWin: Bool {
        return self.position == Setting.boardSize
    }
    
    init(_ name: String, type: Int) {
        self.name = name
        self.type = type
    }
    mutating func moveTo(_ newPosition: Int){
        self.position = newPosition
    }
}

var players: [Player] = [
    .init("Please", type: 0),
    .init("Enter", type: 1),
    .init("Your", type: 2),
    .init("Name", type: 3),
]
