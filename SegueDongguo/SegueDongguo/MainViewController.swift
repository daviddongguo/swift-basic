//
//  ViewController.swift
//  SegueDongguo
//
//  Created by map07 on 2023-03-14.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var mainTextField: UITextField! {
        didSet{
            mainTextField.delegate = self
            print("set text field: \(mainTextField.text ?? "no content")")
        }
    }
    
    @IBOutlet weak var segueSwitch: UISwitch!
    
    @IBOutlet weak var gotoNextButton: UIButton!
    
    @IBOutlet weak var gotoOrangeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gotoNextButton.addTarget(self, action: #selector(gotoNextButtonPressed), for: .touchUpInside)
        gotoOrangeButton.addTarget(self, action: #selector(gotoOrangeButtonPressed), for: .touchUpInside)
    }
    
    @objc func gotoNextButtonPressed(_ sender: UIButton) {
        if segueSwitch.isOn{
            performSegue(withIdentifier: "toYellow", sender: nil)
        }else{
            performSegue(withIdentifier: "toGreen", sender: nil)
        }
    }
    
    @objc func gotoOrangeButtonPressed(_ sender: UIButton) {
     
            performSegue(withIdentifier: "toOrange", sender: nil)

    }


} // end of class

extension MainViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dissmiss the keyboard by pressing enter
        // 1- Conform to UITextFieldDelegate
        // 2- In target text field didSet set the myTextField.delegate = self
        textField.resignFirstResponder()
        return true
    }
}

