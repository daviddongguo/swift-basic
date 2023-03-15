//
//  SignUpViewController.swift
//  dongguo
//
//  Created by map07 on 2023-03-15.
//

import UIKit

class SignupViewController: UIViewController {
    
    var user: User!
    var server: UserCollection!
    
    
    @IBOutlet var userTextFields: [UITextField]!
    
    
    
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {
        let firstName = userTextFields[0].text ?? ""
        let lastName = userTextFields[1].text ?? ""
        let userName = userTextFields[2].text ?? ""
        let password = userTextFields[3].text ?? ""
        let repeatedPassword = userTextFields[4].text ?? ""
        let question = userTextFields[5].text ?? ""
        let answer = userTextFields[6].text ?? ""
        
        if password != repeatedPassword {
            return false
        }
        
        user = User(firstName: firstName, lastName: lastName, userName: userName, password: password, question: question, answer: answer)
        
        do{
            try server.add(user)
        }catch UserError.duplicateUserName(let invalid) {
            print("Error: \(invalid)")
            return false
        }catch {
            print("Error: Unknown Error")
            return false
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? LogInViewController {
                destination.server = server
//                server.printUsers()
            }
    }
    
}
