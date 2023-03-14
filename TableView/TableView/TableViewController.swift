//
//  ViewController.swift
//  TableView
//
//  Created by map07 on 2023-03-14.
//

import UIKit

class TableViewController: UITableViewController {
    
    // Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Version one with basic cell ...........................
        // Step 1: Dequeue cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiTableViewCell", for: indexPath)

        // Step 2: Fetch model object to display
        // indexPath.row attribute is defined in an extention of IndexPath Structure
        let emoji = emojis[indexPath.row]

        // Step 3: Configure cell
        // Version one with basic cell ---------------------------
        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
        cell.detailTextLabel?.text = emoji.description
        //--------------------------------------------------------

        //Step 4: Return cell
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

