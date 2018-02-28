//
//  CreateGoalVC.swift
//  goal helper
//
//  Created by mohamed zead on 2/28/18.
//  Copyright © 2018 zead. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController ,UITextViewDelegate{

    @IBOutlet weak var longTerm: UIButton!
    @IBOutlet weak var shortTerm: UIButton!
    @IBOutlet weak var goalText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        shortTerm.layer.cornerRadius = 20
        longTerm.layer.cornerRadius = 20
        goalText.delegate = self
        
    }
   
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalText.text = ""
        goalText.textColor = UIColor.black
    }
    
    
    @IBAction func longTermPressed(_ sender: Any) {
    }
    
    @IBAction func shortTermPressesd(_ sender: Any) {
    }
    @IBAction func nextBtnPressed(_ sender: Any) {
        self.dismissVC()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismissVC()
    }
    


}
