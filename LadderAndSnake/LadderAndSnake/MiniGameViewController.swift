//
//  MiniGameViewController.swift
//  LadderAndSnake
//
//  Created by david on 2023-03-05.
//

import UIKit

class MiniGameViewController: UIViewController {
    
    @IBOutlet var loginCard: UIView!
    
    @IBOutlet weak var startGameButton: UIButton!
    
    var dice = RandomDice()
    var finallist: [Player] = []
    var tempList: [Player] = []
    // goto line 384
    
    var unUsedIndex: [Int] = [0, 1, 2, 3]
    // goto line 346
    
    
    var initPlayers: [Player] = [
        .init("Please", type: 0, position: 0),
        .init("Enter", type: 1, position: 0),
        .init("Your", type: 2, position: 0),
        .init("Name", type: 3, position: 0),
    ]
    
    var names: [String] = ["King", "Horse", "Queen", "Knight"]
    
    var collumnSize: Double = 0
    var rowSize: Double = 0
    
    var seleted2playersButton: UIButton?
    var seleted4playersButton: UIButton?
    var textFields: [UITextField] = []
    var dices: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        collumnSize = loginCard.frame.size.width / 8
        rowSize = loginCard.frame.size.height / 8
        
        //TODO: disable startGameButton when finish debugging
        startGameButton.isEnabled = false
        
        seleted2playersButton = createSelectButton1()
        seleted4playersButton = createSelectButton2()
        
        textFields.append(createTextField1())
        textFields.append(createTextField2())
        textFields.append(createTextField3())
        textFields.append(createTextField4())
        
