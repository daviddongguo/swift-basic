//
//  ViewController.swift
//  WhatAnimalAreYou
//
//  Created by david on 2023-03-11.
//

import UIKit

class ViewController: UIViewController {
    

    let quizs: [Quiz] = [quiz1, quiz2, quiz3, quiz4]
    let quiz3Index = 2
    var quiz3Answer: Answer!

    
    // quiz 3
    @IBOutlet weak var quiz3View: UIStackView!
    
    @IBOutlet weak var quiz3titleLabel: UILabel!
    
    @IBOutlet weak var quiz3DescriptionLabel: UILabel!
        
    @IBOutlet weak var quiz3NumberOfFlowersSlider: UISlider!
    
    @IBOutlet weak var quiz3NextButton: UIButton!
    
    @IBOutlet weak var quiz3SubmitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quiz3Answer = quiz3.answers[0]
        
        quiz3titleLabel.text = "Question \(quiz3Index + 1)"
        quiz3DescriptionLabel.text = quiz3.question.description
        quiz3DescriptionLabel.numberOfLines = 0
        
        quiz3NumberOfFlowersSlider.addTarget(self, action: #selector(numberOfFlowersChanged), for: .valueChanged)
        
        quiz3NextButton.isEnabled = false
        quiz3NextButton.isHidden = true
        quiz3SubmitButton.isEnabled = false
        quiz3SubmitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
    }
    
    @objc func numberOfFlowersChanged(_ sender: UISlider) {
        
        let numberOfFlowers = Int(sender.value)
        (quiz3Answer as! AnswerNumberValue).numberValue = numberOfFlowers
        quiz3DescriptionLabel.text = quizs[quiz3Index].question.description + " " + String(numberOfFlowers)
        quiz3SubmitButton.isEnabled = true
    }
    
    @objc func submitButtonPressed(_ sender: UIButton) {
        quizs[quiz3Index].answers[0].submit()
    }

}

