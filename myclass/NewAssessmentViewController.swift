//
//  NewAssessmentViewController.swift
//  myclass
//
//  Created by Bhavesh Hingad on 15/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

protocol NewAssessmentDataDelegate {
    func userEnteredData (Desc : String, marks : String, dateVal : Date)
}

class NewAssessmentViewController: UIViewController,UITextFieldDelegate {
    
    // Define Delegate property
    
    var delegate : NewAssessmentDataDelegate?
    
    @IBOutlet weak var assessmentDesc: UITextField!
    
    @IBOutlet weak var assessmentMarks: UITextField!
    
    @IBOutlet weak var assessmentDate: UIDatePicker!
    var activeField: UITextField?
    var lastOffset: CGPoint!
    var keyboardHeight: CGFloat!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.assessmentMarks.keyboardType = UIKeyboardType.numberPad
        let userTappedOtherThanKeyboard: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(("closeKeyboard")))
        view.addGestureRecognizer(userTappedOtherThanKeyboard)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func newAssessmentSave(_ sender: Any) {
        
        delegate?.userEnteredData(Desc: assessmentDesc.text!, marks: assessmentMarks.text!, dateVal: assessmentDate.date)
        
        // dismiss sigue
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
