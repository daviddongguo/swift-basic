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
        delegate?.didRedoButtonInCell(currentQuiz)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        delegate = nil
    }

}
