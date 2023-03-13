//
//  WelcomeViewController.swift
//  WhatAnimalAreYou
//
//  Created by david on 2023-03-12.
//

import UIKit
import Foundation

class WelcomeViewController: UIViewController {


    
    var iconSize: Int!
    
    @IBOutlet weak var holder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        iconSize = Int(min(holder.frame.width, holder.frame.height)) / 8
        
        
        let imageView1 = UIImageView(image: animalImages[0])
        imageView1.frame = CGRect(x: iconSize / 4, y: iconSize, width: iconSize, height: iconSize)
        imageView1.layer.cornerRadius = imageView1.frame.size.width / 2
        view.addSubview(imageView1)
        
        let imageView2 = UIImageView(image: animalImages[1])
        imageView2.frame = CGRect(x: Int(holder.frame.width) - iconSize, y: iconSize, width: iconSize, height: iconSize)
        imageView2.layer.cornerRadius = imageView2.frame.size.width / 2
        view.addSubview(imageView2)
        
        let imageView3 = UIImageView(image: animalImages[2])
        imageView3.frame = CGRect(x: iconSize / 4, y:Int(holder.frame.height) - iconSize * 2, width: iconSize, height: iconSize)
        imageView3.layer.cornerRadius = imageView3.frame.size.width / 2
        view.addSubview(imageView3)
        
        let imageView4 = UIImageView(image: animalImages[3])
        imageView4.frame = CGRect(x: Int(holder.frame.width) - iconSize, y:Int(holder.frame.height) - iconSize * 2, width: iconSize, height: iconSize)
        imageView4.layer.cornerRadius = imageView4.frame.size.width / 2
        view.addSubview(imageView4)
        
    }
    
    
    
}
