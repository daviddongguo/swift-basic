//
//  ViewController.swift
//  LadderGame
//
//  Created by map07 on 2023-03-04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var holder: UIView!
    
    
    @IBOutlet weak var goButton: UIButton!
    
    @IBOutlet weak var diceView: UIView!
    
    let diceArray = [UIImage(named: "number01"), UIImage(named: "number02")]
    var player: UIButton?
    var cellSize: Double = 0
    var position: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cellSize = holder.frame.size.width / 10
        player = createPlayer(n: 18, cellSize: cellSize)
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupBoardPad()
        
    }
    
    private func setupBoardPad() {
        
        
        holder.addSubview(player!)
        
        goButton.addTarget(self, action: #selector(goButtonPressed),  for: .touchUpInside)
        
        
        
    }
    
    @objc func goButtonPressed(_ sender: UIButton) {
        let start = position + 1
        position += 6
        for n in start...position{
            Task {
                await moveTo(player!, n: n, cellSize: cellSize)
            }
        }
    }
    
    @objc func moveTo(_ button: UIButton, n: Int, cellSize: Double) async -> Void {
        print(n)
        let x = ((n - 1) / 10 % 2 == 0) ? (n - 1) % 10 : 9 - (n - 1) % 10
        let y = 9 - (n - 1) / 10
        button.frame = CGRectMake(cellSize * Double(x), cellSize * Double(y), cellSize, cellSize )
    }
    
    
    private func createPlayer(n: Int, cellSize: Double) -> UIButton {
        
        let image = UIImage(named: "newHorse.png")
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
