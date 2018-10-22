//
//  GameManager.swift
//  VideoGameProject 2.0
//
//  Created by Kaleb Allen on 10/17/18.
//  Copyright © 2018 Kaleb Allen. All rights reserved.
//

import Foundation
import RealmSwift
import UserNotifications

class GameManager {
    //shareed instance of the GameManager
    static let sharedInstance = GameManager()
    
    //creating a private initializer so that no instance of this class can be made anywhere else
    private init(){
        gameArray = realm.objects(Game.self)
    }
    
    private var gameArray: Results<Game>!
    
    let realm = try! Realm()
    
    func getGameCount() -> Int {
        return gameArray.count
    }
    
    func getGame(at index: Int) -> Game {
        return gameArray[index]
    }
    
    func addgame(game: Game) {
        try! realm.write {
            realm.add(game)
        }
    }
    
    func removeGame(at index: Int) {
        try! realm.write {
            realm.delete(getGame(at: index))
        }
    }
    
    //function to check game in/out
    func checkGameInOrOut(at index: Int) {
        let gameForIndex = gameArray[index]
        
        try! realm.write {
            let gameForIndex = gameArray[index]
            gameArray[index].checkIn = !gameArray[index].checkIn
            
            if gameForIndex.checkIn {
                //remove any duedate from game
                gameForIndex.dueDate = nil
            } else {
                //adds a due date to game
                gameForIndex.dueDate = Calendar.current.date(byAdding: .day, value: 24, to:Date())
            }
        }
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = gameForIndex.title
        content.body = "hey your game is due"
        
        let trigerDate =
            Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: gameForIndex.dueDate!)
        let trigger = UNCalendarNotificationTrigger(dateMatching: trigerDate, repeats: false)
        
        let identifier = gameForIndex.title
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: {
            error in if let error = error {
                print(error.localizedDescription)
            }
        })
    }
    
}

