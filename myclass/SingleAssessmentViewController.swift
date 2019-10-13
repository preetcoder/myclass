//
//  SingleAssessmentViewController.swift
//  myclass
//
//  Created by Harpreet Singh on 21/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit
protocol AssessmentUpdateDelegate {
    func updateAssessmentDetails (Title : String, Totalmarks : Int, AssessmentDate : Date, IndexValue: Int)
}
class SingleAssessmentViewController: UIViewController, AssessmentViewDelegate,UITableViewDelegate, UITableViewDataSource,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate
{
 
    var pickerData: [Int] = [Int]()
    let allStudentsData = ImportData.allStudent
    
    var selectedAssessment = Assessment();
    var indexPathValue: Int!;

     //Define Delegate property
    var updateDelegate : AssessmentUpdateDelegate?
    
    @IBOutlet weak var studentMarksTable: UITableView!
    @IBOutlet weak var assessmentTitle: UILabel!
    
    override func viewDidLoad()
    {
        self.assessmentTitle.text = selectedAssessment.getAssessmentTitle()
        
        self.title = self.selectedAssessment.getAssessmentTitle()
        super.viewDidLoad()
        pickerData.removeAll()
        for i in 1...self.selectedAssessment.getAssessmentMarks()
        {
            pickerData.append(i)
        }
        //print(pickerData.count)
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allStudentsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cellIdentifier = "AssessmentDetailsTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AssessmentDetailsTableViewCell else {
            fatalError("The dequeued cell is not an instance of AssessmentDetailsTableViewCell.")
        }
        

        //print(indexPath.count)
        
        let student = allStudentsData[indexPath.row]
        
        //cell.studentID.text = student.getStudentID()
        cell.studentID.text = student.getStudentName()
        cell.studentMarks.delegate = self
        cell.studentMarks.dataSource = self
        cell.studentMarks.tag = indexPath.row
        
        if allStudentsData[indexPath.row].getMarks()!.count != 0
        {
            for marksObject in allStudentsData[indexPath.row].getMarks()!.indices
            {
                if(allStudentsData[indexPath.row].getMarks()![marksObject].getAssessment().getAssessmentID() == selectedAssessment.getAssessmentID())
                {
                    print(allStudentsData[indexPath.row].getMarks()![marksObject].getObtainedMarks())
                    cell.studentMarks.selectRow(allStudentsData[indexPath.row].getMarks()![marksObject].getObtainedMarks()-1, inComponent: 0, animated: true)
                }
            }
        }
        return cell
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let buttonRow = pickerView.tag
        
        if allStudentsData[buttonRow].getMarks()!.count != 0
        {
            //get existing no. of objects in Marks array
            let Count = allStudentsData[buttonRow].getMarks()!.count
            
            //check if assessment record alraddy exists for that particular student and assessment
            var newMarks = true
            for marksObject in allStudentsData[buttonRow].getMarks()!.indices
            {
                if(allStudentsData[buttonRow].getMarks()![marksObject].getAssessment().getAssessmentID() == selectedAssessment.getAssessmentID())
                {
                    newMarks = false
                    allStudentsData[buttonRow].updateMarks(position: marksObject, score: row+1)
                }
            }
            
            if(newMarks)
            {
                let newAssessmentScore = Marks(marksID: Count, assessmentObj: selectedAssessment, marksObtained: row+1)
                allStudentsData[buttonRow].addMarks(scores: newAssessmentScore)
            }
        }
        else
        {
           let count = 0
           let newAssessmentScore = Marks(marksID: count, assessmentObj: selectedAssessment, marksObtained: row+1)
            allStudentsData[buttonRow].addMarks(scores: newAssessmentScore)
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if segue.identifier == "showAssessmentProfile"
        {
            let destinationVC = segue.destination as! AssessmentProfileViewController
            destinationVC.selectedAssessmentProfile = self.selectedAssessment
            destinationVC.indexPathValue = self.indexPathValue
            destinationVC.delegate = self
        }
        }
    
    @IBAction func onClickShowAssessment(_ sender: Any)
    {
        performSegue(withIdentifier: "showAssessmentProfile", sender: self)
    }
    
    
    //Delegated Method for Updating Assessment
    func updateAssessment(Desc: String, marks: Int, dateVal: Date,position: Int)
    {
        if(Desc != "" && marks>0 && dateVal != nil)
        {
            selectedAssessment.setAssessmentTitle(assessmentName: Desc)
            selectedAssessment.setAssessmentMarks(assessmentTotalMarks: marks)
            selectedAssessment.setAssessmentDate(date: dateVal)
            self.assessmentTitle.text = selectedAssessment.getAssessmentTitle()
            updateDelegate?.updateAssessmentDetails(Title: selectedAssessment.getAssessmentTitle(), Totalmarks: selectedAssessment.getAssessmentMarks(), AssessmentDate: selectedAssessment.getAssessmentDate(), IndexValue: self.indexPathValue)
        }
        var temppickerData: [Int] = [Int]()
        for i in 1...self.selectedAssessment.getAssessmentMarks()
        {
            temppickerData.append(i)
        }
        pickerData = temppickerData
        studentMarksTable.reloadData()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.selectedAssessment.getAssessmentMarks()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerData[row])
    }
    
    
    @IBAction func onClickDone(_ sender: Any)
    {
        // dismiss sigue
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
