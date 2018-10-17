//
//  Games.swift
//  VideoGameProject 2.0
//
//  Created by Kaleb Allen on 10/16/18.
//  Copyright © 2018 Kaleb Allen. All rights reserved.
//

import Foundation
class Game {
    var title: String
    var genre: String
    var desription: String
    var rating: String
    var dueDate: Data?
    var checkIn: Bool = true
    
    init(title: String, genre: String, description: String, rating: String) {
        self.title = title
        self.desription = description
        self.genre = genre
        self.rating = rating
    }
}
