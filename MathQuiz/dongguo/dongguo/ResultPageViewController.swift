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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
