//
//  StudentProfileViewController.swift
//  myclass
//
//  Created by Harpreet Singh on 16/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class StudentProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate
{
    
    var selectedStudent = Student() 
    
    @IBOutlet weak var studentImage: UIImageView!
    
    @IBOutlet weak var studName: UITextField!
    @IBOutlet weak var studID: UITextField!
    @IBOutlet weak var studEmail: UITextField!
    @IBOutlet weak var studPhone: UITextField!
    
    @IBOutlet weak var studLastName: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var StudentHeader: UINavigationItem!
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    var activeField: UITextField?
    var lastOffset: CGPoint!
    var keyboardHeight: CGFloat!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.mainScrollView.contentSize =  CGSize(width: view.frame.width, height: view.frame.height);
        
        self.studName.delegate = self
        self.studID.delegate = self
        self.studPhone.delegate = self
        self.studEmail.delegate = self
        self.studLastName.delegate = self
        
        // setup keyboard event
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
                                               
        
        self.studName.isUserInteractionEnabled = false;
        self.studID.isUserInteractionEnabled = false;
        self.studEmail.isUserInteractionEnabled = false;
        self.studPhone.isUserInteractionEnabled = false;
        
        self.studLastName.isUserInteractionEnabled = false;
        self.studName.text = self.selectedStudent.getStudentName()
        self.studID.text = self.selectedStudent.getStudentID()
        self.studEmail.text = self.selectedStudent.getStudentEmail()
        self.studPhone.text = self.selectedStudent.getStudentPhone()
        self.studLastName.text = self.selectedStudent.getStudentLastName()
        
        // image
        if self.selectedStudent.getStudentImage() == "download" {
            self.studentImage.image = UIImage(named: self.selectedStudent.getStudentImage())
        }
        else{
            
            self.studentImage.image =  FileSaving.getImage(imageName: selectedStudent.getStudentImage())
        }
        
        self.title = self.selectedStudent.getStudentName()
        
        self.saveButton.isHidden = true
        //self.studentName.text = self.selectedStudent.getStudentName()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    @IBAction func onClickEdit(_ sender: Any) {
        
        //enable text  fields
        self.studName.isUserInteractionEnabled = true;
       // self.studID.isUserInteractionEnabled = true;
        self.studID.backgroundColor = .gray
        self.studEmail.isUserInteractionEnabled = true;
        self.studPhone.isUserInteractionEnabled = true;
        
        self.studLastName.isUserInteractionEnabled = true;
        
        self.studName.becomeFirstResponder()
        self.saveButton.isHidden = false
        
        // make image clickable on edit
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedMe))
        studentImage.addGestureRecognizer(tap)
        studentImage.isUserInteractionEnabled = true
        
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
            studentImage.image = image
         
        }
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onClickSave(_ sender: Any) {
        if studEmail.text! != "" && studName.text! != "" && studLastName.text! != "" && studPhone.text! != "" && studID.text! != ""{
            
            selectedStudent.setStudentEmail(email: self.studEmail.text!)
            selectedStudent.setStudentPhone(phone: studPhone.text!)
            selectedStudent.setStudentFirstName(name: studName.text!)
            selectedStudent.setStudentLastName(lastname: studLastName.text!)
            
            // set image
            if  let imageVal = studentImage.image {
                
                let selectedImagefromCamera = FileSaving.saveImage(image: imageVal)
                
                selectedStudent.setStudentImage(image: selectedImagefromCamera)
                
               
            }
            else{
                
                selectedStudent.setStudentImage(image: "download")
                
            }
            
            self.studID.backgroundColor = nil
        
        
            self.studName.isUserInteractionEnabled = false;
            self.studID.isUserInteractionEnabled = false;
            self.studEmail.isUserInteractionEnabled = false;
            self.studPhone.isUserInteractionEnabled = false;
            
            self.studLastName.isUserInteractionEnabled = false;
            
            studentImage.isUserInteractionEnabled = false
            
            self.saveButton.isHidden = true
        
        }
        else{
            
            let alertpopupVal = PopUpAlert()
            let alert =  alertpopupVal.popUp(titleMsg: "Error!!", popupMsg: "One or more fields are empty!")
            self.present(alert, animated: true, completion: nil)
        }
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
        
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

// MARK: Keyboard Handling
extension StudentProfileViewController {
    @objc func keyboardWillShow(notification:NSNotification){
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.mainScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        mainScrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        mainScrollView.contentInset = contentInset
    }
}

