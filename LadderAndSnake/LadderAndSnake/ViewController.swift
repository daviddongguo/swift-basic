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
        
        // change dice background image on move
        sender.setBackgroundImage(Setting.diceArray[move - 1], for: UIControl.State.normal)
        
        // move current player position
        let debuggingMsg = "\(players[currentIndex].name) get \(move) steps from  \(players[currentIndex].position)"
        print(debuggingMsg)
        var end: Int = players[currentIndex].position + move
        
        for step in start...end {
            moveOnBoard(playerButtons[currentIndex], to: step)
        }
        
        // continue move on the map of board
        while true {
            if let unwrapped = map[end] {
                end = unwrapped
                moveOnBoard(playerButtons[currentIndex], to: end)
            }else {
                break
            }
        }
        
        // move the icon of the current player on board
        players[currentIndex].moveTo(end)
        //        moveOnBoard(playerButtons[currentIndex], to: players[currentIndex].position)
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
            moveOnBoard(playerButtons[i], to: players[i].position)
            //            holder.addSubview(playerButton)
        }
        diceContainer.addSubview(diceButton)
    }
    
    //    func moveByStep(_ button: UIButton,from start: Int, to end: Int, completion: @escaping () -> Void) {
    //
    //        guard start < end else { return completion()}
    //
    //        let endX = ((end - 1) / 10 % 2 == 0) ? (end - 1) % 10 : 9 - (end - 1) % 10
    //        let endY = 9 - (end - 1) / 10
    //        UIViewPropertyAnimator
    //            .runningPropertyAnimator(
    //                withDuration: 0.1,
    //                delay: 0.2,
    //                options: [],
    //                animations: {
    //                    [self] in {
    //                        print("move to \(end)")
    //                        button.frame = CGRectMake(self.cellSize * Double(endX), self.cellSize * Double(endY), self.cellSize, self.cellSize )
    //                    }
    //                },
    //                completion: completion
    //            )
    //    }
    //
    //    @objc func move(_ button: UIButton,from start: Int, to end: Int) {
    //        guard start < end  else { return }
    //        moveByStep(button, from: start, to: end) {
    //            self.moveByStep {
    //                move(button, from: start + 1, to: end)
    //            }
    //        }
    //    }
    
    
    @objc func moveOnBoard(_ button: UIButton, to end: Int ) {
        
        
        let endX = ((end - 1) / 10 % 2 == 0) ? (end - 1) % 10 : 9 - (end - 1) % 10
        let endY = 9 - (end - 1) / 10
        
        let viewColorAnimator: UIViewPropertyAnimator = UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: 0.4,
            delay: 0.0,
            options: [],
            animations: {[self] in
                button.frame = CGRectMake(self.cellSize * Double(endX), self.cellSize * Double(endY), self.cellSize, self.cellSize ) }
        )
        
        viewColorAnimator.startAnimation()
        
        
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

