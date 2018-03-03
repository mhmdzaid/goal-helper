//
//  GoalsVC.swift
//  goal helper
//
//  Created by mohamed zead on 2/28/18.
//  Copyright © 2018 zead. All rights reserved.
//

import UIKit
import CoreData
let appDelegate  = UIApplication.shared.delegate as? AppDelegate
class GoalsVC: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    var goals : [Goal] = []
    @IBAction func addGoalPressed(_ sender: Any) {
        
        guard let CreateGoalVc = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {return}
        
        self.presentVC(CreateGoalVc)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        
    }
    
    
    func fetchCoreData(){
        
        self.fetch { (complete) in
            if complete{
                if goals.count >= 1 {
                    tableView.isHidden = false
                }else{
                    tableView.isHidden = true
                }
                
            }
            
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
    print("table is here ")
        super.viewWillAppear(animated)
        self.fetchCoreData()
        tableView.reloadData()
    }
    

}

extension GoalsVC : UITableViewDelegate ,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell else{
            return UITableViewCell()
        }
        let goal = goals[indexPath.row]
        cell.configureCell(description:GoalType(rawValue:goal.goalType!)!, goal:goal.goalDiscription!, progress: Int(goal.goalCompletionValue))
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = #colorLiteral(red: 0.9393044099, green: 0.9317515005, blue: 0.9066636459, alpha: 1)
        }
        else{
            
            cell.backgroundColor = #colorLiteral(red: 0.7824045914, green: 0.9593313769, blue: 0.7945410138, alpha: 1)
        }
        cell.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        cell.layer.borderWidth = 2
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (row, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreData()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return [deleteAction]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 ;
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension GoalsVC{
    
    func fetch(completion:(_ complete :Bool)->()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{return }

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        do{
            goals =  try managedContext.fetch(fetchRequest) as! [Goal]
            completion(true)
            
        }catch{
            debugPrint("Couldn't fetch Data \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
    func removeGoal(atIndexPath indexPath : IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{return }
        managedContext.delete(goals[indexPath.row])
        do{
            try managedContext.save()
            
        }catch{
            debugPrint("failed to remove goal ")
            
        }
        
        
    }
    
}

