//
//  ForgetPasswordViewController.swift
//  dongguo
//
//  Created by map07 on 2023-03-15.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    
    var server: UserCollection?
    var currentUser: User?
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repeatedPassword: UITextField!
    
    @IBAction func userNameEdited(_ sender: Any) {
        let userName = userNameTextField.text ?? ""
        
        currentUser = server?.findByUserName(userName)
        guard let user = currentUser else {
            return
        }
        questionLabel.text = user.question
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {
        guard let currentUser = currentUser else {
            return false
        }
        guard let server = server else {
            return false
        }
               
        if password.text != repeatedPassword.text {
            return false
        }
        guard let password = password.text else {
            return false
        }
        guard let answer = answerTextField.text else {
            return false
        }
        return server.updatePassword(userName: currentUser.userName, answer: answer, newPassword: password)
    }
    
}
