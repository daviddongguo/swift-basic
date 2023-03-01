//
//  MagicDice.swift
//  CommandLineProject
//
//  Created by map07 on 2023-03-01.
//

import Foundation

class MagicDice: Earnable {
    public var number: Int = 6
    func earnScore() -> Int {
        return self.number
    }
}
