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
    var map = Board().map
    
    var cellSize: Double = 0
    var playerButtons: [UIButton] = []
    var currentIndex = 0
    var players: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        diceWidthSize = diceContainer.frame.size.width
        cellSize = holder.frame.size.width / 10
        
        diceButton = createDivce()
        for player in Setting.playerList {
            playerButtons.append(createPlayerButton(n: player.position, type: player.type))
            players.append(player)
        }
    }
    
    private func createDivce() -> UIButton {
        let ui = UIButton( frame: CGRect( x: 0, y: 0, width: diceWidthSize, height: diceWidthSize))
        ui.setBackgroundImage(Setting.diceArray[5], for: UIControl.State.normal)
        ui.addTarget(self, action: #selector(dicePressed),  for: .touchUpInside)
        return  ui
    }
    
    @objc func dicePressed(_ sender: UIButton) {
        let step =  dice.roll()
        
        print("\(players[currentIndex].name): \(players[currentIndex].position)")
        print("step: \(step)")
        
        sender.setBackgroundImage(Setting.diceArray[step - 1], for: UIControl.State.normal)
        
        var position: Int = players[currentIndex].position + step
        print("position : \(position)")
        while true {
            if let unwrapped = map[position] {
                position = unwrapped
                print("move... : \(position)")
            }else {
                break
            }
        }
        
        
        players[currentIndex].moveTo(position)
        
        moveOnBoard(playerButtons[currentIndex], position: players[currentIndex].position)
        
        playerButtons[currentIndex].backgroundColor = UIColor.clear
        
        if players[currentIndex].isWin {
            sender.isEnabled = false
        }else {
            currentIndex += 1
            currentIndex = currentIndex % Setting.numberOfPlayers
            playerButtons[currentIndex].backgroundColor = .black
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

