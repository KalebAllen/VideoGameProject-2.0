//
//  AddGameViewController.swift
//  VideoGameProject 2.0
//
//  Created by Kaleb Allen on 10/17/18.
//  Copyright © 2018 Kaleb Allen. All rights reserved.
//

import UIKit
import RealmSwift

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
    //lets the user pick the rating in the game
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //lets the user pick the genre of the game
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    //filles in the rows in the picker view
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row]
    }
    //thorws an error if the user left anything blank in the add game
    func showErrorAlert() {
        let alertController = UIAlertController(title: "ERROR", message: "you must enter a title and a discription for the game", preferredStyle: .actionSheet)
        let closeAction = UIAlertAction(title: "Close", style: .default) {
            _ in
            self.GameTitle.text = ""
            self.GameDiscription.text = ""
        }
        alertController.addAction(closeAction)
        self.present(alertController, animated: true, completion: nil)
    }
    //the function that trows therror screen
    @IBAction func SubmmitButtontapped(_ sender: Any) {
        guard let title = GameDiscription.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "", let GameDiscription = GameDiscription.text, GameDiscription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            return
        }
        var rating: String
        
        switch RatingSlector.selectedSegmentIndex {
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
        //stores the genre of game 
        let genre =
            genres[GenrePicker.selectedRow(inComponent: 0)]
        
        let newGame = Game()
        newGame.title = title
        newGame.gameDesription = GameDiscription
        newGame.rating = rating
        newGame.genre = genre
        
        GameManager.sharedInstance.addgame(game: newGame)
        
        self.performSegue(withIdentifier: "unwindToGameList", sender: self)
    }
    
    
}
