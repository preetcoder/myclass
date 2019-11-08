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
    
     var loadStudents = RestAPI()
    
    var studentmanager = StudentManager()
    
    var attendancemanager = AttendanceManager()
    
    var markmanager = MarkManager()
  
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
    
    // method with string parameter of attendance or assessment to export
    func getAllStudentAttendance(val : String) -> String{
        
        var allStudentData = ""
        
        if(val == "attendance") {
            
            let obj = ConvertToDate()
            
            
            let  allStudents = studentmanager.getStudentsfromDB()
            
            for student in allStudents{
                
                let studentAttendancefromDB = attendancemanager.getAttendanceRecords(StudObj: student, lastVal: false)
                
                // get all attendance of this student
                if(((student.attendances?.count)!) > 0){
                    // get attendance of this student
                    allStudentData += "Student ID - \(student.getStudentID) \n Dates Attended - "
                    
                    for attendance in studentAttendancefromDB {
                        //print(attendance)
                        if attendance.getStatus == true {

                            allStudentData += " \(obj.getStringFromDate(dateVal: attendance.getDate)),"
                        }
                    }

                }
                allStudentData += "\n"
            }
            
        }
        else{
            
            //let obj = ConvertToDate()
            let  allStudents = studentmanager.getStudentsfromDB()
            
            for student in allStudents{
                
                
                if ((student.marks?.count)!) > 0 {
                    allStudentData += "Student ID - \(student.getStudentID)"
                    
                    
                    for case let assessmentMarks as Mark in student.marks! {
                        
                        // get assessment details from Mark entity object
                         allStudentData += "\n Assessment Name - \(assessmentMarks.getAssessment.getAssessmentTitle) \n Marks Obtained = \(assessmentMarks.getObtainedMarks)"
                      
                       


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
       
        // set mail parameters
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
        
    }
    
}
