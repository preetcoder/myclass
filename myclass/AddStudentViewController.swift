//
//  AddStudentViewController.swift
//  myclass
//
//  Created by Bhavesh Hingad on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

protocol NewStudentDataDelegate {
    func newStudentEnteredData (name : String, lastName : String, studentID : String, studentEmail : String, studentPhone : String)
}

class AddStudentViewController: UIViewController{
    
    var delegate : NewStudentDataDelegate?
    
    var allStudentsData =  [Student]()

    @IBOutlet weak var studentProfileImage: UIImageView!
    
    @IBOutlet weak var newStudentName: UITextField!
    @IBOutlet weak var newStudentID: UITextField!
    
    
    @IBOutlet weak var studentLastName: UITextField!
    
    @IBOutlet weak var newStudentEmail: UITextField!
    
    
    @IBOutlet weak var newStudentPhone: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("Hello \(allStudentsData[0].getStudentID())")

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSaveNewStudentClick(_ sender: Any) {
        
        //print(newStudentName.text!)
        // check if student ID already exists
        let results = allStudentsData.filter { $0.getStudentID() == newStudentID.text! }
        
        //print(results.isEmpty)
        
        if results.isEmpty == true {
            
            delegate?.newStudentEnteredData(name: newStudentName.text!, lastName: studentLastName.text!, studentID: newStudentID.text!, studentEmail: newStudentEmail.text!, studentPhone: newStudentPhone.text!)
            
           
            
            // dismiss sigue
            navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
            
            
        }
        
        else{
            
            // declare an alert
            let alertpopupVal = PopUpAlert()
            let alert =  alertpopupVal.popUp(titleMsg: "Error!!", popupMsg: "Student ID Already Exists!")
            self.present(alert, animated: true, completion: nil)

        }
        
        
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
