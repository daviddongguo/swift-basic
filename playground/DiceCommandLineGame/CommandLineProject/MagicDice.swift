//
//  MagicDice.swift
//  CommandLineProject
//
//  Created by map07 on 2023-03-01.
//

import Foundation

class MagicDice: Rollable {
    private var number: Int = 6
    func roll() -> Int {
        return self.number
    }
    func setNumber(_ number: Int){
        self.number = number
    }
}
