//
//  AttendanceViewController.swift
//  myclass
//
//  Created by Harpreet Singh on 16/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit
import SVProgressHUD

class AttendanceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var allStudents = [Student]()

    
    
    @IBOutlet weak var StudentData: UITableView!
    
    @IBAction func AddNewStudentOnClick(_ sender: Any)
    {
         performSegue(withIdentifier: "addNewStudent", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.show()
        loadSampleData()

        // Do any additional setup after loading the view.
    }
    
    // move to another screen on cell click
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showProfile", sender: indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allStudents.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            // delete from array first
            allStudents.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "singleStudent", for: indexPath)
        
        let cellIdentifier = "SingleStudentTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SingleStudentTableViewCell else {
            fatalError("The dequeued cell is not an instance of SingleStudentTableViewCell.")
        }
        
        //print(indexPath.count)
        
        let student  = allStudents[indexPath.row]
        
        cell.StudentName?.text = student.getStudentName()
        //cell.StudentName.text = "ss"
        cell.studentImage?.image = UIImage(named: student.getStudentImage())
        
        return cell
        
        
        
    }
    
    // MARK: - Private Methods
    private func loadSampleData() {
        
        // load data from API
        let aUrl = ImportData()
        aUrl.getDataFromURL{
            students in
            
            for student in students {
                self.allStudents.append(student)
                
            }
            
            // reload view
            DispatchQueue.main.async {
                //tableView.reloadData()
                self.StudentData.reloadData()
                // disappear loader
                SVProgressHUD.dismiss()
            }
            
            
        }
        
        
    }

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProfile" {
            
            let secondVC = segue.destination as! StudentProfileViewController
            
            let indexPath = sender as! IndexPath
            
            secondVC.selectedStudent = allStudents[indexPath.row]
            
        }
    }
    

}
