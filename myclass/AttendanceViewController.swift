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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.show()
        loadSampleData()

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "singleStudent", for: indexPath)
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SingleStudentTableViewCell", for: indexPath) as? SingleStudentTableViewCell else {
//            fatalError("The dequeued cell is not an instance of SingleStudentTableViewCell.")
//        }
        
        let student  = allStudents[indexPath.row]
        
        cell.textLabel?.text = student.getStudentName()
        
        cell.imageView?.image = UIImage(named: student.getStudentImage())
        
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
