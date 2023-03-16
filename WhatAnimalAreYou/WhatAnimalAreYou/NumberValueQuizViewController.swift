//
//  NumberValueQuizViewController.swift
//  WhatAnimalAreYou
//
//  Created by map07 on 2023-03-16.
//

import UIKit

class NumberValueQuizViewController: UIViewController {
    
    let quizs: [Quiz] = [quiz1, quiz2, quiz3, quiz4]
    var quiz3index = 2
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

        // Do any additional setup after loading the view.
        // Quiz 3
        quiz3Answer = quiz3.answers[0]
        
        quiz3titleLabel.text = "Question \(quiz3index + 1)"
        quiz3DescriptionLabel.text = quiz3.question.description
        quiz3DescriptionLabel.numberOfLines = 0
        
        quiz3NumberOfFlowersSlider.addTarget(self, action: #selector(numberOfFlowersChanged), for: .valueChanged)
        
        
        quiz3NextButton.isHidden = true
        quiz3NextButton.isEnabled = false
        quiz3SubmitButton.isHidden = false
        quiz3SubmitButton.isEnabled = false
        quiz3SubmitButton.addTarget(self, action: #selector(quiz3SubmitButtonPressed), for: .touchUpInside)
        quiz3NumberOfFlowersSlider.addTarget(self, action: #selector(numberOfFlowersChanged), for: .valueChanged)
    }
   
    @objc func numberOfFlowersChanged(_ sender: UISlider) {
        let numberOfFlowers = Int(sender.value)
        (quiz3Answer as! AnswerNumberValue).numberValue = numberOfFlowers
        quiz3DescriptionLabel.text = quizs[quiz3index].question.description + " " + String(numberOfFlowers)
        quiz3SubmitButton.isEnabled = true
    }
    
    
    @objc func quiz3SubmitButtonPressed(_ sender: UIButton) {
        print("submit quiz3")
        quiz3.answers[0].submit()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
