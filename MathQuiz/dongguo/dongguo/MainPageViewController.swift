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
    @IBAction func scoreButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toResult", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        server = MathQuizServer()
        updateQuiz()
        
    }
    
    func updateQuiz() {
        currentQuizId += 1
        currentQuiz = RandomMathQuiz(id: currentQuizId)
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
