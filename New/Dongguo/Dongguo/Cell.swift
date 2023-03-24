//
//  MediaTableViewCell.swift
//  Dongguo
//
//  Created by david on 2023-03-22.
//

import UIKit

class MediaTableViewCell: UITableViewCell {
    
    var currentMedia: Media?
    

    @IBOutlet weak var mediaImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    
    func update(_ media: Media){
        currentMedia = media
        self.mediaImage.image = UIImage(named: media.imagePath)
        self.titleLabel.text = media.name
        self.yearLabel.text = "\(media.publicationYear)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
