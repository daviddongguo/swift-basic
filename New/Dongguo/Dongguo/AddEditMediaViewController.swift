//
//  AddEditMediaViewController.swift
//  Dongguo
//
//  Created by david on 2023-03-23.
//

import UIKit

class AddEditMediaViewController: UITableViewController {
    
    var currentMedia: Media?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        currentMedia = Media(name: "new book", imagePath: "00.jpeg", publicationYear: 2021, type: .books)
    }
    
    func updateSavebuttonState() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "fromSave" else {
            return
        }
        
        currentMedia = Media(name: "add a new music", imagePath: "00.jpeg", publicationYear: 2022, type: .music )
        
        
    }
    
}
