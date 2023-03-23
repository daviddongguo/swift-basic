//
//  ResultViewController.swift
//  dongguo
//
//  Created by david on 2023-03-19.
//

import UIKit



class ResultPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CellDelegate {

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        cell.delegate = self
        let quiz = list[indexPath.row]
        cell.currentQuiz = quiz
        cell.quizTitleLabel.text = quiz.description
        cell.userAnswerLabel.text = quiz.userAnswer
        cell.quizDifficulty.text = String(quiz.difficulty)
        cell.redoButton.isEnabled = !quiz.IsRightAnswer()
        
        return cell
    }

    
    func didRedoButtonInCell(_ quiz: MathQuiz?) {
        currentQuiz = quiz
        print(currentQuiz?.description ?? "no quiz found")
        performSegue(withIdentifier: "fromRedo", sender: self)
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected cell using the indexPath
        let selectedCell = tableView.cellForRow(at: indexPath)
        
        // Do something with the selected cell
        print("Selected cell: \(String(describing: (selectedCell as! Cell).currentQuiz))")
    }
    
    
    var list: [MathQuiz] = []
    var score: String = ""
    var currentQuiz: MathQuiz? = nil
    
    @IBOutlet weak var resultsTableView: UITableView!
   
    @IBOutlet weak var registerTextField: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         scoreLabel.text = score
        resultsTableView.dataSource = self
        resultsTableView.delegate = self
    }

}
