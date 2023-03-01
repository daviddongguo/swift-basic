//
//  main.swift
//  CommandLineProject
//
//  Created by map07 on 2023-03-01.
//

let dice = MagicDice()
//dice.number = 5
//print(dice.earnScore())

let playerA = Player("A")
let playerB = Player("B")
let playerC = Player("C")
let plyers = [playerA, playerB, playerC]

let game = MiniDiceGame(players: plyers, dice: dice)
game.dicideOrder1()
game.dicideOrder(finaList: &game.players, listToDecide: game.players)

//for player in game.players {
//    print(player.name, player.totalScore)
//}


