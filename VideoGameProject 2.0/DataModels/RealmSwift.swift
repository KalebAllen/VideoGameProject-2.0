//
//  RealmSwift.swift
//  VideoGameProject 2.0
//
//  Created by Kaleb Allen on 10/22/18.
//  Copyright © 2018 Kaleb Allen. All rights reserved.
//

import UIKit
import RealmSwift

class VideoGame: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var genre: String = ""
    @objc dynamic var rating: String = ""
    @objc dynamic var gameDescription: String = ""
    @objc dynamic var checkedIn:Bool = true
    @objc dynamic var dueDate: Date? = nil
    
}
