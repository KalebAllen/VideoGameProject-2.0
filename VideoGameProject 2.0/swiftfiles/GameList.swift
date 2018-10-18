//
//  ViewController.swift
//  VideoGameProject 2.0
//
//  Created by Kaleb Allen on 10/15/18.
//  Copyright © 2018 Kaleb Allen. All rights reserved.
//

import UIKit

class GameList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameManager.sharedInstance.getGameCount()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func unwindToGameList(segue: UIStoryboardSegue) { }
}

