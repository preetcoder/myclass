//
//  AssessmentProfileViewController.swift
//  myclass
//
//  Created by Bhavesh Hingad on 17/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit
protocol AssessmentViewDelegate {
    func updateAssessment (Desc : String, marks : Int, dateVal : Date, position: Int)
}

class AssessmentProfileViewController: UIViewController
{

    var selectedAssessmentProfile = Assessment();
    var indexPathValue: Int!;
    
      // Define Delegate property
    var delegate : AssessmentViewDelegate?
    
    @IBOutlet weak var assessmentDescription: UITextField!
    @IBOutlet weak var assessmentMarks: UITextField!
    @IBOutlet weak var assessmentDate: UIDatePicker!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func onClickEdit(_ sender: Any)
    {
    assessmentDescription.isUserInteractionEnabled = true;
        assessmentMarks.isUserInteractionEnabled = true;
        assessmentDate.isUserInteractionEnabled = true;
        self.saveButton.isHidden = false
    }
    
    @IBAction func onClickSave(_ sender: Any)
    {
     
        if Int(assessmentMarks.text!) != nil{
            selectedAssessmentProfile.setAssessmentTitle(assessmentName: self.assessmentDescription.text!)
            selectedAssessmentProfile.setAssessmentMarks(assessmentTotalMarks: Int(self.assessmentMarks.text!)!)
            selectedAssessmentProfile.setAssessmentDate(date: self.assessmentDate.date)
            
            //print("HELLO \(selectedAssessmentProfile.getAssessmentTitle())")
            self.delegate?.updateAssessment(Desc: selectedAssessmentProfile.getAssessmentTitle(), marks: Int(assessmentMarks.text!)!, dateVal: assessmentDate.date,position: indexPathValue!)
            //self.delegate?.updateAssessment(Desc: "sds", marks: 32, dateVal: assessmentDate.date, position: indexPathValue!)
            
            // dismiss sigue
            navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
            
            
        } else{
            // declare an alert
            let alertpopupVal = PopUpAlert()
            let alert =  alertpopupVal.popUp(titleMsg: "Error!!", popupMsg: "Marks must be integer")
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        assessmentDescription.isUserInteractionEnabled = false;
        assessmentMarks.isUserInteractionEnabled = false;
        assessmentDate.isUserInteractionEnabled = false;
        assessmentDescription.text = self.selectedAssessmentProfile.getAssessmentTitle()
        assessmentMarks.text = String(self.selectedAssessmentProfile.getAssessmentMarks())
        assessmentDate.date = self.selectedAssessmentProfile.getAssessmentDate()
        
        self.title = self.selectedAssessmentProfile.getAssessmentTitle();
        
        self.saveButton.isHidden = true;
        // Do any additional setup after loading the view.
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
