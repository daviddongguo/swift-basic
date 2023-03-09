//
//  ViewController.swift
//  GuessWord
//
//  Created by david on 2023-03-08.
//

import UIKit

class ViewController: UIViewController {
    
    let words: [String] = ["dolby", "vision", "animal", "sounds", "colorfully", "dynamic"]
    let n: Int = 0
    var word: String!
    var incorrectMoveRemaining = 5
    var wons = 0
    var losses = 0
    var guessedLettersArray: [Character] = []
    let appleTreeImages = [
        UIImage(named: "appleTree00"),
        UIImage(named: "appleTree01"),
        UIImage(named: "appleTree02"),
        UIImage(named: "appleTree03"),
        UIImage(named: "appleTree04"),
        UIImage(named: "appleTree05"),
    ]
    
    @IBOutlet weak var treeView: UIImageView!
    
    @IBOutlet weak var scoreLable: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        word = words[0]
        for button in letterButtons {
            button.addTarget(self, action: #selector(letterPressed),  for: .touchUpInside)
        }
        updateGameStatus()
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
        updateGameStatus()
        if(validate()){
            print("you win")
        }
    }
    
    fileprivate func updateGameStatus() {
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
        treeView.image = appleTreeImages[incorrectMoveRemaining]
        resultLabel.text = formatetedWord
        scoreLable.text = "Wins: \(wons) / Losses: \(losses)"
        if(incorrectMoveRemaining <= 0){
            disableLetterButtons()
        }
    }
    
    fileprivate func disableLetterButtons() {
        for button in letterButtons {
            button.isEnabled = false
        }
    }
    
    fileprivate func validate() -> Bool {
        return !(resultLabel.text?.contains("_") ?? false)
    }
}

