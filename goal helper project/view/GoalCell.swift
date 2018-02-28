//
//  goalCell.swift
//  goal helper
//
//  Created by mohamed zead on 2/28/18.
//  Copyright © 2018 zead. All rights reserved.
//

import UIKit
class GoalCell : UITableViewCell {
    
    @IBOutlet weak var goalLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var goalProgressLapel: UILabel!
    func configureCell(description :GoalType ,goal : String ,progress : Int ){
        self.goalLabel.text = goal
        self.descriptionLabel.text = description.rawValue
        self.goalProgressLapel.text = String (progress)

    }
}
