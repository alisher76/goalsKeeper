//
//  CreateGoalVC.swift
//  GoalsKeeper
//
//  Created by Alisher Abdukarimov on 12/11/17.
//  Copyright © 2017 Alisher Abdukarimov. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var horizontalSpaceConstantForBackBtn: NSLayoutConstraint!
    @IBOutlet weak var horizontalSpaceConstantForGoalLabel: NSLayoutConstraint!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var segmentControll: UISegmentedControl!
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindKeyboard()
        textView.delegate = self
        nextBtn.layer.cornerRadius = 5.0
    }

    @IBAction func segmentChanged(_ sender: Any) {
        if segmentControll.selectedSegmentIndex == 1 {
            goalType = .longTerm
        } else {
            goalType = .shortTerm
        }
    }
    
    @IBAction func nextBtnTapped(_ sender: Any) {
        if textView.text != "What is the goal 😊?" && textView.text != "" {
            guard let pointsVC = storyboard?.instantiateViewController(withIdentifier: "pointsVC") as? FinishGoalVC else { return }
            pointsVC.initData(description: self.textView.text, type: self.goalType)
            self.presentDetail(pointsVC)
        }
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismissDetail(self)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
