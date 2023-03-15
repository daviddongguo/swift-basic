//
//  RandomDice.swift
//  CommandLineProject
//
//  Created by map07 on 2023-03-01.
//

class RandomDice: Rollable {
    func roll() -> Int {
        return Int.random(in: 1...Setting.maxNumberOfDice)
    }
}
