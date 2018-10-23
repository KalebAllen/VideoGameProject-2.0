//
//  GameTableViewCell.swift
//  VideoGameProject 2.0
//
//  Created by Kaleb Allen on 10/16/18.
//  Copyright © 2018 Kaleb Allen. All rights reserved.
//

import UIKit
//Outlets for the storybaords
class GameTableViewCell: UITableViewCell {
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var GenreLabel: UILabel!
    @IBOutlet weak var DueDateLable: UILabel!
    @IBOutlet weak var RatingLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
