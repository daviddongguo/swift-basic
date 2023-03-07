//
//  ViewController.swift
//  LadderAndSnake
//
//  Created by david on 2023-03-05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var holder: UIView!
    
    @IBOutlet weak var diceContainer: UIView!
    
    var diceWidthSize: Double = 0
    var diceButton: UIButton!
    var dice = RandomDice()
    
    var cellSize: Double = 0
    var playerButtons: [UIButton] = []
    var currentIndexOfPlayer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        diceWidthSize = diceContainer.frame.size.width
        cellSize = holder.frame.size.width / 10
        
        diceButton = createDivce()
        for player in Setting.playerList {
            playerButtons.append(createPlayerButton(n: player.position, type: player.type))
        }
    }
    
    private func createDivce() -> UIButton {
        let ui = UIButton( frame: CGRect( x: 0, y: 0, width: diceWidthSize, height: diceWidthSize))
        ui.setBackgroundImage(Setting.diceArray[5], for: UIControl.State.normal)
        ui.addTarget(self, action: #selector(dicePressed),  for: .touchUpInside)
        return  ui
    }
    
    @objc func dicePressed(_ sender: UIButton) {
        print("dice pressed")
        
        let position = 3
        sender.setBackgroundImage(Setting.diceArray[position - 1], for: UIControl.State.normal)
        
        
        
        moveOnBoard(playerButtons[currentIndexOfPlayer], position: position)
        if Setting.playerList[currentIndexOfPlayer].isWin {
            print(Setting.playerList[currentIndexOfPlayer].isWin)
            sender.isEnabled = false
        }else {
            currentIndexOfPlayer += 1
            currentIndexOfPlayer = currentIndexOfPlayer % Setting.numberOfPlayers
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupBoardPad()
        
    }
    
    private func setupBoardPad() {
        for button in playerButtons {
            holder.addSubview(button)
        }
        diceContainer.addSubview(diceButton)
    }
    
    
    
    @objc func moveOnBoard(_ button: UIButton, position: Int)  {
        print(position)
        let x = ((position - 1) / 10 % 2 == 0) ? (position - 1) % 10 : 9 - (position - 1) % 10
        let y = 9 - (position - 1) / 10
        button.frame = CGRectMake(cellSize * Double(x), cellSize * Double(y), cellSize, cellSize )
    }
    
    
    private func createPlayerButton(n: Int, type: Int) -> UIButton {
        let image = Setting.palyerImages[type]
        let x = ((n - 1) / 10 % 2 == 0) ? (n - 1) % 10 : 9 - (n - 1) % 10
        let y = 9 - (n - 1) / 10
        let button = UIButton(
            frame: CGRect(
                x: cellSize * Double(x),
                y: cellSize * Double(y),
                width: cellSize,
                height: cellSize))
        button.setTitleColor(.black, for: .normal)
        button.setBackgroundImage(image, for: UIControl.State.normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        
        return  button
    }
    
}

