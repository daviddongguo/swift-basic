//
//  GreenViewController.swift
//  SegueDongguo
//
//  Created by map07 on 2023-03-14.
//

import UIKit

class GreenViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var greenVCLabel: UILabel!
    
    var text: String?
    
    
    @IBOutlet weak var greenVCTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let unwrapped = text {
            greenVCLabel.text = unwrapped
        }
    }

}
