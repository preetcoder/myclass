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

    @IBAction func OnAddAssessmentClick(_ sender: Any)
    {
        performSegue(withIdentifier: "newAssessment", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentdataLoad()
        //print(students)

    }
    
    func studentdataLoad(){
        
        //students =  ImportData.allStudent
        
        //print("hello \(students[1].getStudentName())")
        
    }
    
    // Delegated Method from NewAssessment
    func userEnteredData(Desc: String, marks: String, dateVal: Date) {
        
        //print("\(Desc) \(marks) \(dateVal)")
        
        if(Desc != "" && marks != "" && dateVal != nil)
        {
//         let newAssessment = Assessment(assessmentId: (assessments.count + 1), assessmentName: Desc, assessmentTotalMarks: Int(marks)!, date: dateVal)
//
//            assessments.append(newAssessment)
            // reload table view
            tableView.reloadData()
        }
       
        
    }
    
    //Delegated Method for Updating Assessment
    func updateAssessmentDetails(Title: String, Totalmarks: Int, AssessmentDate: Date, IndexValue: Int)
    {
        if(Title != "" && Totalmarks>0 && AssessmentDate != nil)
        {
//            assessments[IndexValue].setAssessmentTitle(assessmentName: Title)
//            assessments[IndexValue].setAssessmentMarks(assessmentTotalMarks: Totalmarks)
//            assessments[IndexValue].setAssessmentDate(date: AssessmentDate)
        }
        tableView.reloadData()
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            // delete from array first
            assessments.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
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
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let assessment = self.assessments[indexPath.row]

        // Configure the cell...
        
//        cell.singleAssessmentTitle.text = assessment.getAssessmentTitle()
        
        

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

    

}
