//
//  ImportData.swift
//  myclass
//
//  Created by Harpreet Singh on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct ImportData {
    // load data from API
   
     let APIURL = "https://my.api.mockaroo.com/students_data.json?key=3e4cec20"
    
     var allStudent : [Student] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    //let studentData : [Student] = []
    
    
    
    func getDataFromURL()
    {
        
        
        let url = URL(string: APIURL)
        
        URLSession.shared.dataTask(with:url!) {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]]
                //let posts = json["posts"] as? [[String: Any]] ?? []
                if json != nil {
                    for singleJsonData in json! {
                        // instantiating Student
//                        let studentData = Student(studentEmail: singleJsonData["email"]! as! String, studentID: singleJsonData["studentID"]! as! String, studentFirstName: singleJsonData["first_name"]! as! String, studentLastName: singleJsonData["last_name"]! as! String, studentPhone: singleJsonData["phone"]! as! String, studentImage: "download", studentAttendance: [], studentMarks: [])
//                        self.allStudent.append(studentData)
                        
                        //add data to coredata
                        
                        let studentData = Student(context: self.context)
                        
                        studentData.email = (singleJsonData["email"]! as! String)
                        
                        studentData.studentID = (singleJsonData["studentID"]! as! String)
                        
                        studentData.first_name = (singleJsonData["first_name"]! as! String)
                        
                        studentData.last_name = (singleJsonData["last_name"]! as! String)
                        
                        studentData.phone = (singleJsonData["phone"]! as! String)
                        
                        studentData.image = "download"
                        
//                        studentData.attendance = []
//
//                        studentData.marks = []
                        
                        print("saving data")
                        
                        do{
                            try self.context.save()
                        }
                        catch{
                            print("error saving students \(error)")
                        }
                        
                        print((singleJsonData["studentID"]! as! String))
                        
                        //let newStudent = Student()
                        
                    }
                    // callback
                   // completion(self.allStudent)
                }
                else{
                    print("failed to load data")
                }
            } catch let error as NSError {
                print(error)
            }
            }.resume()
        
        // add a dummy student or test
        
//        allStudent.append(Student(studentEmail: "test@test.com", studentID: "2332323", studentFirstName: "test", studentLastName: "test", studentPhone: "3434343", studentImage: "download", studentAttendance: [], studentMarks: []))
        
    }
    
    // add More objects
//    static func addSharedData(StudOBJ : Student) {
//        allStudent.append(StudOBJ)
//    }
    
    mutating func getDatafromDB() -> [Student]{
        if(self.allStudent.count == 0) {
            print("calling");
            getDataFromURL()
        
        
        }
        
        //print("not calling");
        let request : NSFetchRequest<Student> = Student.fetchRequest()
        
        do {
            allStudent =  try context.fetch(request)
        }catch{
            print("Error fetching students \(error)")
        }
        
        return allStudent
        
    }
}
