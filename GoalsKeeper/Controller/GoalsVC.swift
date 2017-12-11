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
        
        fetchGoalData { (success) in
            if success {
                print("gotGoals")
                self.tableView.reloadData()
                self.tableView.isHidden = false
            } else {
                self.tableView.isHidden = true
            }
        }
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
        if goalsArray.count != 0 {
            return goalsArray.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell() }
        cell.configureCell(description: String(describing: goalsArray[indexPath.row].goalDescription!), type:  goalsArray[indexPath.row].goalType!, goalProgressAmount: Int(goalsArray[indexPath.row].goalProgress))
        return cell
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
    
}
