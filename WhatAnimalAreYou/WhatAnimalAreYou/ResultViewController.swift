//
//  ResultViewController.swift
//  WhatAnimalAreYou
//
//  Created by david on 2023-03-12.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var resultImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultLabel.text = "You are \(personality.like)"
        resultImage.image = animalImages[personality.like.rawValue]
        
        resultImage.layer.cornerRadius = resultImage.frame.size.width / 2
    }

}
