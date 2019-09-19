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

    var selectedAssessment = Assessment();
    var indexPathValue: Int!;
    
      // Define Delegate property
    var delegate1 : AssessmentViewDelegate?
    
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
     
       // print("\(assessmentDescription) \(assessmentMarks) \(assessmentDate) \(indexPathValue)")
        delegate1?.updateAssessment(Desc: assessmentDescription.text!, marks: Int(assessmentMarks.text!)!, dateVal: assessmentDate.date,position: indexPathValue!)
        
        // dismiss sigue
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
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
