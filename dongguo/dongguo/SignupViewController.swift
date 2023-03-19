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
        if isExistedUserName() {
            messageLable.text = "userName existed."
            messageLable.isHidden = false
            submitButton.isEnabled = false
        }else {
            messageLable.isHidden = true
            submitButton.isEnabled = true
        }
    }
    
    func isExistedUserName() -> Bool {
        guard let userName = userTextFields[2].text, !userName.isEmpty else {
                return false
            }
        return server.isExistedUserName(userName)
    }
    
    @IBAction func firstPasswordFilled(_ sender: Any) {
        let isUserTextFieldEmpty = userTextFields[4].text?.isEmpty ?? true
        if isUserTextFieldEmpty {
            return
        }
        updatePasswordErrorMessage()
    }
    
    
    
    @IBAction func secondPasswordFilled(_ sender: Any){
        let isUserTextFieldEmpty = userTextFields[3].text?.isEmpty ?? true
        if isUserTextFieldEmpty {
            return
        }
        updatePasswordErrorMessage()
    }
    
    func updatePasswordErrorMessage() {
        if !twoPasswordsSame() {
            messageLable.text = "two passwords are not the same."
            messageLable.isHidden = false
            submitButton.isEnabled = false
        }else {
            messageLable.isHidden = true
            submitButton.isEnabled = true
        }
    }
    
    fileprivate func twoPasswordsSame() -> Bool{
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
        if isExistedUserName() {
            messageLable.text = "userName existed."
            messageLable.isHidden = false
            return false
        }
        
        if !twoPasswordsSame() {
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
