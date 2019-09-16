//
//  StudentProfileViewController.swift
//  myclass
//
//  Created by Harpreet Singh on 16/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class StudentProfileViewController: UIViewController {
    
    var selectedStudent = Student() 
    
    // Mark: - UI Connections
    @IBOutlet weak var studentName: UILabel!
    
    @IBOutlet weak var studentImage: UIImageView!
    
    @IBOutlet weak var studentPhone: UILabel!
    @IBOutlet weak var studentEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateDatainView()

        // Do any additional setup after loading the view.
    }
    
    //Mark: - Populate Data
    private func populateDatainView(){
        
        self.studentName.text = "\(self.selectedStudent.getStudentName()) \(self.selectedStudent.getStudentLastName())"
        
        self.studentPhone.text = self.selectedStudent.getStudentPhone()
        
        self.studentEmail.text = self.selectedStudent.getStudentEmail()
        
        self.studentImage.image =   UIImage(named: self.selectedStudent.getStudentImage()) 
        
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
