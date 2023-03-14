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

        // Do any additional setup after loading the view.
        if let unwrapped = text {
            greenVCLabel.text = unwrapped
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? MainViewController {
//            destination.text = greenVCLabel.text
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
