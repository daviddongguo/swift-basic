//
//  MainTableViewController.swift
//  Dongguo
//
//  Created by david on 2023-03-22.
//

import UIKit

class MainTableView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let manager = MediaManager()
    var list: [Media]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaTableViewCell
        cell.update(filteredArray[indexPath.row])
        cell.showsReorderControl = true
        return cell
    }
    
    // add delete indicator
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // Delete row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let mediaToDelete = filteredArray.remove(at: indexPath.row)
            list = list.filter{$0.name != mediaToDelete.name}
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }else if editingStyle == .insert {
            
        }
    }
    
    // Move row
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedMedia = list.remove(at: sourceIndexPath.row)
        list.insert(movedMedia, at: destinationIndexPath.row)
    }
    
    @IBOutlet weak var mediaTableView: UITableView!
    
    
    
    
    var filteredArray: [Media]!
    
    @IBAction func showAllMediaButtonPressed(_ sender: Any) {
        filteredArray = list.sorted()
        mediaTableView.reloadData()
    }
    
    @IBAction func moviesButtonPressed(_ sender: Any) {
        filteredArray  = list.filter{$0.type == .movies}.sorted()
        mediaTableView.reloadData()
    }
    
    @IBAction func musicButtonPressed(_ sender: Any) {
        filteredArray  = list.filter{$0.type == .music}.sorted()
        mediaTableView.reloadData()
    }
    
    @IBAction func booksButtonPressed(_ sender: Any) {
        filteredArray  = list.filter{$0.type == .books}
        mediaTableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        list = initList().sorted()
        filteredArray = list
        
        mediaTableView.dataSource = self
        mediaTableView.delegate = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mediaTableView.reloadData()
    }
    
    fileprivate func initList() -> [Media] {
        return items
    }
    
    @objc func editButtonTapped() {
        mediaTableView.setEditing(!mediaTableView.isEditing, animated: true)
    }
    
    @IBAction func unwindToFirstVC(_ segue: UIStoryboardSegue) {
        
        guard segue.identifier == "fromSave" else {
            return
        }
        guard let sourceViewcontroller = segue.source as? DetailTableView else {
            print("error: source is not view controller")
            return
        }
        
        if let media = sourceViewcontroller.currentMedia {
            // edit
            if let selectedIndexPath = mediaTableView.indexPathForSelectedRow {
                if let index = list.firstIndex(where: { $0.id == media.id }) {
                    list[index] = media
                }
                filteredArray[selectedIndexPath.row] = media
                mediaTableView.reloadRows(at: [selectedIndexPath], with: .none)
            }else{
                // add
                list.append(media)
                mediaTableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEditMedia" {
            
            let navVC = segue.destination as! UINavigationController
            let addEditMediaTableViewController = navVC.viewControllers.first as! DetailTableView
            
            let mediaToEdit = filteredArray[mediaTableView.indexPathForSelectedRow!.row]
            addEditMediaTableViewController.currentMedia = mediaToEdit
            addEditMediaTableViewController.manager = manager
        }
        
        if segue.identifier == "toAddMedia" {
            
            let navVC = segue.destination as! UINavigationController
            let addEditMediaTableViewController = navVC.viewControllers.first as! DetailTableView
            
            addEditMediaTableViewController.currentMedia = nil
            addEditMediaTableViewController.manager = manager
        }
    }
    
}
