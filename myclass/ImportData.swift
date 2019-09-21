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
   
    let APIURL = "https://my.api.mockaroo.com/student_data.json?key=b8dbd570"
    
    static var allStudent : [Student] = []
    
    //let studentData : [Student] = []
    
    
    
//    func getDataFromURL(_ completion: @escaping (_ students : [Student]) -> ())
//    {
//
//
//        var allStudent : [Student] = []
//
//        let url = URL(string: APIURL)
//
////        URLSession.shared.dataTask(with:url!) {(data, response, error) in
////            guard let data = data, error == nil else { return }
////
////            //print(data)
////
////            do {
////                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]]
////                //let posts = json["posts"] as? [[String: Any]] ?? []
////
////                if json != nil {
////
////                    for singleJsonData in json! {
////                        // instantiating Student
////                        let studentData = Student(studentEmail: singleJsonData["email"]! as! String, studentID: singleJsonData["studentID"]! as! String, studentFirstName: singleJsonData["first_name"]! as! String, studentLastName: singleJsonData["last_name"]! as! String, studentPhone: singleJsonData["phone"]! as! String, studentImage: "download")
////                        allStudent.append(studentData)
////
////                    }
////                    // callback
////                    completion(allStudent)
////                }
////                else{
////                    print("failed to load data")
////                }
////            } catch let error as NSError {
////                print(error)
////            }
////        }.resume()
//
//        // dummmy data
//
//        print("callme")
//        for x  in 1...10 {
//
//            let randomInt = String(Int.random(in: 0..<100))
//            let studentData = Student(studentEmail: "\(randomInt)abc@123\(x).com", studentID: "121323\(x)", studentFirstName: "hello\(x)", studentLastName: "odwodkow\(x)", studentPhone: "ksdjk2323\(x)", studentImage: "download")
//            allStudent.append(studentData)
//        }
//
//        // callback
//                            completion(allStudent)
//
//
//    }
    
    private static var sharedData: [Student] = {
                for x  in 1...10 {
        
                    let randomInt = String(Int.random(in: 0..<100))
                    let studentData = Student(studentEmail: "\(randomInt)abc@123\(x).com", studentID: "121323\(x)", studentFirstName: "hello\(x)", studentLastName: "odwodkow\(x)", studentPhone: "ksdjk2323\(x)", studentImage: "download")
                    allStudent.append(studentData)
        }
        return allStudent
    }()
    
    private init(){}
    
    static func shared() -> [Student] {
        return ImportData.sharedData
    }
    
    // add More objects
    static func addSharedData(StudOBJ : Student) {
        allStudent.append(StudOBJ)
    }
}

