//
//  ExportViewController.swift
//  myclass
//
//  Created by Bhavesh Hingad on 15/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit
import MessageUI

class ExportViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
  
    @IBAction func exportAssessments(_ sender: Any) {
        
        mailerFunction(val : "assessments")
    }
    
    @IBAction func exportAttendance(_ sender: Any) {
        
        mailerFunction(val : "attendance")
        
       
    }
    
    func mailerFunction(val : String){
        let mailComposeViewController = configureMailComposer(val: val)
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion: nil)
        }else{
            print("Can't send email")
        }
    }
    
    func getAllStudentAttendance(val : String) -> String{
        
        var allStudentData = ""
        
        print(val)
        
        if(val == "attendance") {
            
            let obj = ConvertToDate()
            let  allStudents = ImportData.allStudent
            
            for student in allStudents{
                
                
                // get all attendance of this student
                if((student.getAttendance()?.count)! > 0){
                    allStudentData += "Student ID - \(student.getStudentID()) \n Dates Attended - "
                    for attendance in student.getAttendance()! {
                        if attendance.getStatus() == true {
                            
                            allStudentData += " \(obj.getStringFromDate(dateVal: attendance.getDate())),"
                        }
                    }
                    
                }
                allStudentData += "\n"
            }
            
        }
        else{
            
            let obj = ConvertToDate()
            let  allStudents = ImportData.allStudent
            
            for student in allStudents{
                
                if (student.getMarks()?.count)! > 0 {
                    allStudentData += "Student ID - \(student.getStudentID())  "
                    
                    
                    for assessmentMarks in student.getMarks()! {
                        
                         allStudentData += "\n Assessment Name - \(assessmentMarks.getAssessment().getAssessmentTitle()) \n Marks Obtained = \(assessmentMarks.getObtainedMarks())"
                        
                    }
                    
                    allStudentData += "\n ================ \n"
                    
                
                    
                    
                }
                
            }
        }
       
        
        return allStudentData
        
    }
    
    func configureMailComposer(val : String) -> MFMailComposeViewController{
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(["s3701661@student.rmit.edu.au","s3695018@student.rmit.ed.au"])
        mailComposeVC.setSubject("File Export")
        mailComposeVC.setMessageBody(getAllStudentAttendance(val: val), isHTML: false)
        return mailComposeVC
    }
    
    //MARK: - MFMail compose method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
   
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       
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
