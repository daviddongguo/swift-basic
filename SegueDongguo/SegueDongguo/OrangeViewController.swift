//
//  OrangeViewController.swift
//  SegueDongguo
//
//  Created by map07 on 2023-03-14.
//

import UIKit

class OrangeViewController: UIViewController {

    @IBOutlet weak var goBackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goBackButton.addTarget(self, action: #selector(goBackButtonPressed), for: .touchUpInside)
    }

    
    @objc func goBackButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "fromOrange", sender: self)

    }
    
//    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
//        performSegue(withIdentifier: "fromOrange", sender: self)
//    }
//    
  


}
