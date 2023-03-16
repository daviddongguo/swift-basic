//
//  SingleSelectQuizViewController.swift
//  WhatAnimalAreYou
//
//  Created by map07 on 2023-03-16.
//

import UIKit

class SingleSelectQuizViewController: UIViewController {
    
    
    let quizs: [Quiz] = [quiz1, quiz2, quiz3, quiz4]
    var quiz4Index = 3
    var quiz4Answer: Answer!
    
    
    // Quiz 4
    var temperatureStrArray: [String] = ["colder", "cold", "normal", "warm"]
    @IBOutlet weak var quiz4View: UIStackView!
    @IBOutlet weak var temperaturePicker: UIPickerView!
    @IBOutlet weak var quiz4TitleLabel: UILabel!
    @IBOutlet weak var quiz4Description: UILabel!
    @IBOutlet weak var quiz4NextButton: UIButton!
    @IBOutlet weak var quiz4SubmitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // quiz 4
        quiz4Answer = quiz4.answers[0]
        quiz4View.isHidden = false
        
        quiz4TitleLabel.text = "Question \(quiz4Index + 1)"
        quiz4Description.text = quiz4.question.description
        quiz4Description.numberOfLines = 0
        
        temperaturePicker.delegate = self
        temperaturePicker.dataSource = self
        
        quiz4NextButton.isHidden = true
        quiz4NextButton.isEnabled = false
        quiz4SubmitButton.isHidden = false
        quiz4SubmitButton.isEnabled = false
        quiz4SubmitButton.addTarget(self, action: #selector(quiz4SubmitButtonPressed), for: .touchUpInside)
    }
    
    
    @objc func quiz4SubmitButtonPressed(_ sender: UIButton) {
        print("submit quiz4")
        quiz4.answers[0].submit()
    }
}

extension SingleSelectQuizViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return temperatureStrArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return temperatureStrArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedValue = pickerView.selectedRow(inComponent: component)
        let selectedString = temperatureStrArray[selectedValue]
        print("the temperature is \(selectedString)")
        quiz4Description.text = quiz4.question.description + " " + String(selectedString)
        quiz4SubmitButton.isEnabled = true
    }
}
