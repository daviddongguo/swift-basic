//
//  ViewController.swift
//  LadderAndSnake
//
//  Created by david on 2023-03-05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var holder: UIView!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var diceView: UIView!
    
    let diceArray = [UIImage(named: "number01"), UIImage(named: "number02")]
    var cellSize: Double = 0
    var position: Int = 1
    var playerButtons: [UIButton] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cellSize = holder.frame.size.width / 10
        for player in players {
            playerButtons.append(createPlayerButton(n: player.position, type: player.type, cellSize: cellSize))
        }
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupBoardPad()
        
    }
    
    private func setupBoardPad() {
        for player in playerButtons {
        holder.addSubview(player)
            
        }
        goButton.addTarget(self, action: #selector(goButtonPressed),  for: .touchUpInside)
    }
    
    @objc func goButtonPressed(_ sender: UIButton) {
        var step = 6
        for i in 0..<Setting.numberOfPlayers{
            players[i].moveTo(players[i].position + step)
            moveTo(playerButtons[i], n: players[i].position,  cellSize: cellSize)
        }
    }
    
    @objc func moveTo(_ button: UIButton, n: Int, cellSize: Double)  {
        print(n)
        let x = ((n - 1) / 10 % 2 == 0) ? (n - 1) % 10 : 9 - (n - 1) % 10
        let y = 9 - (n - 1) / 10
        button.frame = CGRectMake(cellSize * Double(x), cellSize * Double(y), cellSize, cellSize )
    }
    
    
    private func createPlayerButton(n: Int, type: Int, cellSize: Double) -> UIButton {
        
        let image = Setting.palyerImages[type]
        let x = ((n - 1) / 10 % 2 == 0) ? (n - 1) % 10 : 9 - (n - 1) % 10
        let y = 9 - (n - 1) / 10
        let player = UIButton(
            frame: CGRect(
                x: cellSize * Double(x),
                y: cellSize * Double(y),
                width: cellSize,
                height: cellSize))
        player.setTitleColor(.black, for: .normal)
        player.setBackgroundImage(image, for: UIControl.State.normal)
        player.layer.borderWidth = 2
        player.layer.borderColor = UIColor.black.cgColor
        
        return  player
    }
    
}

