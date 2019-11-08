//
//  AddStudentViewController.swift
//  myclass
//
//  Created by Bhavesh Hingad on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit


protocol NewStudentDataDelegate {
    func newStudentEnteredData (name : String, lastName : String, studentID : String, studentEmail : String, studentPhone : String, studentImage : String)
}

class AddStudentViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate{
    
    var delegate : NewStudentDataDelegate?
    var activeField: UITextField?
    var lastOffset: CGPoint!
    var keyboardHeight: CGFloat!
    var studentmanager = StudentManager()
    var allStudentsData =  [Student]()

    @IBOutlet weak var studentProfileImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var newStudentName: UITextField!
    @IBOutlet weak var newStudentID: UITextField!
    
    
    @IBOutlet weak var studentLastName: UITextField!
    
    @IBOutlet weak var newStudentEmail: UITextField!
    
    
    @IBOutlet weak var newStudentPhone: UITextField!
    
    // Constraints
    @IBOutlet weak var constraintContentHeight: NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedMe))
        studentProfileImage.addGestureRecognizer(tap)
        studentProfileImage.isUserInteractionEnabled = true
        self.newStudentPhone.keyboardType = UIKeyboardType.numberPad
       
        let userTappedOtherThanKeyboard: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(("closeKeyboard")))
        
        view.addGestureRecognizer(userTappedOtherThanKeyboard)
        
        //set TextField Delegate
        self.newStudentName.delegate = self
        self.newStudentID.delegate = self
        self.newStudentPhone.delegate = self
        self.newStudentEmail.delegate = self
        self.studentLastName.delegate = self
        
        // setup keyboard event
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
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
        
        else{
            // error if no camera support
            let alertpopupVal = PopUpAlert()
            let alert =  alertpopupVal.popUp(titleMsg: "Error!!", popupMsg: "Your device doesn't support camera!!")
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            studentProfileImage.image = image
            
           
        }
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func onSaveNewStudentClick(_ sender: Any) {
        
        // check if student ID already exists
        
        allStudentsData = studentmanager.getStudentsfromDB()
        
        let results = allStudentsData.filter { $0.getStudentID == newStudentID.text! }
        
        //print(results.isEmpty)
        
        if results.isEmpty == true {
            
            // save image
//            let filesave = FileSaving()
//            FileSaving.saveImage(image: studentProfileImage.image!)
//
            //print("image = \(studentProfileImage.image)")
            
            if let imageVal = studentProfileImage.image {
                
                
                let selectedImagefromCamera = FileSaving.saveImage(image: studentProfileImage.image!)
                //print("hello\(pp)")
                
                delegate?.newStudentEnteredData(name: newStudentName.text!, lastName: studentLastName.text!, studentID: newStudentID.text!, studentEmail: newStudentEmail.text!, studentPhone: newStudentPhone.text!, studentImage: selectedImagefromCamera)
            }
            else{
                
                delegate?.newStudentEnteredData(name: newStudentName.text!, lastName: studentLastName.text!, studentID: newStudentID.text!, studentEmail: newStudentEmail.text!, studentPhone: newStudentPhone.text!, studentImage: "download")
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
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: UITextFieldDelegate
    
    
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
extension AddStudentViewController {
    @objc func keyboardWillShow(notification:NSNotification){
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}
