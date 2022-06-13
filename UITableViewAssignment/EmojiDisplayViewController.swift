//
//  EmojiDisplayViewController.swift
//  UITableViewAssignment
//
//  Created by khavishini suresh on 12/06/2022.
//

import UIKit

struct Emoji {
    var names: String
    var symbols: String
    var descriptions: String
}
//
class EmojiDisplayTableViewController: UITableViewController, NewEmoji {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Emoji"
    }
    
    var emojis = [Emoji]()
    
    func addNewEmoji(data: Emoji) {
        self.emojis.append(data)
        self.tableView.reloadData()
    }
    
    
    @IBAction func addEmojiButton(_ sender: Any) {
        performSegue(withIdentifier: "addEmoji", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addEmoji" {
            let secondVC = segue.destination as! AddEmojiViewController
            secondVC.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EmojiTableViewCell
        cell.emojiNameLabel?.text = emojis[indexPath.row].names
        cell.emojiLabel?.text = emojis[indexPath.row].symbols
        cell.emojiDescriptionLabel?.text = emojis[indexPath.row].descriptions
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}


