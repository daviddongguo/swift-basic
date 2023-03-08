//
//  DiceGame.swift
//  LadderAndSnake
//
//  Created by david on 2023-03-06.
//

class DiceGame {
    var players: [Player]
    let dice: Rollable
    
    init(players: [Player], dice: Rollable) {
        self.players = players
        self.dice = dice
    }
}
