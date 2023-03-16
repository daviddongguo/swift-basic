//
//  LogInViewController.swift
//  dongguo
//
//  Created by map07 on 2023-03-15.
//

import UIKit

class LogInViewController: UIViewController {
    
    var server: UserCollection = UserCollection()
    var currentUser: User? = nil
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do{
            try server.add(User(firstName: "a", lastName: "a", userName: "a", password: "a", question: "which letter", answer: "a"))
            try server.add(User(firstName: "b", lastName: "b", userName: "b", password: "b", question: "which letter", answer: "b"))
            try server.add(User(firstName: "c", lastName: "c", userName: "c", password: "c", question: "which letter", answer: "c"))
        }catch {
            print("error")
        }
        
        server.printUsers()
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {
        if identifier == "toListOfUsers" {
            guard let userName = userNameTextField.text else {
                return false
            }
            guard let password = passwordTextField.text else {
                return false
            }
            currentUser = server.findByUserName(userName)
            
            return server.isValidatedPassword(currentUser, password: password)
        } else {
            return true
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SignupViewController {
            destination.server = self.server
        }
        if let destination = segue.destination as? ForgetPasswordViewController {
            destination.server = self.server
        }
        
        if let destination = segue.destination as? ListOfUsersViewController {
            destination.server = server
            destination.currentUser = currentUser
            
            var string = ""
            for user in server.list {
                string += user.description + "\n"
            }
            destination.text = string
        }
    }
    
    
    
    
    
    @IBAction func unwindToLogin(_ unwindSegue: UIStoryboardSegue) {
        switch unwindSegue.identifier {
        case "fromSignup":
            let vc = unwindSegue.source as! SignupViewController
            self.server = vc.server
            self.server.printUsers()
            //                server.add(<#T##user: User##User#>)
        default:
            userNameTextField.text = ""
        }
    }
    
    
}
