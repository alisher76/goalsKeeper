//
//  FinishGoalVC.swift
//  GoalsKeeper
//
//  Created by Alisher Abdukarimov on 12/11/17.
//  Copyright © 2017 Alisher Abdukarimov. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBtn.bindKeyboard()
        createBtn.layer.cornerRadius = 5
        pointsTextField.delegate = self
    }
    
    @IBAction func createBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismissDetail(self)
    }
    
    func initData(description: String, type: GoalType) {
        self.goalType = type
        self.goalDescription = description
        print(self.goalDescription)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
      textField.text = ""
    }
}
