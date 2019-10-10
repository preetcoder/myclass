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
    
     var loadStudents = RestAPI()
    
    var studentmanager = StudentManager()
    
    var attendancemanager = AttendanceManager()

    
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
        
        //print(date)
        dateLable.text = dateHelper.getStringFromDate(dateVal: date)
       // print(" jhdjfdhkf" + dateLable.text!)
        
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
        refreshStudents()
    }
    
    
    @IBAction func onClickPreviousDate(_ sender: Any)
    {
        let currentDateText = dateLable.text
        let currentDate = dateHelper.getDateFromString(dateVal: currentDateText!)
        let nextDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)
        dateLable.text = dateHelper.getStringFromDate(dateVal: nextDate!)
        refreshStudents()
    }
    

    
    override func viewWillAppear(_ animated: Bool) {

        refreshStudents()
    }
    
    // Delegation method
    
    func newStudentEnteredData(name: String, lastName: String, studentID: String, studentEmail: String, studentPhone: String, studentImage : String) {

        if (name != "" && studentID != "" && lastName != "" && studentEmail != "" && studentPhone != ""){
            
            
            let studentmanager = StudentManager()
            
            // save in db
            
            let newStudentStatus =  studentmanager.saveStudentinDB(email: studentEmail, studentID: studentID, first_name: name, last_name: lastName, phone: studentPhone, image: studentImage)

            if newStudentStatus {
                print("New Student Added")
            }

            // reload table view
            refreshStudents()

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
            
            
            
            let studentmanager = StudentManager()
            // delete from core db
            let deleteStatus =  studentmanager.deleteStudentRecordinDB(studentObj: allStudents[indexPath.row])
            
            if deleteStatus {
                
                // delete from array
                allStudents.remove(at: indexPath.row)
                
                //ImportData.allStudent.remove(at: indexPath.row)
                // Delete the row from the data source
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            }
            
            
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
        cell.StudentName?.text = student.getStudentName

        if student.getStudentImage == "download" {
            cell.studentImage?.image = UIImage(named: student.getStudentImage)
        }

        else {
            cell.studentImage?.image = FileSaving.getImage(imageName: student.getStudentImage)
        }

        cell.studewntAttendance?.tag = indexPath.row
        cell.studewntAttendance?.setOn(false, animated: false)
        
        let attendanceofCurrentstudentCell = attendancemanager.getAttendanceRecords(StudObj: student, lastVal: false)
        
        //print(attendanceofCurrentstudentCell)
      
        if attendanceofCurrentstudentCell.count != 0
        {
            for attendanceObject in attendanceofCurrentstudentCell.indices
            {
                print("\(attendanceofCurrentstudentCell[attendanceObject].getDate) => \(dateHelper.getDateFromString(dateVal: dateLable.text!))")
                
                if(attendanceofCurrentstudentCell[attendanceObject].getDate == dateHelper.getDateFromString(dateVal: dateLable.text!))
                {
                    cell.studewntAttendance?.setOn(attendanceofCurrentstudentCell[attendanceObject].getStatus, animated: false)
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
//        if allStudents[buttonRow].getAttendance()!.count != 0
//        {
//            //get the no. of objects
//            let Count = allStudents[buttonRow].getAttendance()!.count
//            //check if the attendance record already exists for that date
//            var newAttendance = true
//            for attendanceObject in allStudents[buttonRow].getAttendance()!.indices
//            {
//                if(allStudents[buttonRow].getAttendance()![attendanceObject].getDate() == dateHelper.getDateFromString(dateVal: dateLable.text!))
//                {
//                    newAttendance = false
//                    allStudents[buttonRow].updateAttendance(position: attendanceObject, state: sender.isOn)
//                }
//            }
//            if(newAttendance)
//            {
//                let todayAttendance = Attendance(attendanceID: Count,attendanceDate: dateHelper.getDateFromString(dateVal: dateLable.text!),attendanceStatus: sender.isOn)
//                allStudents[buttonRow].addAttendance(attendanceObj: todayAttendance)
//            }
//        }
//        else
//        {
        
        
        let recentAttendance  =  attendancemanager.getAttendanceRecords(StudObj: allStudents[buttonRow], lastVal: true)
        
        var Count : Int = 1
        
        if recentAttendance.count > 0 {
            
            let recentAttendanceRecord = recentAttendance[0]
            
            // add 1 to previous id
            Count = (recentAttendanceRecord.getID + 1)
            
        }
            
        else{
            Count = 1
        }
        
        let todayAttendance = attendancemanager.addNewAttendanceinDB(attendanceID: Count, attendanceDate: dateHelper.getDateFromString(dateVal: dateLable.text!), attendanceStatus: sender.isOn, studentObj : allStudents[buttonRow])
        
        if todayAttendance {
            print("Attendance Added")
        }
            
    }
    // MARK: - Private Methods
    private func loadSampleData() {
        
        // load all students from API/DB
        loadStudents.getDataFromURL{
            (success) -> Void in

            self.allStudents =  self.studentmanager.getStudentsfromDB()

            DispatchQueue.main.async {

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
        
        
        if segue.identifier == "addNewStudent" {
            
            let destinationVC = segue.destination as! AddStudentViewController
            
            destinationVC.delegate = self
            destinationVC.allStudentsData = self.allStudents
        }
        
        
    }
    
    func refreshStudents(){
        
        var studentmanager = StudentManager()
        allStudents = studentmanager.getStudentsfromDB()
        self.StudentData.reloadData()
    }
}
