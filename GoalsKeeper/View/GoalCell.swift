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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(description: String, type: String, goalProgressAmount: Int) {
        
        self.goalDescriptionLabel.text = description
        self.goalTypeLabel.text = type
        self.goalNumberLabel.text = String(describing: goalProgressAmount)
    }
}
