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
    
    @IBOutlet weak var completionView: UIView!
    
    @IBOutlet weak var goalProgressLapel: UILabel!
    func configureCell(goal : Goal ){
        self.goalLabel.text = goal.goalDiscription
        self.descriptionLabel.text = goal.goalType
        self.goalProgressLapel.text = String(goal.progress)
        if goal.progress == goal.goalCompletionValue {
            self.completionView.isHidden = false
        }else{
         self.completionView.isHidden = true
        }
        
    }
}
