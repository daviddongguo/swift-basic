//
//  YellowViewController.swift
//  SegueDongguo
//
//  Created by map07 on 2023-03-14.
//

import UIKit

class YellowViewController: UIViewController {
    
    
    @IBOutlet weak var yellowVCLabel: UILabel!
    @IBOutlet weak var yellowVCTextField: UITextField!
    @IBOutlet weak var goBackButton: UIButton!
    
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goBackButton.addTarget(self, action: #selector(goBackButtonPressed), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let unwrapped = text {
            yellowVCLabel.text = unwrapped
        }
    }
    
    @objc func goBackButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "fromYellow", sender: self)
    }
}
