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
        return 15
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "gameCell") as! GameTableViewCell
        
        let currentGame = gameArray[indexPath.row]
        
        cell.TitleLabel.text = currentGame.title
        cell.GenreLabel.text = currentGame.title
        cell.RatingLabel.text = currentGame.title
        
    }
    var gameArray = [Game(title: "Legend of Zelda", genre: "Open World", description: "", rating: "E")]
    
    gameArray[0].checkedIn = false
    
    if currentGame.checkIn {
    cell.statusView.backgroundColor = UIColor.green
    } else {
    cell.statusView.backgroundColor = UIColor.red
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func unwindToGameList(segue: UIStoryboardSegue) { }
    
}

