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
    var currentQuiz: Quiz!
    var currentAnswer: Answer!

    @IBOutlet var quiz3View: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
        
    @IBOutlet weak var numberOfFlowersSlider: UISlider!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuiz = quizs[currentQuizIndex]
        currentAnswer = currentQuiz.answers[0]
        
        titleLabel.text = "Question \(currentQuizIndex + 1)"
        descriptionLabel.text = currentQuiz.question.description
        descriptionLabel.numberOfLines = 0
        
        numberOfFlowersSlider.addTarget(self, action: #selector(numberOfFlowersChanged), for: .valueChanged)
        
        nextButton.isEnabled = false
        nextButton.isHidden = true
        submitButton.isEnabled = false
        submitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
    }
    
    @objc func numberOfFlowersChanged(_ sender: UISlider) {
        
        let numberOfFlowers = Int(sender.value)
        (currentAnswer as! AnswerNumberValue).numberValue = numberOfFlowers
        descriptionLabel.text = quizs[currentQuizIndex].question.description + " " + String(numberOfFlowers)
        submitButton.isEnabled = true
    }
    
    @objc func submitButtonPressed(_ sender: UIButton) {
        quizs[currentQuizIndex].answers[0].submit()
    }

}

