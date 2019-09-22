//
//  HomeViewController.swift
//  myclass
//
//  Created by Bhavesh Hingad on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

    var allStudents : [Student] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
//    func aa(){
//        let aUrl = ImportData()
//        aUrl.getDataFromURL{
//            students in
//            
//            for student in students {
//               self.allStudents.append(student)
//            }
//            //self.bb()
//            
//        }
//    }
   
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }
    

}
