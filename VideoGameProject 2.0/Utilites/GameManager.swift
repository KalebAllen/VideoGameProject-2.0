//
//  GameManager.swift
//  VideoGameProject 2.0
//
//  Created by Kaleb Allen on 10/17/18.
//  Copyright © 2018 Kaleb Allen. All rights reserved.
//

import Foundation

class GameManager {
    //shareed instance of the GameManager
    static let sharedInstance = GameManager()
    
    //makign this privet
    private init() {
        
    }
    //list of all the games
     private var gameArray = [Game(title: "Legend of Zelda", genre: "Open World", description: "", rating: "E")]
    
    //function to get the number of games we have
    func getGameCount() -> Int {
        return gameArray.count
    }
    //Function to return a game at a specific index
    func getGame(at index: Int) -> Game {
        return gameArray[index]
    }
    //adds a new game
    func addGame(game:Game) {
        gameArray.append(game)
    }
}
