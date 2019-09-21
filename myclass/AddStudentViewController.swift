//
//  AddStudentViewController.swift
//  myclass
//
//  Created by Bhavesh Hingad on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

protocol NewStudentDataDelegate {
    func newStudentEnteredData (name : String, lastName : String, studentID : String, studentEmail : String, studentPhone : String, studentImage : UIImage)
}

class AddStudentViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedMe))
        studentProfileImage.addGestureRecognizer(tap)
        studentProfileImage.isUserInteractionEnabled = true
        
        //print("Hello \(allStudentsData[0].getStudentID())")

        // Do any additional setup after loading the view.
    }
    
    @objc func tappedMe()
    {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker,animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            studentProfileImage.image = image
           
        }
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func onSaveNewStudentClick(_ sender: Any) {
        
        //print(newStudentName.text!)
        // check if student ID already exists
        let results = allStudentsData.filter { $0.getStudentID() == newStudentID.text! }
        
        //print(results.isEmpty)
        
        if results.isEmpty == true {
            
            // save image
            //let filesave = FileSaving()
           // FileSaving.saveImage(image: studentProfileImage.image!)
            
            if let imageVal = studentProfileImage.image {
                delegate?.newStudentEnteredData(name: newStudentName.text!, lastName: studentLastName.text!, studentID: newStudentID.text!, studentEmail: newStudentEmail.text!, studentPhone: newStudentPhone.text!, studentImage: studentProfileImage.image!)
            }
            else{
                
                delegate?.newStudentEnteredData(name: newStudentName.text!, lastName: studentLastName.text!, studentID: newStudentID.text!, studentEmail: newStudentEmail.text!, studentPhone: newStudentPhone.text!, studentImage: UIImage(named: "download")!)
            }
            
            
            
           
            
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
