//
//  Games.swift
//  VideoGameProject 2.0
//
//  Created by Kaleb Allen on 10/16/18.
//  Copyright © 2018 Kaleb Allen. All rights reserved.
//

import Foundation
import RealmSwift

class Game: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var genre: String = ""
    @objc dynamic var gameDesription: String = ""
    @objc dynamic var rating: String = ""
    @objc dynamic var dueDate: Date? = nil
    @objc dynamic var checkIn: Bool = true
}
