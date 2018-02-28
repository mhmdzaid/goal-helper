//
//  GoalsVC.swift
//  goal helper
//
//  Created by mohamed zead on 2/28/18.
//  Copyright © 2018 zead. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
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
    

}

extension GoalsVC : UITableViewDelegate ,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell else{
            return UITableViewCell()
        }
        cell.configureCell(description: .shortTerm, goal: "playing basket ball", progress: 4)
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = #colorLiteral(red: 0.9393044099, green: 0.9317515005, blue: 0.9066636459, alpha: 1)
        }
        else{
            
            cell.backgroundColor = #colorLiteral(red: 0.7824045914, green: 0.9593313769, blue: 0.7945410138, alpha: 1)
        }
        cell.layer.borderColor = #colorLiteral(red: 0.4274509804, green: 0.737254902, blue: 0.3882352941, alpha: 1)
        cell.layer.borderWidth = 1.5
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 ;
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

