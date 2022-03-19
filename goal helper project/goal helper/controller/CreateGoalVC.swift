//
//  CreateGoalVC.swift
//  goal helper
//
//  Created by mohamed zead on 2/28/18.
//  Copyright © 2018 zead. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController ,UITextViewDelegate{
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var longTerm: UIButton!
    @IBOutlet weak var shortTerm: UIButton!
    @IBOutlet weak var goalText: UITextView!
    var goalType : GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shortTerm.layer.cornerRadius = 20
        longTerm.layer.cornerRadius = 20
        goalText.delegate = self
        nextBtn.bindToKeyboard()
        longTerm.setSelectedColor()
        
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalText.text = ""
        goalText.textColor = UIColor.black
    }
    
    
    @IBAction func longTermPressed(_ sender: Any) {
        goalType = .longTerm
        longTerm.setSelectedColor()
        shortTerm.setDeselectedColor()
    }
    
    @IBAction func shortTermPressesd(_ sender: Any) {
        goalType = .shortTerm
        shortTerm.setSelectedColor()
        longTerm.setDeselectedColor()
    }
    @IBAction func nextBtnPressed(_ sender: Any) {
        guard let finishGoalVc = storyboard?.instantiateViewController(withIdentifier: "finishGVC") as? finishGoalVC else { return }
        if goalText.text != "" && goalText.text != "what is your goal ? "{
            finishGoalVc.initData(description:self.goalText.text, goalType: goalType)
            self.presentingViewController?.presentSecondaryDetail(finishGoalVc)
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismissVC()
    }
    
    
    
}
