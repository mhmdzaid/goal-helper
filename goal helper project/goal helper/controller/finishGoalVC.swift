//
//  finishGoalVC.swift
//  goal helper
//
//  Created by mohamed zead on 3/3/18.
//  Copyright © 2018 zead. All rights reserved.
//

import UIKit
import CoreData
class finishGoalVC: UIViewController {
    
    @IBOutlet weak var creatGoalBtn: UIButton!
    @IBOutlet weak var pointsLbl: UITextField!
    var goalDiscription : String!
    var goalType : GoalType!
    
    func initData(description:String,goalType : GoalType)
    {
        self.goalType = goalType
        self.goalDiscription = description
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatGoalBtn.bindToKeyboard()
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissVC()
    }
    @IBAction func createGoalPressed(_ sender: Any) {
        if pointsLbl.text != ""{
            self.save { (complete) in
                if complete{
                    self.dismiss(animated: true, completion: nil)
                }
            }}
    }
    
    
    
    func save (completion:(_ finished : Bool)->())
    {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{return }
        let goal = Goal(context: managedContext)
        goal.goalDiscription = self.goalDiscription
        goal.goalType = self.goalType.rawValue
        goal.goalCompletionValue = Int32(pointsLbl.text!)!
        goal.progress = Int32(0)
        do {
            try managedContext.save()
            print("comoleted successsfully ")
            completion(true)
        }
        catch{
            
            completion(false)
            debugPrint("could nott save \(error.localizedDescription)")
        }
        
    }
}
