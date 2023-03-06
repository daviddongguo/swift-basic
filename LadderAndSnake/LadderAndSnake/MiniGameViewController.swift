//
//  MiniGameViewController.swift
//  LadderAndSnake
//
//  Created by david on 2023-03-05.
//

import UIKit

class MiniGameViewController: UIViewController {
    
    @IBOutlet var loginCard: UIView!
    
    var collumnSize: Double = 0
    var rowSize: Double = 0
    var numberOfPlayers: Int = 2
    private let palyerImages: [UIImage?] = [
        UIImage(named: "king.png"),
        UIImage(named: "horse"),
        UIImage(named: "queen"),
        UIImage(named: "knight")]
    let diceArray = [
        UIImage(named: "number01"),
        UIImage(named: "number02"),
        UIImage(named: "number03"),
        UIImage(named: "number04"),
        UIImage(named: "number05"),
        UIImage(named: "number06"),
    ]
    var seleted2playersButton: UIButton?
    var seleted4playersButton: UIButton?
    var textField1: UITextField?
    var textField2: UITextField?
    var textField3: UITextField?
    var textField4: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        collumnSize = loginCard.frame.size.width / 8
        rowSize = loginCard.frame.size.height / 8
        seleted2playersButton = createSelectButton1()
        seleted4playersButton = createSelectButton2()
        textField1 = createTextField1()
        textField2 = createTextField2()
        textField3 = createTextField3()
        textField4 = createTextField4()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupCard()
        
    }
    
    private func setupCard() {
        
        
        loginCard.addSubview(seleted2playersButton!)
        loginCard.addSubview(seleted4playersButton!)
        loginCard.addSubview(createPlayer1())
        loginCard.addSubview(createTextField1())
        loginCard.addSubview(createPlayer2())
        loginCard.addSubview(createTextField2())
        loginCard.addSubview(createPlayer3())
        loginCard.addSubview(createTextField3())
        loginCard.addSubview(createPlayer4())
        loginCard.addSubview(createTextField4())
        
        loginCard.addSubview(createDivce(0))
        loginCard.addSubview(createDivce(1))
        loginCard.addSubview(createDivce(2))
        loginCard.addSubview(createDivce(3))
        
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
        button.backgroundColor = .red
//        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 8
        if let attrFont = UIFont(name: "Helvetica", size: 24) {
                    let title = button.titleLabel!.text!
                    let attrTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: attrFont])
            button.setAttributedTitle(attrTitle, for: UIControl.State.normal)
                }
        button.tag = 2
        button.addTarget(self, action: #selector(selectPlayersPressed), for: .touchUpInside)
        
        return  button
    }
    @objc func selectPlayersPressed(_ sender: UIButton) {
        numberOfPlayers = sender.tag
        if(numberOfPlayers == 2){
            seleted2playersButton?.backgroundColor = .red
            seleted4playersButton?.backgroundColor = .darkGray
            self.textField3?.isEnabled = false
            self.textField4?.isEnabled = false
        }else{
            seleted4playersButton?.backgroundColor = .red
            seleted2playersButton?.backgroundColor = .darkGray
        }
        
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
        button.backgroundColor = .darkGray
//        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 8
        
        if let attrFont = UIFont(name: "Helvetica", size: 24) {
                    let title = button.titleLabel!.text!
                    let attrTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: attrFont])
            button.setAttributedTitle(attrTitle, for: UIControl.State.normal)
                }
        button.tag = 4
        button.addTarget(self, action: #selector(selectPlayersPressed), for: .touchUpInside)
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
        let textField = UITextField(
            frame: CGRect(
                x: collumnSize * Double(0.5),
                y: rowSize * Double(4.5),
                width: collumnSize,
                height: rowSize * Double(0.6)))
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(
            string: players[0].name,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        return  textField
    }
    

    private func createDivce(_ i: Int) -> UIButton {
        
        let player = UIButton(
            frame: CGRect(
                x: collumnSize * Double(0.7 + 2.0 * Double(i)),
                y: rowSize * Double(6),
                width: collumnSize * Double(0.6),
                height: collumnSize * Double(0.6)))
        player.setTitleColor(.black, for: .normal)
        player.setBackgroundImage(diceArray[i], for: UIControl.State.normal)
        
        return  player
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
        let textField = UITextField(
            frame: CGRect(
                x: collumnSize * Double(2.5),
                y: rowSize * Double(4.5),
                width: collumnSize,
                height: rowSize * Double(0.6)))
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(
            string: players[1].name,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        return  textField
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
        let textField = UITextField(
            frame: CGRect(
                x: collumnSize * Double(4.5),
                y: rowSize * Double(4.5),
                width: collumnSize,
                height: rowSize * Double(0.6)))
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(
            string: players[2].name,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        return  textField
    }
    
   
    
    
    
    
    private func createPlayer4() -> UIButton {
        
        let image = UIImage(named: "queen.png")
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
        let textField = UITextField(
            frame: CGRect(
                x: collumnSize * Double(6.5),
                y: rowSize * Double(4.5),
                width: collumnSize,
                height: rowSize * Double(0.6)))
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(
            string: players[3].name,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        return  textField
    }
    
}
