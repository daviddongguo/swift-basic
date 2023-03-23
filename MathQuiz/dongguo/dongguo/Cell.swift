//
//  ResultTableViewCell.swift
//  dongguo
//
//  Created by david on 2023-03-22.
//

import UIKit

class Cell: UITableViewCell {
    
    weak var delegate: CellDelegate?
    
    var currentQuiz: MathQuiz?
    
    
        
    @IBOutlet weak var quizTitleLabel: UILabel!
    @IBOutlet weak var userAnswerLabel: UILabel!
   
    @IBOutlet weak var quizDifficulty: UILabel!
    
    @IBOutlet weak var redoButton: UIButton!
    
    @IBAction func redoButtonPressed(_ sender: Any) {
        delegate?.didRedoButtonInCell(self)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        guard let currentQuiz = currentQuiz else {
            return
        }
        quizTitleLabel.text = currentQuiz.description
        userAnswerLabel.text = currentQuiz.userAnswer
        quizDifficulty.text = String(currentQuiz.difficulty)
        redoButton.isEnabled = !currentQuiz.IsRightAnswer()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        delegate = nil
    }

}
