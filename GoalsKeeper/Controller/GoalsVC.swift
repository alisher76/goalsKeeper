//
//  GoalsVC.swift
//  GoalsKeeper
//
//  Created by Alisher Abdukarimov on 12/10/17.
//  Copyright © 2017 Alisher Abdukarimov. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    @IBOutlet weak var welcomeMessageLabel2: UILabel!
    
    var goalsArray: [Goal] = [] {
        didSet {
            print(goalsArray.count)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        tableView.reloadData()
    }

    @IBAction func addGoalTapped(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "createVC") as? CreateGoalVC else { return }
        presentDetail(createGoalVC)
    }
    
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell() }
        let goal = goalsArray[indexPath.row]
        cell.configureCell(description: String(describing: goal.goalDescription!), type:  goal.goalType!, goalProgressAmount: Int(goal.goalProgress))
        return cell
    }
    
    // to be able to edit tableview
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        
        let addProgress = UITableViewRowAction(style: .destructive, title: "ADD POINT") { (rowAction, indexPath) in
            
        }
        
        addProgress.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        return [deleteAction]
    }
    
    func fetchCoreDataObjects() {
        fetchGoalData { (success) in
            if success {
                self.tableView.isHidden = false
            } else {
                self.tableView.isHidden = true
            }
        }
    }
}

extension GoalsVC {
    
    func fetchGoalData(completion: (_ success: Bool) -> ()) {
        // In order to get managed object context, we create fetch request
        guard let managedContext = appdelegate?.persistentContainer.viewContext else { return }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        do {
            goalsArray = try managedContext.fetch(fetchRequest) as! [Goal]
            print("Successfully Fetched Data")
            completion(true)
        } catch {
            debugPrint(error.localizedDescription)
            completion(false)
        }
    }
    
    func removeGoal(atIndexPath indexPath: IndexPath) {
        guard let managedContext = appdelegate?.persistentContainer
            .viewContext else { return }
        managedContext.delete(goalsArray[indexPath.row])
        do {
            try managedContext.save()
            print("Successfully removed from managed context")
        } catch {
            print("Could not remove: \(error.localizedDescription)")
        }
    }
    
}
