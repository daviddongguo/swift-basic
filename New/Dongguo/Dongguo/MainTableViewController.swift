//
//  MainTableViewController.swift
//  Dongguo
//
//  Created by david on 2023-03-22.
//

import UIKit

class MainTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaTableViewCell
        cell.mediaImage.image = UIImage(named: list[indexPath.row].imagePath)
        cell.titleLabel.text = list[indexPath.row].name
        cell.yearLabel.text = "\(list[indexPath.row].publicationYear)"
        return cell
    }
    
    
    
    @IBOutlet weak var mediaTableView: UITableView!
    
    var list: [Media] = [
        Media(name: "A", imagePath: "00.jpeg", publicationYear: 2021),
        Media(name: "A", imagePath: "00.jpeg", publicationYear: 2022),
        Media(name: "A", imagePath: "00.jpeg", publicationYear: 2023),
        Media(name: "A", imagePath: "00.jpeg", publicationYear: 2024),
        Media(name: "A", imagePath: "00.jpeg", publicationYear: 2025),
        Media(name: "A", imagePath: "00.jpeg", publicationYear: 2026)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mediaTableView.dataSource = self
        mediaTableView.delegate = self
    }
}