        dices.append(createDivce(0))
        dices.append(createDivce(1))
        dices.append(createDivce(2))
        dices.append(createDivce(3))
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupCard()
        
    }
    
    private func setupCard() {
        
        for subview in loginCard.subviews {
            subview.removeFromSuperview()
        }
        
        loginCard.addSubview(seleted2playersButton!)
        loginCard.addSubview(seleted4playersButton!)
        loginCard.addSubview(createPlayer1())
        loginCard.addSubview(createPlayer2())
        loginCard.addSubview(createPlayer3())
        loginCard.addSubview(createPlayer4())
        loginCard.addSubview(textFields[0])
        loginCard.addSubview(textFields[1])
        loginCard.addSubview(textFields[2])
        loginCard.addSubview(textFields[3])
        loginCard.addSubview(dices[0])
        loginCard.addSubview(dices[1])
        loginCard.addSubview(dices[2])
        loginCard.addSubview(dices[3])
        
        startGameButton.addTarget(self, action: #selector(startGameButtonPressed),  for: .touchUpInside)
        
    }
    
    
    private func setupCardWithTwoPlayers() {
        
        for subview in loginCard.subviews {
            subview.removeFromSuperview()
        }
        
        loginCard.addSubview(seleted2playersButton!)
        loginCard.addSubview(seleted4playersButton!)
        
        loginCard.addSubview(createPlayer1())
        loginCard.addSubview(createPlayer2())
        loginCard.addSubview(textFields[0])
        loginCard.addSubview(textFields[1])
        loginCard.addSubview(dices[0])
        loginCard.addSubview(dices[1])
    }
    
    
    
    private func createSelectButton1() -> UIButton {
        let button = UIButton(
            frame: CGRect(
                x: collumnSize * Double(2),
                y: rowSize * Double(1),
                width: collumnSize,
                height: rowSize))
        button.setTitleColor(.black, for: .normal)
        button.setTitle("2 Players", for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 8
        
        if let attrFont = UIFont(name: "Helvetica", size: 24) {
            let title = button.titleLabel!.text!
            let attrTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: attrFont])
            button.setAttributedTitle(attrTitle, for: UIControl.State.normal)
        }
        button.tag = 2
        button.addTarget(self, action: #selector(selectNumberOfplayers), for: .touchUpInside)
        return  button
    }
    
    
    private func createSelectButton2() -> UIButton {
        
        let button = UIButton(
            frame: CGRect(
                x: collumnSize * Double(5),
                y: rowSize * Double(1),
                width: collumnSize,
                height: rowSize))
        button.setTitleColor(.black, for: .normal)
        button.setTitle("4 Players", for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 8
        if let attrFont = UIFont(name: "Helvetica", size: 24) {
            let title = button.titleLabel!.text!
            let attrTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: attrFont])
            button.setAttributedTitle(attrTitle, for: UIControl.State.normal)
        }
        button.tag = 4
        button.addTarget(self, action: #selector(selectNumberOfplayers), for: .touchUpInside)
        return  button
    }
    
    private func createPlayer1() -> UIButton {
        
        let image = UIImage(named: "king.png")
        let player = UIButton(
            frame: CGRect(
                x: collumnSize * Double(0.5),
                y: rowSize * Double(2.5),
                width: collumnSize,
                height: collumnSize))
        player.setTitleColor(.black, for: .normal)
        player.setBackgroundImage(image, for: UIControl.State.normal)
        
        return  player
    }
    
    private func createTextField1() -> UITextField {
        let ui = UITextField(
            frame: CGRect(
                x: collumnSize * Double(0.5),
                y: rowSize * Double(4.5),
                width: collumnSize,
                height: rowSize * Double(0.6)))
        ui.backgroundColor = .white
        ui.textAlignment = .center
        ui.attributedPlaceholder = NSAttributedString(
            string: initPlayers[0].name,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        return  ui
    }
    
    
    
    
    
    
    private func createPlayer2() -> UIButton {
        
        let image = UIImage(named: "horse.png")
        let player = UIButton(
            frame: CGRect(
                x: collumnSize * Double(2.5),
                y: rowSize * Double(2.5),
                width: collumnSize,
                height: collumnSize))
        player.setTitleColor(.black, for: .normal)
        player.setBackgroundImage(image, for: UIControl.State.normal)
        
        return  player
    }
    
    private func createTextField2() -> UITextField {
        let ui = UITextField(
            frame: CGRect(
                x: collumnSize * Double(2.5),
                y: rowSize * Double(4.5),
                width: collumnSize,
                height: rowSize * Double(0.6)))
        ui.backgroundColor = .white
        ui.textAlignment = .center
        ui.attributedPlaceholder = NSAttributedString(
            string: initPlayers[1].name,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        return  ui
    }
    
    
    
    private func createPlayer3() -> UIButton {
        
        let image = UIImage(named: "queen.png")
        let player = UIButton(
            frame: CGRect(
                x: collumnSize * Double(4.5),
                y: rowSize * Double(2.5),
                width: collumnSize,
                height: collumnSize))
        player.setTitleColor(.black, for: .normal)
        player.setBackgroundImage(image, for: UIControl.State.normal)
        
        return  player
    }
    
    private func createTextField3() -> UITextField {
        let ui = UITextField(
            frame: CGRect(
                x: collumnSize * Double(4.5),
                y: rowSize * Double(4.5),
                width: collumnSize,
                height: rowSize * Double(0.6)))
        ui.backgroundColor = .white
        ui.textAlignment = .center
        ui.attributedPlaceholder = NSAttributedString(
            string: initPlayers[2].name,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        return  ui
    }
    
    
    
    
    
    
    private func createPlayer4() -> UIButton {
        
        let image = UIImage(named: "knight.png")
        let player = UIButton(
            frame: CGRect(
                x: collumnSize * Double(6.5),
                y: rowSize * Double(2.5),
                width: collumnSize,
                height: collumnSize))
        player.setTitleColor(.black, for: .normal)
        player.setBackgroundImage(image, for: UIControl.State.normal)
        
        return  player
    }
    
    private func createTextField4() -> UITextField {
        let ui = UITextField(
            frame: CGRect(
                x: collumnSize * Double(6.5),
                y: rowSize * Double(4.5),
                width: collumnSize,
                height: rowSize * Double(0.6)))
        ui.backgroundColor = .white
        ui.textAlignment = .center
        ui.attributedPlaceholder = NSAttributedString(
            string: initPlayers[3].name,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        return  ui
    }
    
    private func createDivce(_ i: Int) -> UIButton {
        let ui = UIButton(
            frame: CGRect(
                x: collumnSize * Double(0.7 + 2.0 * Double(i)),
                y: rowSize * Double(6),
                width: collumnSize * Double(0.6),
                height: collumnSize * Double(0.6)))
        ui.setTitleColor(.black, for: .normal)
        ui.setBackgroundImage(Setting.diceArray[i], for: UIControl.State.normal)
        ui.tag = i
        ui.addTarget(self, action: #selector(diceButtonPressed),  for: .touchUpInside)
        return  ui
    }
    
    //Actions
    @objc func diceButtonPressed(_ sender: UIButton) {
        let index = sender.tag
                let score = dice.roll()
//        let score = 3
        initPlayers[index].moveTo(score)
        
        // change dice image on score and disable text field
        sender.setBackgroundImage(Setting.diceArray[score - 1], for: UIControl.State.normal)
        sender.isEnabled = false
        textFields[index].backgroundColor = .yellow
        textFields[index].isEnabled = false
        
        
        // add players into final list
        // 2 players
        if(Setting.numberOfPlayer == 2 && allPlayersRolled()){
            if initPlayers[0].position == initPlayers[1].position {
                dices[0].isEnabled = true
                dices[1].isEnabled = true
            }else{
                if initPlayers[0].position > initPlayers[1].position {
                    finallist.append(initPlayers[0])
                    finallist.append(initPlayers[1])
                }else{
                    finallist.append(initPlayers[1])
                    finallist.append(initPlayers[0])
                }
                startGameButton.isEnabled = true
            }
        }
        
        // 4 players
        if Setting.numberOfPlayer == 4 && allPlayersRolled(){
            if unUsedIndex.isEmpty {
                startGameButton.isEnabled = true
            }
            if unUsedIndex.count == 1 {
                finallist.append(initPlayers[unUsedIndex[0]])
                startGameButton.isEnabled = true
            }
            
            // 2 or more players will roll again
            for score in stride(from: 6, through: 1, by: -1) {
                var count = 0
                var indexToRemove: Int?
                var unDecided: [Int] = []
                
                // [0, 1, 2, 3]
                for indexValue in unUsedIndex {
                    if(score == initPlayers[indexValue].position) {
                        if(count == 0){
                            indexToRemove = indexValue
                        }
                        count += 1
                        unDecided.append(indexValue)
                    }
                }
                if(count == 1 ){
                    if let unwrapped = indexToRemove {
                        if let indexOfInUnsedIndex = unUsedIndex.firstIndex(of: unwrapped){
                            unUsedIndex.remove(at: indexOfInUnsedIndex)
                            finallist.append(Player( textFields[unwrapped].text ?? "\(names[unwrapped])", type: unwrapped, position: unwrapped))
                            print("list count: \(finallist.count)")
                        }
                    }
                } // end of add one player
            }// end of score loop from 6 through 1
            
            for i in unUsedIndex {
                dices[i].isEnabled = true
                for p in finallist {
                    print(p.description)
                }
            }
        }
        
    }
    
    fileprivate func allPlayersRolled() -> Bool {
        for i in 0..<Setting.numberOfPlayer {
            if initPlayers[i].position == 0 {
                return false
            }
        }
        print("All players rolled at first round")
        return true
    }
    
    fileprivate func playersContainsNumber() -> Bool {
        for i in 0..<Setting.numberOfPlayer {
            if initPlayers[i].name == "0" && initPlayers[i].name == "1" && initPlayers[i].name == "2" && initPlayers[i].name == "3" {
                return false
            }
        }
        print("All players rolled at first round")
        return true
    }
    
    
    @objc func selectNumberOfplayers(_ sender: UIButton) {
        Setting.numberOfPlayer = sender.tag
        if Setting.numberOfPlayer == 2 {
            print("number of player: \(Setting.numberOfPlayer)")
            setupCardWithTwoPlayers()
            seleted2playersButton?.isEnabled = false
            seleted4playersButton?.isEnabled = true
        }else{
            // Setting.numberOfPlayers == 4
            print("number of player: \(Setting.numberOfPlayer)")
            setupCard()
            seleted2playersButton?.isEnabled = true
            seleted4playersButton?.isEnabled = false
        }
    }
    
    @objc func startGameButtonPressed(_ sender: UIButton) {
        //        let mocklist = [
        //            Player("King", type: 0, position: 0),
        //            Player("Horse", type: 1, position: 0),
        //            Player("Queen", type: 2, position: 0),
        //            Player("Knight", type: 3, position: 0),
        //        ]
        //        Setting.playerList = mocklist
        Setting.playerList = finallist
        //        for subview in loginCard.subviews {
        //            subview.removeFromSuperview()
        //        }
        for var p in Setting.playerList {
            p.moveTo(0)
            print(p.description.debugDescription)
        }
    }
}
