//
//  Player.swift
//  CommandLineProject
//
//  Created by map07 on 2023-03-01.
//
struct Player {
    var name: String
    let type: Int
    var position: Int
    var isWin: Bool {
        return position == Setting.boardSize
    }
    
    init(_ name: String, type: Int, position: Int = 1) {
        self.name = name
        self.type = type
        self.position = position
    }
    mutating func moveTo(_ newPosition: Int){
        self.position = newPosition
    }
    
    mutating func moveByStep(_ step: Int){
        self.position += step
    }
    
    var description: String {
        return "Player(name: \(name), type: \(type), position: \(position), isWin: \(isWin)"
    }
}


