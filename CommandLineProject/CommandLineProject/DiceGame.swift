//
//  DiceGame.swift
//  CommandLineProject
//
//  Created by map07 on 2023-03-01.
//

class DiceGame {
    var players: [Player]
    let dice: Earnable
    
    init(players: [Player], dice: Earnable) {
        self.players = players
        self.dice = dice
    }    
}
