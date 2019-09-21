//
//  HomeViewController.swift
//  myclass
//
//  Created by Bhavesh Hingad on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var allStudents : [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // performSegue(withIdentifier: "allStudents", sender: self)
        
        //aa()
        
        
        // Do any additional setup after loading the view.
    }
    func aa(){
        let aUrl = ImportData()
        aUrl.getDataFromURL{
            students in
            
            for student in students {
               self.allStudents.append(student)
            }
            self.bb()
            
        }
    }
    
    func bb() {
        print(self.allStudents.count)
    }
    
    @IBAction func onButtonPressed(_ sender: Any) {
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }
    

}
