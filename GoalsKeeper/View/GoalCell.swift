//
//  GoalCell.swift
//  GoalsKeeper
//
//  Created by Alisher Abdukarimov on 12/11/17.
//  Copyright © 2017 Alisher Abdukarimov. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalNumberLabel: UILabel!
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var completedView: GradientView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(goal: Goal) {
        self.goalDescriptionLabel.text = goal.goalDescription!
        self.goalTypeLabel.text = goal.goalType!
        self.goalNumberLabel.text = String(describing: goal.goalProgress)
        
        if goal.goalCompletionValue == goal.goalProgress {
            self.completedView.isHidden = false
        } else {
            self.completedView.isHidden = true
        }
    }
}
