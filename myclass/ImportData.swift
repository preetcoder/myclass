//
//  ImportData.swift
//  myclass
//
//  Created by Harpreet Singh on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import Foundation

struct ImportData {
   
    let APIURL = "https://my.api.mockaroo.com/students_data.json?key=3e4cec20"
    
    func getDataFromURL(_ completion: @escaping (_ students : [Student]) -> ())
    {
        
        
        var allStudent : [Student] = []
        
        let url = URL(string: APIURL)
        
        URLSession.shared.dataTask(with:url!) {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]]
                //let posts = json["posts"] as? [[String: Any]] ?? []
                if json != nil {
                    for singleJsonData in json! {
                        //print(singleJsonData["email"])
                        let studentData = Student(studentEmail: singleJsonData["email"]! as! String, studentID: singleJsonData["studentID"]! as! String, studentFirstName: singleJsonData["first_name"]! as! String, studentLastName: singleJsonData["last_name"]! as! String, studentPhone: singleJsonData["phone"]! as! String, studentImage: singleJsonData["image"]! as! String)
                        allStudent.append(studentData)
                        
                    }
                    // callback 
                    completion(allStudent)
                }
                else{
                    print("failed to load data")
                }
            } catch let error as NSError {
                print(error)
            }
        }.resume()
        
    }
}

