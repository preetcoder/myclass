//
//  StudentProfileViewController.swift
//  myclass
//
//  Created by Harpreet Singh on 16/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class StudentProfileViewController: UIViewController
{
    
    var selectedStudent = Student() 
    
   
    @IBOutlet weak var studentName: UILabel!
    
    @IBOutlet weak var studName: UITextField!
    @IBOutlet weak var studID: UITextField!
    @IBOutlet weak var studEmail: UITextField!
    @IBOutlet weak var studPhone: UITextField!
    
    @IBOutlet weak var StudentHeader: UINavigationItem!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.studName.isUserInteractionEnabled = false;
        self.studID.isUserInteractionEnabled = false;
        self.studEmail.isUserInteractionEnabled = false;
        self.studPhone.isUserInteractionEnabled = false;
        self.studName.text = self.selectedStudent.getStudentName()
        self.studID.text = self.selectedStudent.getStudentID()
        self.studEmail.text = self.selectedStudent.getStudentEmail()
        self.studPhone.text = self.selectedStudent.getStudentPhone()
        self.title = self.selectedStudent.getStudentName()
        //self.studentName.text = self.selectedStudent.getStudentName()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickEdit(_ sender: Any) {
    }
    
    @IBAction func onClickSave(_ sender: Any) {
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
