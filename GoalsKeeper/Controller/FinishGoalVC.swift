//
//  FinishGoalVC.swift
//  GoalsKeeper
//
//  Created by Alisher Abdukarimov on 12/11/17.
//  Copyright © 2017 Alisher Abdukarimov. All rights reserved.
//

import UIKit
import CoreData

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
    
    
    // Mark: Saving to Core Data
    func save(completion: (_ finished: Bool) -> ()) {
        // managed object context from main que
        guard let managedContext = appdelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        do {
            
            // save - Attempts to commit unsaved changes to registered objects to the context’s parent store.
            try managedContext.save()
            completion(true)
        } catch {
            debugPrint("could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    @IBAction func createBtnTapped(_ sender: Any) {
        if pointsTextField.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
}
