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
    
    //creating a private initializer so that no instance of this class can be made anywhere else
    private init() {
        gameArray[0].dueDate = Date()
    }
    //list of all the games
     private var gameArray = [Game(title: "Legend of Zelda Breath of the Wild", genre: "Open World", description: "", rating: "E")]
    
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

