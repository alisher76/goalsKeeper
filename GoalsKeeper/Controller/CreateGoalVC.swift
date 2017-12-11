//
//  CreateGoalVC.swift
//  GoalsKeeper
//
//  Created by Alisher Abdukarimov on 12/11/17.
//  Copyright © 2017 Alisher Abdukarimov. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    @IBOutlet weak var horizontalSpaceConstantForBackBtn: NSLayoutConstraint!
    @IBOutlet weak var horizontalSpaceConstantForGoalLabel: NSLayoutConstraint!
    
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var segmentControll: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   
    @IBAction func createBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismissDetail(self)
    }
    
    
}
