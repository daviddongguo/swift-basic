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
        }
    }
    
    @IBOutlet weak var segueSwitch: UISwitch!
    
    @IBOutlet weak var gotoNextButton: UIButton!
    
    @IBOutlet weak var gotoOrangeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gotoNextButton.addTarget(self, action: #selector(gotoNextButtonPressed), for: .touchUpInside)
        segueSwitch.addTarget(self, action: #selector(segueSwitchValueChanged), for: .valueChanged)
    }
    
    
    @objc func gotoNextButtonPressed(_ sender: UIButton) {
        if segueSwitch.isOn{
            performSegue(withIdentifier: "toYellow", sender: self)
        }else{
            performSegue(withIdentifier: "toGreen", sender: self)
        }
    }
    

    
    @objc func segueSwitchValueChanged(_ sender: UISwitch) {
        let bool = sender.isOn
        if bool {
            gotoNextButton.titleLabel?.textColor = .systemYellow
        }else{
            gotoNextButton.titleLabel?.textColor = .green
        }
    }
    
    @IBAction func unwindToFirstVC(_ unwindSegue: UIStoryboardSegue) {
        
        switch unwindSegue.identifier {
        case "fromGreen":
            let vc = unwindSegue.source as! GreenViewController
            mainTextField.text = vc.greenVCTextField.text!
        case "fromYellow":
            let vc = unwindSegue.source as! YellowViewController
            mainTextField.text = vc.yellowVCTextField.text!
        default:
            mainTextField.text = ""
        }
    }
    
    // This method will be called before a storyboard segue from a button
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {
        print("shouldPerformSegue")
        if identifier  == "toOrange" && mainTextField.text == "orange" {
            print("can jump to orange")
            return true
        } else{
            print("can not jump to orange")
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GreenViewController {
            destination.text = mainTextField.text
        }
        
        if let destination = segue.destination as? YellowViewController {
            destination.text = mainTextField.text
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

