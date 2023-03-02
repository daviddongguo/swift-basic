//
//  DiceGame.swift
//  CommandLineProject
//
//  Created by map07 on 2023-03-01.
//

class DiceGame {
    var players: [Player]
    let dice: Rollable
    
    init(players: [Player], dice: Rollable) {
        self.players = players
        self.dice = dice
    }    
}
