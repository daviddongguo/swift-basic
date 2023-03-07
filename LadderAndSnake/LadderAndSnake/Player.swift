//
//  Player.swift
//  CommandLineProject
//
//  Created by map07 on 2023-03-01.
//
struct Player {
    var name: String
    let type: Int
    var position: Int = 0
    var isWin: Bool {
        return self.position == Setting.boardSize
    }
    
    init(_ name: String, type: Int, position: Int = 1) {
        self.name = name
        self.type = type
    }
    mutating func moveTo(_ newPosition: Int){
        self.position = newPosition
    }
    
    var description: String {
        return "Player(name: \(name), type: \(type), position: \(position), isWin: \(isWin)"
    }
}

var players: [Player] = [
    .init("Please", type: 0, position: 1),
    .init("Enter", type: 1, position: 2),
    .init("Your", type: 2, position: 3),
    .init("Name", type: 3, position: 4),
]
