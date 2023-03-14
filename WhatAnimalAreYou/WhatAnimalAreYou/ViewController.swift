//
//  ViewController.swift
//  WhatAnimalAreYou
//
//  Created by david on 2023-03-11.
//

import UIKit

class ViewController: UIViewController {
    
    
    let quizs: [Quiz] = [quiz1, quiz2, quiz3, quiz4]
    let quiz1Index = 0
    var quiz1Answers: [Answer]!
    let quiz3Index = 2
    var quiz3Answer: Answer!
    let quiz4Index = 3
    var quiz4Answer: Answer!
    
    // quiz 1
    
    @IBOutlet weak var quiz1View: UIStackView!
    
    @IBOutlet weak var quiz1TitleLabel: UILabel!
    
    @IBOutlet weak var quiz1DescriptionLabel: UILabel!
    
    
    @IBOutlet var quiz1AnswerTitleLabel: [UILabel]!
    
    @IBOutlet var quiz1AnswerSwitchs: [UISwitch]!
    
    @IBOutlet weak var quiz1NextButton: UIButton!
    
    @IBOutlet weak var quiz1SubmitButton: UIButton!
    
    
    // quiz 3
    @IBOutlet weak var quiz3View: UIStackView!
    
    @IBOutlet weak var quiz3titleLabel: UILabel!
    
    @IBOutlet weak var quiz3DescriptionLabel: UILabel!
    
    @IBOutlet weak var quiz3NumberOfFlowersSlider: UISlider!
    
    @IBOutlet weak var quiz3NextButton: UIButton!
    
    @IBOutlet weak var quiz3SubmitButton: UIButton!
    
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
        quiz3View.isHidden = true
        quiz4View.isHidden = true
        // Quiz 1
        quiz1TitleLabel.text = "Question \(quiz1Index + 1)"
        quiz1DescriptionLabel.text = quiz1.question.description
        
        for i in  0..<quiz1AnswerTitleLabel.count {
            quiz1AnswerTitleLabel[i].text = quiz1.answers[i].text
            quiz1AnswerSwitchs[i].transform = CGAffineTransformMakeScale(0.7, 0.7);
            quiz1AnswerSwitchs[i].addTarget(self, action: #selector(quiz1SwitchValueChanged), for: .valueChanged)
            
        }
        
        
        quiz1NextButton.addTarget(self, action: #selector(quiz1NextButtonPressed), for: .touchUpInside)
        quiz1NextButton.isEnabled = false
        quiz1SubmitButton.isHidden = true
        
        // Quiz 3
        quiz3Answer = quiz3.answers[0]
        
        quiz3titleLabel.text = "Question \(quiz3Index + 1)"
        quiz3DescriptionLabel.text = quiz3.question.description
        quiz3DescriptionLabel.numberOfLines = 0
        
        quiz3NumberOfFlowersSlider.addTarget(self, action: #selector(numberOfFlowersChanged), for: .valueChanged)
        
        
        quiz3NextButton.isHidden = true
        quiz3NextButton.isEnabled = false
        quiz3SubmitButton.isHidden = false
        quiz3SubmitButton.isEnabled = false
        quiz3SubmitButton.addTarget(self, action: #selector(quiz3SubmitButtonPressed), for: .touchUpInside)
        quiz3NumberOfFlowersSlider.addTarget(self, action: #selector(numberOfFlowersChanged), for: .valueChanged)
        
        // quiz 4
        quiz4Answer = quiz4.answers[0]
        
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
    
    @objc func quiz1SwitchValueChanged(_ sender: UISlider) {
//        let value = sender.value
//        print(value)
        print("switch value changed: \(sender.isSelected)")
        quiz1SubmitButton.isEnabled = true
    }
    
    
    @objc func numberOfFlowersChanged(_ sender: UISlider) {
        let numberOfFlowers = Int(sender.value)
        (quiz3Answer as! AnswerNumberValue).numberValue = numberOfFlowers
        quiz3DescriptionLabel.text = quizs[quiz3Index].question.description + " " + String(numberOfFlowers)
        quiz3SubmitButton.isEnabled = true
    }
    
    @objc func quiz3SubmitButtonPressed(_ sender: UIButton) {
        print("submit quiz3")
        quiz3.answers[0].submit()
    }
    
    @objc func quiz4SubmitButtonPressed(_ sender: UIButton) {
        print("submit quiz4")
        quiz4.answers[0].submit()
    }
    
    
    @objc func quiz1NextButtonPressed(_ sender: UIButton) {
        print("jump to quiz 3")
        quiz1.answers[0].submit()
        quiz1.answers[1].submit()
        quiz1.answers[2].submit()
        
        quiz1View.isHidden = true
        quiz3View.isHidden = false
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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



