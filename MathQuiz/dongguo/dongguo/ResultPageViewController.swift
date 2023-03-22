//
//  ResultViewController.swift
//  dongguo
//
//  Created by david on 2023-03-19.
//

import UIKit

class ResultPageViewController: UIViewController {
    
    var server: MathQuizServer?
    
    
    
    
    @IBOutlet weak var registerTextField: UITextField!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let scoreString = server?.scoreString {
            scoreLabel.text = scoreString
        }
    }

}
