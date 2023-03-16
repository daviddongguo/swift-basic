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
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        do{
            try server.add(User(firstName: "a", lastName: "a", userName: "a", password: "a", question: "answer is a", answer: "a"))
            try server.add(User(firstName: "b", lastName: "b", userName: "b", password: "b", question: "answer is b", answer: "b"))
            try server.add(User(firstName: "c", lastName: "c", userName: "c", password: "c", question: "answer is c", answer: "c"))
        }catch {
            print("Initialize user list error")
        }
        server.printUsers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cleanTextFields()
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
            if !server.isValidatedPassword(currentUser, password: password) {
                let errorMessage = "Your email/password combination is incorrect."
                errorMessageLabel.text = errorMessage
                errorMessageLabel.textColor = .red
                errorMessageLabel.isHidden = false
                return false
            }
        }
        
        errorMessageLabel.isHidden = true
        return true
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
            
            var text = ""
            for user in server.list {
                text += user.description + "\n"
            }
            destination.text = text
        }
    }
    
    fileprivate func cleanTextFields() {
        errorMessageLabel.isHidden = true
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func unwindToLogin(_ unwindSegue: UIStoryboardSegue) {
        cleanTextFields()
    }
    
    
}
