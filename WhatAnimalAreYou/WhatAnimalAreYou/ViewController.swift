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
    
    // quiz 1
    @IBOutlet weak var quiz1View: UIStackView!
    @IBOutlet weak var quiz1TitleLabel: UILabel!
    @IBOutlet weak var quiz1DescriptionLabel: UILabel!
    @IBOutlet var quiz1AnswerTitleLabel: [UILabel]!
    @IBOutlet var quiz1AnswerSwitchs: [UISwitch]!
    @IBOutlet weak var quiz1NextButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
    @objc func quiz1SwitchValueChanged(_ sender: UISwitch) {
        print("switch value changed: \(sender.isOn)")
    }

    
    @objc func quiz1NextButtonPressed(_ sender: UIButton) {
        print("jump to quiz 3")
        quiz1.answers[0].submit()
        quiz1.answers[1].submit()
        quiz1.answers[2].submit()
        
        quiz1View.isHidden = true
    }
    
}





