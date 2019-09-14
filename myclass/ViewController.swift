//
//  ViewController.swift
//  myclass
//
//  Created by Harpreet Singh on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        aa()
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
    


}

