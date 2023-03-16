//
//  UpdatePasswordViewController.swift
//  dongguo
//
//  Created by map07 on 2023-03-15.
//

import UIKit

class UpdatePasswordViewController: UIViewController {
    
    var server: UserCollection?
    var currentUser: User?
    
    @IBOutlet weak var oldPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var repeatedPassword: UITextField!
    
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
        
        if newPassword.text != repeatedPassword.text {
            return false
        }      
                
        return server.updatePassword(id: currentUser.Id, oldPassword: oldPassword.text ?? "" , newPassword: newPassword.text ?? "")
    }
    
}
