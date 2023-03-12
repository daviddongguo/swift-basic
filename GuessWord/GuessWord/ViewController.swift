//
//  ViewController.swift
//  GuessWord
//
//  Created by david on 2023-03-08.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    private var currentGame: Game!
    private var listOfWords: [String] = ["bee", "sheep", "apple", "banana", "lemon", "orange"]
    var incorrectMovesAllowed = 5
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
   
    var guessedLettersArray: [Character] = []
    let appleTreeImages = [
        UIImage(named: "appleTree00"),
        UIImage(named: "appleTree01"),
        UIImage(named: "appleTree02"),
        UIImage(named: "appleTree03"),
        UIImage(named: "appleTree04"),
        UIImage(named: "appleTree05"),
    ]
    
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var scoreLable: UILabel!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for button in letterButtons {
            button.addTarget(self, action: #selector(buttonPressed),  for: .touchUpInside)
        }
        
        newRound()
    }
    
    fileprivate func newRound() {
        
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLettersArray: [])
            enableLetterButtons(true)
            updateUI()
        }else{
            enableLetterButtons(false)
        }
    }
    
    fileprivate func enableLetterButtons(_ bool: Bool) {
        for button in letterButtons {
            button.isEnabled = bool
        }
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        
        // let letterString = sender.title(for: .normal)
        guard let letterString = sender.titleLabel?.text?.lowercased() else {
            print("no text in this button")
            return
        }
        
        let letter = Character(letterString)
        currentGame.validatePlayerGuessed(letter: letter)
        
        UpdateGameState()
 
    }
    fileprivate func updateUI() {
        var rightLettersArray = [String]()
        for letter in currentGame.formattedWordForPresentation {
            rightLettersArray.append(String(letter))
        }
        
        treeImageView.image = appleTreeImages[currentGame.incorrectMovesRemaining]
        scoreLable.text = "Wins: \(totalWins) / Losses: \(totalLosses)"
        correctWordLabel.text = rightLettersArray.joined(separator: " ")
    }
    
    fileprivate func UpdateGameState() {
        if currentGame.incorrectMovesRemaining <= 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWordForPresentation {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    

}


