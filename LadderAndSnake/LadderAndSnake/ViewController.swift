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
    
    var dice = RandomDice()
    var map = Board().map
    var currentIndex = 0
    var players: [Player] = []
    // goto line 49
        
    
    var diceWidthSize: Double = 0
    var diceButton: UIButton!
    var cellSize: Double = 0
    var playerButtons: [UIButton] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        for player in Setting.playerList {
            playerButtons.append(createPlayerButton(n: player.position, type: player.type, name: player.name))
            players.append(player)
        }
        
        diceWidthSize = diceContainer.frame.size.width
        cellSize = holder.frame.size.width / 10
        diceButton = createDivce()
        
    }
    
    private func createDivce() -> UIButton {
        let ui = UIButton( frame: CGRect( x: 0, y: 0, width: diceWidthSize, height: diceWidthSize))
        ui.setBackgroundImage(Setting.diceArray[5], for: UIControl.State.normal)
        ui.addTarget(self, action: #selector(dicePressed),  for: .touchUpInside)
        return  ui
    }
    
    @objc func dicePressed(_ sender: UIButton) {
        let move: Int =  dice.roll()
        let start: Int = players[currentIndex].position
        
        // change dice background image on step
        sender.setBackgroundImage(Setting.diceArray[move - 1], for: UIControl.State.normal)
        
        // move current player position
        var debuggingMsg = "\(players[currentIndex].name) get \(move) steps from  \(players[currentIndex].position)"
        var position: Int = players[currentIndex].position + move
        debuggingMsg += " move to \(position)"
        
        // continue move on the map of board
        while true {
            if let unwrapped = map[position] {
                position = unwrapped
                debuggingMsg += " move to \(position)"
            }else {
                break
            }
        }
        print(debuggingMsg)
        
        // move the icon of the current player on board
        players[currentIndex].moveTo(position)
        moveOnBoard(playerButtons[currentIndex], to: players[currentIndex].position)
        playerButtons[currentIndex].backgroundColor = UIColor.clear
        
        // prepare for the next player
        if players[currentIndex].isWin {
            sender.isEnabled = false
            print("\(players[currentIndex].name) position:  \(players[currentIndex].position)")
        }else {
            currentIndex += 1
            currentIndex = currentIndex % Setting.numberOfPlayer
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
        for i in 0..<Setting.numberOfPlayer {
            moveOnBoard(playerButtons[i], to: players[i].position )
//            holder.addSubview(playerButton)
        }
        diceContainer.addSubview(diceButton)
    }
    
    
    
    @objc func moveOnBoard(_ button: UIButton, to end: Int)  {
        
        
        let endX = ((end - 1) / 10 % 2 == 0) ? (end - 1) % 10 : 9 - (end - 1) % 10
        let endY = 9 - (end - 1) / 10
//        button.frame = CGRectMake(cellSize * Double(x), cellSize * Double(y), cellSize, cellSize )
        
        // define animator here
        var animator = UIViewPropertyAnimator(duration: 0.2, curve: .linear) {
            [unowned self, button] in
//            button.center.x = self.view.frame.width
        button.frame = CGRectMake(cellSize * Double(endX), cellSize * Double(endY), cellSize, cellSize )
//            button.frame = button.frame.offsetBy(dx: 0, dy: 300)
//            button.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
        }
        animator.startAnimation()
    }
    
    
    private func createPlayerButton(n: Int, type: Int, name: String) -> UIButton {
        let image = Setting.palyerImages[type]
        let x = ((n - 1) / 10 % 2 == 0) ? (n - 1) % 10 : 9 - (n - 1) % 10
        let y = 9 - (n - 1) / 10
        let button = UIButton(
            frame: CGRect(
                x: cellSize * Double(x),
                y: cellSize * Double(y),
                width: cellSize,
                height: cellSize))
        button.setTitle(name, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setBackgroundImage(image, for: UIControl.State.normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        
        return  button
    }
    
}

