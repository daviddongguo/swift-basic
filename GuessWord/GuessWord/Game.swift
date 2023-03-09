//
//  Game.swift
//  GuessWord
//
//  Created by map07 on 2023-03-09.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLettersArray: [Character]
    
    var formattedWordForPresentation: String {
        var rightGuessedChars = ""
        for letter in word {
            if guessedLettersArray.contains(letter) {
                rightGuessedChars += "\(letter)"
            } else {
                rightGuessedChars += "_"
            }
        }
        
        return rightGuessedChars
    }
    
    mutating func validatePlayerGuessed(letter: Character) {
        if word.contains(letter) {
            guessedLettersArray.append(letter)
        } else {
            incorrectMovesRemaining -= 1
        }
    }
}
