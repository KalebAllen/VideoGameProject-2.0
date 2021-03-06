//
//  ViewController.swift
//  VideoGameProject 2.0
//
//  Created by Kaleb Allen on 10/15/18.
//  Copyright © 2018 Kaleb Allen. All rights reserved.
//

import UIKit

class GameList: UITableViewController {
    
    var currentGame: Game!
    
    //swiping will bring up a menue
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    //segue to edit game screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            EditGameViewController {
            destination.gameToEdit = currentGame
        }
    }
    
    //tells the number of games in the array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameManager.sharedInstance.getGameCount()
    }
    //closes the menue
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //tells weather a gmae is checked out or not
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "gameCell") as! GameTableViewCell
        
        let currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
        
        cell.TitleLabel.text = currentGame.title
        cell.GenreLabel.text = currentGame.title
        cell.RatingLabel.text = currentGame.title
        
        if currentGame.checkIn {
            cell.statusView.backgroundColor = UIColor.green
        } else {
            cell.statusView.backgroundColor = UIColor.red
        }
        if let  duedate = currentGame.dueDate {
            cell.DueDateLable.text = formatDate(duedate)
        } else {
            cell.DueDateLable.text = ""
        }
        
        if currentGame.checkIn {
            cell.statusView.backgroundColor = UIColor.green
        } else {
            cell.statusView.backgroundColor = UIColor.red
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //This allows us to return an array of actions that the row will have (if any)
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, _) in
            // remove the game from current index
            GameManager.sharedInstance.removeGame(at: indexPath.row)
            //deletes row from current index path
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let gameForIndex = GameManager.sharedInstance.getGame(at: indexPath.row)
        let title = gameForIndex.checkIn ? "Check out" : "Check In"
        
        let checkOutOrInAction = UITableViewRowAction(style: .normal, title: title) { _, _ in
            GameManager.sharedInstance.checkGameInOrOut(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        let showEditScreenAction = UITableViewRowAction(style: .normal, title: "Edit") { _, _ in
            self.currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
            self.performSegue(withIdentifier: "showGameEditGameScreen", sender: self)
        }
        showEditScreenAction.backgroundColor = UIColor.orange
        return [checkOutOrInAction, deleteAction]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func unwindToGameList(segue: UIStoryboardSegue) { }
}

