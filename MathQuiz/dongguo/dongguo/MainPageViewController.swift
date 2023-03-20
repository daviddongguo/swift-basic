//
//  MainPageViewController.swift
//  dongguo
//
//  Created by david on 2023-03-19.
//

import UIKit

class MainPageViewController: UIViewController {
    
    let server = MathQuizServer()
    var currentQuiz: MathQuiz? = nil
    var currentQuizId = 0

    @IBAction func scoreButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toResult", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuiz()
               
    }
    
    func updateQuiz() {
        currentQuizId += 1
        currentQuiz = RandomMathQuiz(id: currentQuizId)        
    }
    
    
    @IBAction func unwindToMainPageViewController(_ unwindSegue: UIStoryboardSegue) {
            
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
