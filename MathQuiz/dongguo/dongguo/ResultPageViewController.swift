//
//  ResultViewController.swift
//  dongguo
//
//  Created by david on 2023-03-19.
//

import UIKit



class ResultPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CellDelegate {
    
    let starImages = [
        UIImage(named: "star00.png"),
        UIImage(named: "star01.png"),
        UIImage(named: "star02.png"),
        UIImage(named: "star03.png"),
        UIImage(named: "star04.png"),
    ]
    
    var isSortedByQuizLength = false
    var isSortedByQuizDifficult = false
    var isSortedByQuizAnswerRight = false
    
    @IBOutlet weak var quizTitleButton: UIButton!
    @IBOutlet weak var quizDifficultyButton: UIButton!
    @IBOutlet weak var quizRightButton: UIButton!
    
    @IBAction func quizTitleButtonPressed(_ sender: Any) {
        isSortedByQuizLength = !isSortedByQuizLength
        if isSortedByQuizLength {
            list = list.sorted{$0.description.count < $1.description.count}
        }else {
            list = list.sorted{$0.description.count > $1.description.count}
        }
        resultsTableView.reloadData()
    }
    
    @IBAction func quizDiffcultyButtonPressed(_ sender: Any) {
        isSortedByQuizDifficult = !isSortedByQuizDifficult
        if isSortedByQuizDifficult {
            list = list.sorted{$0.star < $1.star}
        }else {
            list = list.sorted{$0.star > $1.star}
        }
        resultsTableView.reloadData()
    }
    
    @IBAction func quizRightButton(_ sender: Any) {
        isSortedByQuizAnswerRight = !isSortedByQuizAnswerRight
        if isSortedByQuizAnswerRight {
            list = list.sorted{$0.IsRightAnswer() && !$1.IsRightAnswer()}
        }else {
            list = list.sorted{!$0.IsRightAnswer() && $1.IsRightAnswer()}
        }
        resultsTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        // the cell will delegate tableView do a task named didRedoButtonPressedInCell
        cell.delegate = self
        cell.update(with: list[indexPath.row])
        return cell
    }
    
    func didRedoButtonPressedInCell(_ quiz: MathQuiz?) {
        currentQuiz = quiz
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
