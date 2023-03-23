//
//  ResultViewController.swift
//  dongguo
//
//  Created by david on 2023-03-19.
//

import UIKit



class ResultPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CellDelegate {
    
    let images = [
        UIImage(named: "star00.png"),
        UIImage(named: "star01.png"),
        UIImage(named: "star02.png"),
        UIImage(named: "star03.png"),
        UIImage(named: "star04.png"),
    ]

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        cell.delegate = self
        let quiz = list[indexPath.row]
        cell.currentQuiz = quiz
        cell.quizTitleLabel.text = quiz.description
        cell.starImage.image = images[quiz.star]
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
        resultsTableView.dataSource = self
        resultsTableView.delegate = self
        scoreLabel.text = score
        list = list.sorted{$0.id > $1.id}
    }

}
