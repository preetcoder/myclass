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

struct RestAPI {
    // load data from API
   
     let APIURL = "https://my.api.mockaroo.com/students_data.json?key=3e4cec20"
    
     //var allStudent : [Student] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // create object to save data
    let studentmanager = StudentManager()
    
    
    
    //let studentData : [Student] = []
    
    
    
    func getDataFromURL(_ completion : @escaping (_ success: Bool) -> Void)
    {
        
        
        let url = URL(string: APIURL)
        
        if(studentmanager.checkifStudentsExistsinDB()){
           return completion(true)
        }
        
        URLSession.shared.dataTask(with:url!) {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]]
                //let posts = json["posts"] as? [[String: Any]] ?? []
                if json != nil {
                    for singleJsonData in json! {
                        
                        // save in db with caling method
                        
                        let studentStatus =  self.studentmanager.saveStudentinDB(email: (singleJsonData["email"]! as! String), studentID: (singleJsonData["studentID"]! as! String), first_name: (singleJsonData["first_name"]! as! String), last_name: (singleJsonData["last_name"]! as! String), phone: (singleJsonData["phone"]! as! String), image : "download")
                        
                        if(studentStatus){
                            print("New Student Added in DB")
                        }
                        
                    }
                    // callback
                   
                    completion(true)
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
