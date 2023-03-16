//
//  SignUpViewController.swift
//  dongguo
//
//  Created by map07 on 2023-03-15.
//

import UIKit

class SignupViewController: UIViewController {
    
    var server: UserCollection!
    var newUser: User!
    
    @IBOutlet weak var messageLable: UILabel!
    @IBOutlet var userTextFields: [UITextField]!
    @IBOutlet weak var submitButton: UIButton!
    
    @IBAction func userNameFilled(_ sender: Any) {
        if !isExistedUserName() {
            messageLable.text = "userName existed."
            messageLable.isHidden = false
        }else {
            messageLable.isHidden = true
        }
    }
    
    func isExistedUserName() -> Bool {
        guard let userName = userTextFields[2].text else {
            return false
        }
        return  server.isExistedUserName(userName)
    }
    
    @IBAction func passwordsFilled(_ sender: Any) {
        if !twoPasswordsValidated() {
            messageLable.text = "two passwords are not the same."
            messageLable.isHidden = false
        }else {
            messageLable.isHidden = true
        }
    }
    
    fileprivate func twoPasswordsValidated() -> Bool{
        guard let password = userTextFields[3].text else {
            return false
        }
        guard let repeatedPassword = userTextFields[4].text else {
            return false
        }
        
        return  password == repeatedPassword
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLable.isHidden = true
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {
        if !isExistedUserName() {
            messageLable.text = "userName existed."
            messageLable.isHidden = false
            return false
        }
        
        if !twoPasswordsValidated() {
            messageLable.text = "two passwords are not the same."
            messageLable.isHidden = false
            return false
        }
        
        let firstName = userTextFields[0].text ?? ""
        let lastName = userTextFields[1].text ?? ""
        let userName = userTextFields[2].text ?? ""
        let password = userTextFields[3].text ?? ""
        let question = userTextFields[5].text ?? ""
        let answer = userTextFields[6].text ?? ""
        
        newUser = User(firstName: firstName, lastName: lastName, userName: userName, password: password, question: question, answer: answer)
        do{
            try server.add(newUser)
        }catch UserError.duplicateUserName(let invalid) {
            messageLable.text = invalid
            messageLable.isHidden = false
            return false
        }catch (let invalid){
            print("Server Error: \(invalid)")
            messageLable.isHidden = false
            return false
        }
        
        messageLable.isHidden = true
        return true
    }
    
}
