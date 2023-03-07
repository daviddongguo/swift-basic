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
    
    var players: [Player] = [
        .init("Please", type: 0, position: 0),
        .init("Enter", type: 1, position: 0),
        .init("Your", type: 2, position: 0),
        .init("Name", type: 3, position: 0),
    ]
    var names: [String] = ["King", "Horse", "Queen", "Knight"]
    var finallist: [Player] = []
    
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
        
        //        startGameButton.isEnabled = false
        
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
        button.backgroundColor = .darkGray
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 8
        
        if let attrFont = UIFont(name: "Helvetica", size: 24) {
            let title = button.titleLabel!.text!
            let attrTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: attrFont])
            button.setAttributedTitle(attrTitle, for: UIControl.State.normal)
        }
        button.tag = 2
        button.addTarget(self, action: #selector(selectPlayersButtonPressed), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(selectPlayersButtonPressed), for: .touchUpInside)
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
            string: players[0].name,
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
            string: players[1].name,
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
            string: players[2].name,
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
            string: players[3].name,
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
        let i = sender.tag
        let score = dice.roll()
        players[i].moveTo(score)
        
        // diable dice button and text field
        sender.setBackgroundImage(Setting.diceArray[score - 1], for: UIControl.State.normal)
        sender.isEnabled = false
        textFields[i].backgroundColor = .yellow
        textFields[i].isEnabled = false
        
        
        while finallist.count < Setting.numberOfPlayers {
            if(!allPlayersRolled()){
                break
            }else{
                //                var n: Int = 0
                for score in stride(from: 6, to: 1, by: -1) {
                    for i in 0..<players.count {
                        if(score == players[i].position) {
                            finallist.append(Player( textFields[i].text ?? "\(names[i])", type: i, position: 0))
                            print("list count: \(finallist.count)")
                        }
                    }
                }
                
            }
        }
        
        // ready to start game
        if(dices[0].isEnabled == false
           && dices[1].isEnabled == false
           && dices[2].isEnabled == false
           && dices[3].isEnabled == false){
            startGameButton.isEnabled = true
        }
        
        if(Setting.numberOfPlayers == 2
           && dices[0].isEnabled == false
           && dices[0].isEnabled == false){
            startGameButton.isEnabled = true
        }
        
    }
    fileprivate func allPlayersRolled() -> Bool {
        for player in players {
            if(player.position == 0){
                return false
            }
        }
        return true
    }
    
    @objc func selectPlayersButtonPressed(_ sender: UIButton) {
        Setting.numberOfPlayers = sender.tag
        if(Setting.numberOfPlayers == 2){
            setupCardWithTwoPlayers()
            seleted2playersButton?.backgroundColor = .white
            seleted4playersButton?.backgroundColor = .darkGray
        }else{
            setupCard()
            seleted4playersButton?.backgroundColor = .white
            seleted2playersButton?.backgroundColor = .darkGray
        }
    }
    
    @objc func startGameButtonPressed(_ sender: UIButton) {
        Setting.playerList = finallist
        for subview in loginCard.subviews {
            subview.removeFromSuperview()
        }
        for p in Setting.playerList {
            print(p.description.debugDescription)
        }
    }
}
