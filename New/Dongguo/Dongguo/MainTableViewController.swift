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
        cell.update(list[indexPath.row])
        return cell
    }
    
    @IBOutlet weak var mediaTableView: UITableView!
    
    var list: [Media] = [
        Media(name: "first book", imagePath: "00.jpeg", publicationYear: 2021, type: .books),
        Media(name: "second book", imagePath: "00.jpeg", publicationYear: 2022, type: .books),
        Media(name: "third book", imagePath: "00.jpeg", publicationYear: 2023, type: .books),
        Media(name: "forth book", imagePath: "00.jpeg", publicationYear: 2024, type: .books),
        Media(name: "A Movie", imagePath: "00.jpeg", publicationYear: 2021, type: .movies),
        Media(name: "A Music", imagePath: "00.jpeg", publicationYear: 2022, type: .music),
        Media(name: "no type", imagePath: "00.jpeg", publicationYear: 2022 )
    ]
    
    
    @IBAction func moviesButtonPressed(_ sender: Any) {
//        list = originList.filter{$0.type == .movies}
//        mediaTableView.reloadData()
    }
    
    @IBAction func musicButtonPressed(_ sender: Any) {
//        list = originList.filter{$0.type == .music}
//        mediaTableView.reloadData()
    }
    
    @IBAction func booksButtonPressed(_ sender: Any) {
//        list = originList.filter{$0.type == .books}
//        mediaTableView.reloadData()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mediaTableView.dataSource = self
        mediaTableView.delegate = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
    }
    
    @objc func editButtonTapped() {
        mediaTableView.setEditing(!mediaTableView.isEditing, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // Delete row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }else if editingStyle == .insert {
            
        }
    }
    
    // Move row
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedMedia = list.remove(at: sourceIndexPath.row)
        list.insert(movedMedia, at: destinationIndexPath.row)
    }
    
    

    @IBAction func unwindToFirstVC(_ segue: UIStoryboardSegue) {
        
        guard segue.identifier == "fromSave" else {
            return
        }
        guard let sourceViewcontroller = segue.source as? AddEditMediaViewController else {
            print("error: source is not view controller")
            return
        }
        
        if let media = sourceViewcontroller.currentMedia {
            // edit
            if let selectedIndexPath = mediaTableView.indexPathForSelectedRow {
                list[selectedIndexPath.row] = media
                mediaTableView.reloadRows(at: [selectedIndexPath], with: .none)
            }else{
                // add
                let newIndexPath = IndexPath(row: list.count, section: 0)
                list.append(media)
                mediaTableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "toEditMedia" {
            
            let navVC = segue.destination as! UINavigationController
            let addEditMediaTableViewController = navVC.viewControllers.first as! AddEditMediaViewController

            addEditMediaTableViewController.currentMedia = list[mediaTableView.indexPathForSelectedRow!.row]
        }
    }
    
}
