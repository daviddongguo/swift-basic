//
//  MediaTableViewCell.swift
//  Dongguo
//
//  Created by david on 2023-03-22.
//

import UIKit

class MediaTableViewCell: UITableViewCell {
    
    
    

    @IBOutlet weak var mediaImage: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
