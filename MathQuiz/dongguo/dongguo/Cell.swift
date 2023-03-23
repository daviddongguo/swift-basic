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
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var redoButton: UIButton!
    
    @IBAction func redoButtonPressed(_ sender: Any) {
        delegate?.didRedoButtonPressedInCell(currentQuiz)
//        performSegue(withIdentifier: "fromRedo", sender: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(with quiz: MathQuiz) -> Void {
        self.currentQuiz = quiz
        self.quizTitleLabel.text = quiz.description
        if !quiz.IsRightAnswer() {
            self.quizTitleLabel.textColor = .red
        }else{
            self.quizTitleLabel.textColor = .black
        }
        self.starImage.image = starImages[quiz.star]
        self.redoButton.isEnabled = !quiz.IsRightAnswer()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        delegate = nil
    }
    
    let starImages = [
        UIImage(named: "star00.png"),
        UIImage(named: "star01.png"),
        UIImage(named: "star02.png"),
        UIImage(named: "star03.png"),
        UIImage(named: "star04.png"),
    ]

}
