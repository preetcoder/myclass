//
//  AssessmentsTableViewController.swift
//  myclass
//
//  Created by Bhavesh Hingad on 16/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class AssessmentsTableViewController: UITableViewController, NewAssessmentDataDelegate, AssessmentUpdateDelegate
{
    var assessments = [Assessment]()
    
    var students = [Student]()
    
    var studentmanager = StudentManager()
    
    var assessmentmanager = AssessmentManager()
    

    @IBAction func OnAddAssessmentClick(_ sender: Any)
    {
        performSegue(withIdentifier: "newAssessment", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refershAssessments()
        
        studentdataLoad()
        //print(students)

    }
    
    func studentdataLoad(){
        
        students =  studentmanager.getStudentsfromDB()
        
        //print("hello \(students[1].getStudentName())")
        
    }
    
    // Delegated Method from NewAssessment
    func userEnteredData(Desc: String, marks: String, dateVal: Date) {
        
      
        if(Desc != "" && marks != "" && dateVal != nil)
        {
            
            // get recent assessment so can findout the id of next assessment
            
            let recentAssessment = assessmentmanager.getAssessmentRecords(lastVal: true)
            
            let assessmentNewID : Int
            
            if recentAssessment.count > 0 {
                
                let recentAssessmentRecord = recentAssessment[0]
                
                // add 1 to previous id
                assessmentNewID = (recentAssessmentRecord.getAssessmentID + 1)
           
            }
            
            else{
                assessmentNewID = 1
            }
            
            let newassessmentstatus =  assessmentmanager.addNewAssessment(assessmentID: assessmentNewID, assessmentTitle: Desc, assessmentTotalmarks: Int(marks)!, assessmentDate: dateVal)
            
            if(newassessmentstatus) {
                print("New Assessment Added")
            }
            
            // reload table view
            refershAssessments()
            
        }
       
        
    }
    
    //Delegated Method for Updating Assessment
    func updateAssessmentDetails(Title: String, Totalmarks: Int, AssessmentDate: Date, IndexValue: Int)
    {
      // just refersh the table view from db
        refershAssessments()
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
           let deleteAssessmentStatus =  assessmentmanager.deleteAssessmentinDB(assessmentObj: assessments[indexPath.row])
            
            if(deleteAssessmentStatus) {
                print("Assessment deleted")
                // delete from array also
                assessments.remove(at: indexPath.row)
                // Delete the row from the data source
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
           
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return assessments.count
        
        if assessments.count > 0 {
                        tableView.backgroundView = nil
                        tableView.separatorStyle = .singleLine
                        return assessments.count
                    }
                    else{
                        // otherwise, return 0, remove cell lines, and display a Label
                        let rect = CGRect(x: 0,
                                          y: 0,
                                          width: tableView.bounds.size.width,
                                          height: tableView.bounds.size.height)
                        let noScanLabel: UILabel = UILabel(frame: rect)
            
                        noScanLabel.text = "No Assessment"
                        noScanLabel.textColor = UIColor.gray
                        noScanLabel.font = UIFont.boldSystemFont(ofSize: 24)
            
                        noScanLabel.textAlignment = NSTextAlignment.center
            
            
            
                        tableView.backgroundView = noScanLabel
                        tableView.separatorStyle = .none
            
            
            
                        return 0
                    }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "SingleAssessmentTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SingleAssessmentTableViewCell  else {
            fatalError("The dequeued cell is not an instance of SingleAssessmentTableViewCell.")
        }
        
        let assessment = self.assessments[indexPath.row]

        // Configure the cell...
        
        cell.singleAssessmentTitle.text = assessment.getAssessmentTitle
        
        

        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "newAssessment" {
            
            let destinationVC = segue.destination as! NewAssessmentViewController
            
            destinationVC.delegate = self
        }
        
        if segue.identifier == "ViewAssessmentProfile"
        {
            let secondVC = segue.destination as! SingleAssessmentViewController
            let indexPath = sender as! IndexPath
            secondVC.selectedAssessment = assessments[indexPath.row]
            secondVC.indexPathValue = indexPath.row
            secondVC.updateDelegate = self
        }
    }
    
    // move to another screen on cell click
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ViewAssessmentProfile", sender: indexPath)
    }
    
    func refershAssessments(){
        assessments =  assessmentmanager.getAssessmentRecords(lastVal: false)
        tableView.reloadData()
    }

    

}
