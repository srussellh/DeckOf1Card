//
//  SwapiViewController.swift
//  DeckOf1Card
//
//  Created by Bobba Kadush on 5/13/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import UIKit

class SwapiViewController: UIViewController {
    @IBOutlet weak var identifierTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        guard let identifierAsString = identifierTextField.text,
            let identifier = Int(identifierAsString) else {return}
        PersonController.shared.fetchPersonWith(identifier: identifier) { (person) in
            
            DispatchQueue.main.async {
                self.nameLabel.text = person?.name
                self.birthYearLabel.text = person?.birthYear
                self.hairColorLabel.text = person?.hairColor
                self.eyeColorLabel.text = person?.eyeColor
            }
        }
    }
}
