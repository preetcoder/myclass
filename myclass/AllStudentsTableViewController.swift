//
//  AllStudentsTableViewController.swift
//  myclass
//
//  Created by Harpreet Singh on 15/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit
import SVProgressHUD


class AllStudentsTableViewController: UITableViewController {
    
    var allStudents = [Student]()

    @IBAction func addNewStudentPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "addNewStudent", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show loader
        SVProgressHUD.show()
        
        loadSampleData()
        
//        DispatchQueue.main.async { self.tableView.reloadData() }
        
        
        //print(self.allStudents.count)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
     // MARK: - Private Methods
    private func loadSampleData() {
        
        // load data from API
//        let aUrl = ImportData()
//        aUrl.getDataFromURL{
//            students in
//            
//            for student in students {
//                self.allStudents.append(student)
//            
//            }
//           
//            // reload view
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//                // disappear loader
//                SVProgressHUD.dismiss()
//            }
//         
//            
//        }

        
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allStudents.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "SingleStudentTableViewCell"
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SingleStudentTableViewCell else {
            fatalError("The dequeued cell is not an instance of SingleStudentTableViewCell.")
        }
        
        let student = allStudents[indexPath.row]

        // Configure the cell...
        
        cell.StudentName.text = student.getStudentName()
        cell.studentImage.image = UIImage(named: student.getStudentImage())
        cell.studewntAttendance.tag = indexPath.row

        return cell
    }
    
    // move to another screen on cell click
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       performSegue(withIdentifier: "viewProfile", sender: indexPath)
    }

 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            // delete from array first
            allStudents.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "viewProfile" {
            
                let secondVC = segue.destination as! StudentProfileViewController
                
                let indexPath = sender as! IndexPath
                
                secondVC.selectedStudent = allStudents[indexPath.row]
            
        }
    }
    
 
    
    

}
