//
//  AddGameViewController.swift
//  VideoGameProject 2.0
//
//  Created by Kaleb Allen on 10/17/18.
//  Copyright © 2018 Kaleb Allen. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var GameTitle: UITextField!
    @IBOutlet weak var GameDiscription: UITextField!
    @IBOutlet weak var GenrePicker: UIPickerView!
    @IBOutlet weak var RatingSlector: UISegmentedControl!
    
    let genres = ["Action","RPG","Platformer","Survial","Shooter"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row]
    }
    
    
    @IBAction func SubmmitButtontapped(_ sender: Any) {
        guard let title = GameDiscription.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "", let GameDiscription = gameDiscriptionTextView.text, GameDiscription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            return
        }
        var rating: String
        
        switch GenrePicker.selectedSegmentIndex {
        case 0:
            rating = "E"
        case 1:
            rating = "E10+"
        case 2:
            rating = "T"
        case 3:
            rating = "M"
        case 4:
            rating = "AO"
        default:
            rating = "E"
            
        }
        let genre =
            genres[GenrePicker.selectedRow(inComponent: 0)]
        
        let newGame = Game(title: title, genre: genre, description: description, rating: rating)
        
        GameManager.sharedInstance.addGame(game: newGame)
        
        self.performSegue(withIdentifier: "AddGameViewController", sender: self)
    }
}
