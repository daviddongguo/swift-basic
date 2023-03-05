//
//  ViewController.swift
//  LadderGame
//
//  Created by map07 on 2023-03-04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var holder: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupBoardPad()
    }
    
    private func setupBoardPad() {
        moveTo(n: 18)
    }
    
    private func moveTo(n: Int) {
        let cellSize: CGFloat = holder.frame.size.width / 10
        
        let x: Int = (n / 10 % 2 == 0) ? (n - 1) % 10 - 1  : (10 - n % 10)
        let y: Int = (n - 1) / 10 + 1
        let player = UIButton(
            frame: CGRect(
                x: cellSize * Double(x),
                y: holder.frame.size.height - cellSize * Double(y),
                width: cellSize,
                height: cellSize))
        player.setTitle("king", for: .normal)
        player.setTitleColor(.black, for: .normal)
        player.backgroundColor = .red
        player.layer.borderWidth = 2
        player.layer.borderColor = UIColor.black.cgColor
        
        holder.addSubview(player)
    }
    
}

