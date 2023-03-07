//
//  Settings.swift
//  CommandLineProject
//
//  Created by map07 on 2023-03-01.
//
import UIKit

struct Setting {
    static let boardSize = 100
    static let maxNumberOfDice = 6
    static let startPosition = 70
    static var numberOfPlayer: Int = 4
    static let palyerImages: [UIImage?] = [
        UIImage(named: "king.png"),
        UIImage(named: "horse"),
        UIImage(named: "queen"),
        UIImage(named: "knight")]
    static let diceArray = [
        UIImage(named: "number01"),
        UIImage(named: "number02"),
        UIImage(named: "number03"),
        UIImage(named: "number04"),
        UIImage(named: "number05"),
        UIImage(named: "number06"),
    ]
    static var playerList: [Player] = []
}
