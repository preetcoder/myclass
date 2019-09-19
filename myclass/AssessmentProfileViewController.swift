//
//  AssessmentProfileViewController.swift
//  myclass
//
//  Created by Bhavesh Hingad on 17/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class AssessmentProfileViewController: UIViewController
{
    
    var selectedAssessment = Assessment();
    var indexPathValue: Int!;
    
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
        
        self.selectedAssessment.setAssessmentTitle(assessmentName: self.assessmentDescription.text!)
        self.selectedAssessment.setAssessmentMarks(assessmentTotalMarks: Int(self.assessmentMarks.text!)!)
        
        self.selectedAssessment.setAssessmentDate(date: self.assessmentDate.date)
        
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        assessmentDescription.isUserInteractionEnabled = false;
        assessmentMarks.isUserInteractionEnabled = false;
        assessmentDate.isUserInteractionEnabled = false;
        assessmentDescription.text = self.selectedAssessment.getAssessmentTitle()
        assessmentMarks.text = String(self.selectedAssessment.getAssessmentMarks())
        assessmentDate.date = self.selectedAssessment.getAssessmentDate()
        
        self.title = self.selectedAssessment.getAssessmentTitle();
        
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
