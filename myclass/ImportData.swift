//
//  ImportData.swift
//  myclass
//
//  Created by Harpreet Singh on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import Foundation

struct ImportData {
    // load data from API
   
   static  let APIURL = "https://my.api.mockaroo.com/students_data.json?key=3e4cec20"
    
    static var allStudent : [Student] = []
    
    //let studentData : [Student] = []
    
    
    
    static func getDataFromURL(_ completion: @escaping (_ students : [Student]) -> ())
    {
        
        if(self.allStudent.count > 0) {
            return completion(self.allStudent)
        }
        //var allStudent : [Student] = []
        
        let url = URL(string: APIURL)
        
        URLSession.shared.dataTask(with:url!) {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]]
                //let posts = json["posts"] as? [[String: Any]] ?? []
                if json != nil {
                    for singleJsonData in json! {
                        // instantiating Student
                        let studentData = Student(studentEmail: singleJsonData["email"]! as! String, studentID: singleJsonData["studentID"]! as! String, studentFirstName: singleJsonData["first_name"]! as! String, studentLastName: singleJsonData["last_name"]! as! String, studentPhone: singleJsonData["phone"]! as! String, studentImage: "download", studentAttendance: [], studentMarks: [])
                        self.allStudent.append(studentData)
                        
                    }
                    // callback
                    completion(self.allStudent)
                }
                else{
                    print("failed to load data")
                }
            } catch let error as NSError {
                print(error)
            }
            }.resume()
        
    }
    
//    private static var sharedData: [Student] = {
//                for x  in 1...10 {
//
//                    let randomInt = String(Int.random(in: 0..<100))
//                    let studentData = Student(studentEmail: "\(randomInt)abc@123\(x).com", studentID: "121323\(x)", studentFirstName: "hello\(x)", studentLastName: "odwodkow\(x)", studentPhone: "ksdjk2323\(x)", studentImage: "download" ,studentAttendance: [])
//                    allStudent.append(studentData)
//        }
//        return allStudent
//    }()
    
//    private init(){}
//
//    static func shared() -> [Student] {
//         ImportData.getDataFromURL{
//                            students in
//
//                            for student in students {
//                               self.allStudent.append(student)
//                            }
//                            //self.bb()
//                        }
//
//
//        }
    
    // add More objects
    static func addSharedData(StudOBJ : Student) {
        allStudent.append(StudOBJ)
    }
}
