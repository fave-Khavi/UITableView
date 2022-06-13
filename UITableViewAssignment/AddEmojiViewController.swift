//
//  AddEmojiViewController.swift
//  UITableViewAssignment
//
//  Created by khavishini suresh on 12/06/2022.
//

import UIKit

protocol NewEmoji {
    func addNewEmoji(data: Emoji)
}

class AddEmojiViewController: UIViewController {

    @IBOutlet weak var emojiSymbol: UITextField!
    @IBOutlet weak var emojiName: UITextField!
    @IBOutlet weak var emojiDescription: UITextField!
    @IBOutlet weak var errorDisplay: UILabel!
    
    var delegate:NewEmoji?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add New Emoji"
    }
    
    @IBAction func saveNewEmoji(_ sender: Any) {
        guard
            let name = emojiName.text,
            emojiName.hasText,
            let symbol = emojiSymbol.text,
            emojiSymbol.hasText,
            let description = emojiDescription.text,
            emojiDescription.hasText
        else {
            errorDisplay.text = "Enter all fields!!!"
            return
        }
        let data = Emoji(names: name, symbols: symbol, descriptions: description)
        delegate?.addNewEmoji(data: data)
        self.navigationController?.popViewController(animated: true)
    }
    

}
