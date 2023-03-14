//
//  ViewController.swift
//  deleteTable
//
//  Created by map07 on 2023-03-14.
//

import UIKit

class ViewController: UITableViewController {
    
    var emojis: [Emoji] =
        [
            Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
            Emoji(symbol: "😕", name: "Confused Face",description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
            Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.",usage: "love of something; attractive"),
            Emoji(symbol: "👮", name: "Police Officer",description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
            Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),
            Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
            Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
            Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
            Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
            Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
            Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
            Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
            Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Version one with basic cell ...........................
        // Step 1: Dequeue cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

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


class Emoji {

    var symbol: String
    var name: String
    var description: String
    var usage: String

    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}

