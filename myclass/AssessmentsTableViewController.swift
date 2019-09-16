//
//  AssessmentsTableViewController.swift
//  myclass
//
//  Created by Bhavesh Hingad on 16/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class AssessmentsTableViewController: UITableViewController {
    
    var assessments = [Assessment]()

    @IBAction func OnAddAssessmentClick(_ sender: Any)
    {
        performSegue(withIdentifier: "newAssessment", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleMeals()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //MARK: Private Methods
    
    private func loadSampleMeals() {
        
        let assessment1 = Assessment(assessmentId: 1, assessmentName: "Assessment1", assessmentTotalMarks: 10)
        
        let assessment2 = Assessment(assessmentId: 2, assessmentName: "Assessment2", assessmentTotalMarks: 100)
        
        assessments.append(assessment1)
        assessments.append(assessment2)
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
//        if items.count > 0 {
//            tableView.backgroundView = nil
//            tableView.separatorStyle = .singleLine
//            return 1
//        }
//        else{
//            // otherwise, return 0, remove cell lines, and display a Label
//            let rect = CGRect(x: 0,
//                              y: 0,
//                              width: tableView.bounds.size.width,
//                              height: tableView.bounds.size.height)
//            let noScanLabel: UILabel = UILabel(frame: rect)
//
//            noScanLabel.text = "No Scans"
//            noScanLabel.textColor = UIColor.gray
//            noScanLabel.font = UIFont.boldSystemFont(ofSize: 24)
//
//            noScanLabel.textAlignment = NSTextAlignment.center
//
//
//
//            tableView.backgroundView = noScanLabel
//            tableView.separatorStyle = .none
//
//
//
//            return 0
//        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return assessments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "SingleAssessmentTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SingleAssessmentTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let assessment = self.assessments[indexPath.row]

        // Configure the cell...
        
        cell.assessmentTitle.text = assessment.getAssessmentTitle()
        
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
