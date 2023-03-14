//
//  YellowViewController.swift
//  SegueDongguo
//
//  Created by map07 on 2023-03-14.
//

import UIKit

class YellowViewController: UIViewController {

    @IBOutlet weak var goBackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goBackButton.addTarget(self, action: #selector(goBackButtonPressed), for: .touchUpInside)
    }

    
    @objc func goBackButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "fromOrange", sender: self)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
