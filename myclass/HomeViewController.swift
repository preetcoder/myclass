//
//  HomeViewController.swift
//  myclass
//
//  Created by Bhavesh Hingad on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        aa()
        // Do any additional setup after loading the view.
    }
    func aa(){
        let aUrl = ImportData()
        aUrl.getDataFromURL{
            students in
            
            for student in students {
                print(student.getStudentID())
                print(student.getStudentName())
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
