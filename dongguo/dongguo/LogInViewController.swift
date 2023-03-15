//
//  LogInViewController.swift
//  dongguo
//
//  Created by map07 on 2023-03-15.
//

import UIKit

class LogInViewController: UIViewController {
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToLogin(_ unwindSegue: UIStoryboardSegue) {
            switch unwindSegue.identifier {
            case "fromSignup":
                let vc = unwindSegue.source as! SignupViewController
                userNameTextField.text = ""
            default:
                userNameTextField.text = ""
            }
        }
    

}
