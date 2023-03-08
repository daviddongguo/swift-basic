//
//  ViewController.swift
//  GuessWord
//
//  Created by david on 2023-03-08.
//

import UIKit

class ViewController: UIViewController {
    
    let word = "apple"
    var incorrectMoveRemaining = 5
    var wons = 0
    var losses = 0
    var guessedLettersArray: [Character] = []
    

    @IBOutlet weak var scoreLable: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for button in letterButtons {
            button.addTarget(self, action: #selector(letterPressed),  for: .touchUpInside)
        }
    }
    
    @objc func letterPressed(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text?.lowercased() else {
            print("no text in this button")
            return
        }
            print(text)
        let character = Character(text)
        if word.contains(character) {
            wons += 1
            guessedLettersArray.append(character)
        }else {
            losses += 1
            incorrectMoveRemaining -= 1
        }
        formattedWordForRrepsentation()
    }
    
    fileprivate func formattedWordForRrepsentation() {
        var formatetedWord = ""
        for letter in word {
            if guessedLettersArray.contains(letter) {
                formatetedWord += String(letter).uppercased()
            }
            else {
                formatetedWord += "_"
            }
            formatetedWord += " "
        }
        resultLabel.text = formatetedWord
        scoreLable.text = "Wins: \(wons) / Losses: \(losses)"
    }
}


