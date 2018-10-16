//
//  GameTableViewCell.swift
//  VideoGameProject 2.0
//
//  Created by Kaleb Allen on 10/16/18.
//  Copyright © 2018 Kaleb Allen. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var GenreLabel: UILabel!
    @IBOutlet weak var DueDateLable: UILabel!
    @IBOutlet weak var RatingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
