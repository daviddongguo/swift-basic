//
//  RandomDice.swift
//  CommandLineProject
//
//  Created by map07 on 2023-03-01.
//

class RandomDice: Earnable {
    func earnScore() -> Int {
        return Int.random(in: 1...6)
    }
}
