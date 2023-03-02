//
//  main.swift
//  CommandLineProject
//
//  Created by map07 on 2023-03-01.
//

let dice = MagicDice()
//let dice = RandomDice()
//dice.number = 5
(1...100).forEach { i in
    dice.setNumber(i % 6 + 1)
    print(dice.roll())
}

let playerA = Player("A")
let playerB = Player("B")
let playerC = Player("C")
let plyers = [playerA, playerB, playerC]


//let game = MiniDiceGame(players: plyers, dice: dice)
//game.dicideOrder1()
//var list: [Player] = []
//game.dicideOrder(finaList: &list, listToDecide: game.players)

//print("the order of starting game")
//for player in list {
//    print(player.name, player.totalScore)
//}
//print("end print")

