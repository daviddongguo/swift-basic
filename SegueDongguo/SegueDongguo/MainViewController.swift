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
        segueSwitch.addTarget(self, action: #selector(segueSwitchValueChanged), for: .valueChanged)
    }
    
    @objc func segueSwitchValueChanged(_ sender: UISwitch) {
        let bool = sender.isOn
        if bool {
            gotoNextButton.titleLabel?.textColor = .systemYellow
        }else{
            gotoNextButton.titleLabel?.textColor = .green
        }
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
    
    @IBAction func unwindToFirstVC(_ unwindSegue: UIStoryboardSegue) {
        
        switch unwindSegue.identifier {
        case "fromGreen":
            let vc = unwindSegue.source as! GreenViewController
//            mainTextField.text = vc.greenTextField.text!
            
            //.......................................
//            print("personArray:        \(personArray)")
            //.......................................
            
        case "fromYellow":
            let vc = unwindSegue.source as! YellowViewController
//            mainTextField.text = vc.yellowTextField.text!
        default:
            mainTextField.text = "N/A"
        }
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

