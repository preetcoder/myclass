//
//  AttendanceViewController.swift
//  myclass
//
//  Created by Harpreet Singh on 16/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit
import SVProgressHUD

class AttendanceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NewStudentDataDelegate {
    
    var dateHelper = ConvertToDate()
    
    @IBOutlet weak var dateLable: UILabel!
    
    var allStudents = [Student]()

    
     //var delegate : userDataDelegate?
    
    @IBOutlet weak var StudentData: UITableView!
    @IBAction func AddNewStudentOnClick(_ sender: Any)
    {
         performSegue(withIdentifier: "addNewStudent", sender: self)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //print("sss")
        
        let date = Date()
        dateLable.text = dateHelper.getStringFromDate(dateVal: date)
        
        SVProgressHUD.show()
        
       
        loadSampleData()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onClickNextDate(_ sender: Any)
    {
        let currentDateText = dateLable.text
        let currentDate = dateHelper.getDateFromString(dateVal: currentDateText!)
        let nextDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)
        dateLable.text = dateHelper.getStringFromDate(dateVal: nextDate!)
        self.StudentData.reloadData()
    }
    
    
    @IBAction func onClickPreviousDate(_ sender: Any)
    {
        let currentDateText = dateLable.text
        let currentDate = dateHelper.getDateFromString(dateVal: currentDateText!)
        let nextDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)
        dateLable.text = dateHelper.getStringFromDate(dateVal: nextDate!)
        self.StudentData.reloadData()
    }
    

//    override func viewDidAppear(_ animated: Bool) {
//        //print("aaa")
//        // reload table view
//        StudentData.reloadData()
//    }
    
    override func viewWillAppear(_ animated: Bool) {

        StudentData.reloadData()
    }
    
    // Delegation method
    
    
    
    func newStudentEnteredData(name: String, lastName: String, studentID: String, studentEmail: String, studentPhone: String, studentImage : String) {
        //print("\(name) \(studentID) \(studentEmail) \(studentPhone)")
        
        if (name != "" && studentID != "" && lastName != "" && studentEmail != "" && studentPhone != ""){
            
            var newStudent = Student()
           
                newStudent = Student(studentEmail: studentEmail, studentID: studentID, studentFirstName: name, studentLastName: lastName, studentPhone: studentPhone, studentImage : studentImage, studentAttendance: [])
            
            
            
            
            allStudents.insert(newStudent, at: 0)
            
            // add to singleton too
            ImportData.addSharedData(StudOBJ: newStudent)
            
            // reload table view
            StudentData.reloadData()
            
        }
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
        if student.getStudentImage() == "download" {
             cell.studentImage?.image = UIImage(named: student.getStudentImage())
        }
        
        else {
            cell.studentImage?.image = FileSaving.getImage(imageName: student.getStudentImage())
        }
       
        cell.studewntAttendance?.tag = indexPath.row
        cell.studewntAttendance?.setOn(false, animated: false)
        if allStudents[indexPath.row].getAttendance()!.count != 0
        {
            for attendanceObject in allStudents[indexPath.row].getAttendance()!.indices
            {
                if(allStudents[indexPath.row].getAttendance()![attendanceObject].getDate() == dateHelper.getDateFromString(dateVal: dateLable.text!))
                {
                    cell.studewntAttendance?.setOn(allStudents[indexPath.row].getAttendance()![attendanceObject].getStatus(), animated: false)
                }
            }
        }
        cell.studewntAttendance.addTarget(self, action: #selector(buttonClicked(sender:)), for: .valueChanged)
        return cell
    }
    
    @objc func buttonClicked(sender:UISwitch)
    {
        let buttonRow = sender.tag
        
        // check if array is empty
        if allStudents[buttonRow].getAttendance()!.count != 0
        {
            //get the no. of objects
            let Count = allStudents[buttonRow].getAttendance()!.count
            //check if the attendance record already exists for that date
            var newAttendance = true
            for attendanceObject in allStudents[buttonRow].getAttendance()!.indices
            {
                if(allStudents[buttonRow].getAttendance()![attendanceObject].getDate() == dateHelper.getDateFromString(dateVal: dateLable.text!))
                {
                    newAttendance = false
                    allStudents[buttonRow].updateAttendance(position: attendanceObject, state: sender.isOn)
                }
            }
            if(newAttendance)
            {
                let todayAttendance = Attendance(attendanceID: Count,attendanceDate: dateHelper.getDateFromString(dateVal: dateLable.text!),attendanceStatus: sender.isOn)
                allStudents[buttonRow].addAttendance(attendanceObj: todayAttendance)
            }
        }
        else
        {
            let Count = 0
            let todayAttendance = Attendance(attendanceID: Count,attendanceDate: dateHelper.getDateFromString(dateVal: dateLable.text!),attendanceStatus: sender.isOn)
            allStudents[buttonRow].addAttendance(attendanceObj: todayAttendance)
        }
    }
    // MARK: - Private Methods
    private func loadSampleData() {
        
       allStudents = ImportData.shared()
        
                    DispatchQueue.main.async {
                        //tableView.reloadData()
                        self.StudentData.reloadData()
                        // disappear loader
                        SVProgressHUD.dismiss()
                    }
        
    }

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showProfile" {
            
            let secondVC = segue.destination as! StudentProfileViewController
            
            let indexPath = sender as! IndexPath
            
            secondVC.selectedStudent = allStudents[indexPath.row]
            
        }
        
        
        if segue.identifier == "addNewStudent" {
            
            let destinationVC = segue.destination as! AddStudentViewController
            
            destinationVC.delegate = self
            destinationVC.allStudentsData = self.allStudents
        }
        
       
        
       
        
    }
    

}
