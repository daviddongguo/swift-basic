//
//  ListOfUsersViewController.swift
//  dongguo
//
//  Created by map07 on 2023-03-15.
//

import UIKit

class ListOfUsersViewController: UIViewController {
    
    var server: UserCollection?
    var currentUser: User?
    var text: String?
    
    @IBOutlet weak var listOfUsersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfUsersLabel.text = text ?? ""
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {
        if server == nil || currentUser == nil {
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? UpdatePasswordViewController {
            destination.server = server
            destination.currentUser = currentUser
        }
    }
}
