//
//  NewAssessmentViewController.swift
//  myclass
//
//  Created by Bhavesh Hingad on 15/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

protocol NewAssessmentDataDelegate {
    func userEnteredData (Desc : String, marks : String, dateVal : Date)
}

class NewAssessmentViewController: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate {
    
    // Define Delegate property
    
    var delegate : NewAssessmentDataDelegate?
    
    @IBOutlet weak var assessmentDesc: UITextField!
    
    @IBOutlet weak var assessmentMarks: UITextField!
    
    @IBOutlet weak var assessmentDate: UIDatePicker!
    var activeField: UITextField?
    var lastOffset: CGPoint!
    var keyboardHeight: CGFloat!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.assessmentMarks.keyboardType = UIKeyboardType.numberPad
        let userTappedOtherThanKeyboard: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(("closeKeyboard")))
        view.addGestureRecognizer(userTappedOtherThanKeyboard)
        // Do any additional setup after loading the view.
        
        // setup keyboard event
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func newAssessmentSave(_ sender: Any) {
        
        if Int(assessmentMarks.text!) != nil {
            
            delegate?.userEnteredData(Desc: assessmentDesc.text!, marks: assessmentMarks.text!, dateVal: assessmentDate.date)
            
            // dismiss sigue
            navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
            
        }else{
            // declare an alert
            let alertpopupVal = PopUpAlert()
            let alert =  alertpopupVal.popUp(titleMsg: "Error!!", popupMsg: "Marks must be integer")
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
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
extension NewAssessmentViewController {
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

