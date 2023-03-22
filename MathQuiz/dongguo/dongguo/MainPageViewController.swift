//
//  MainPageViewController.swift
//  dongguo
//
//  Created by david on 2023-03-19.
//

import UIKit

class MainPageViewController: UIViewController {
    
    var server: MathQuizServer!
    var currentQuiz: MathQuiz? = nil
    var currentQuizId = 0
    var quizs: [MathQuiz] = []
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var userAnswerTextField: UITextField!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var numberButtons: [UIButton]!
    
    
    @IBAction func generateButtonPressed(_ sender: Any) {
        if currentQuiz?.userAnswer == nil {
            return
        }
        updateQuiz()
    }
    
    @IBAction func validateButtonPressed(_ sender: Any) {
        guard let questionText = questionLabel.text  else {
            return
        }
        if questionText.contains("X")   || questionText.contains("Y") {
            return
        }
        
        guard let answer = userAnswerTextField.text, !answer.isEmpty,
              let currentQuiz = currentQuiz else {
            return
        }
        
        currentQuiz.enterUserAnswer(answer)
        if currentQuiz.IsRightAnswer() {
            server.updateDifficulty(server.difficulty + 1)
            questionLabel.text! += "\(answer) Y"
            questionLabel.textColor = .green
        }else{
            questionLabel.text! += "\(answer) X"
            questionLabel.textColor = .red
        }
    }
    
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        userAnswerTextField.text = ""
    }
    
    @IBAction func scoreButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toResult", sender: self)
    }
    
    @IBAction func finishButtonPressed(_ sender: Any) {
        print(server.deguInfo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        server = MathQuizServer()
        updateQuiz()
        
    }
    
    func updateQuiz() {
        currentQuiz = server.generateQuiz()
        userAnswerTextField.text = ""
        questionLabel.text = currentQuiz?.description
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ResultPageViewController {
            destination.server = self.server
        }
        
    }
    
    @IBAction func unwindToMainPageViewController(_ unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "fromResult" {
            let vc = unwindSegue.source as! ResultPageViewController
            mainTitleLabel.text = "\(vc.registerTextField.text ?? "") : \(vc.scoreLabel.text ?? "")"
        }
    }
    
}
