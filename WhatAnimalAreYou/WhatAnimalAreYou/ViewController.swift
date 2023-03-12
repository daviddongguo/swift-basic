//
//  ViewController.swift
//  WhatAnimalAreYou
//
//  Created by david on 2023-03-11.
//

import UIKit

class ViewController: UIViewController {
    

    let quizs: [Quiz] = [quiz1, quiz2, quiz3, quiz4]
    let currentQuizIndex = 2

    @IBOutlet var quiz3View: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
        
    @IBOutlet weak var numberOfFlowers: UISlider!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        quiz3View.isHidden = true
        titleLabel.text = "Question \(currentQuizIndex)"
        descriptionLabel.text = quizs[currentQuizIndex].question.description
        descriptionLabel.numberOfLines = 0
        numberOfFlowers.addTarget(self, action: #selector(numberOfFlowersChanged), for: .valueChanged)
        nextButton.isEnabled = false
        nextButton.isHidden = true
        submitButton.isEnabled = false
        submitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
    }
    
    @objc func numberOfFlowersChanged(_ sender: UISlider) {
        
        let numberOfFlowers = Int(sender.value)
        (quizs[currentQuizIndex].answers[0] as! AnswerNumberValue).numberValue = numberOfFlowers
        let answer = quizs[currentQuizIndex].answers[0] as! AnswerNumberValue
        print(answer.numberValue)
        descriptionLabel.text = quizs[currentQuizIndex].question.description + String(numberOfFlowers)
        submitButton.isEnabled = true
    }
    
    @objc func submitButtonPressed(_ sender: UIButton) {
        let answer = quizs[currentQuizIndex].answers[0]
        answer.submit()
        print(personality.like)

    }

}

