//
//  SingleAssessmentViewController.swift
//  myclass
//
//  Created by Harpreet Singh on 21/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class SingleAssessmentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let animals = ["cat", "dog"]
    
    var selectedAssessment = Assessment();
    var indexPathValue: Int!;

    @IBOutlet weak var studentMarksTable: UITableView!
    
    
    @IBOutlet weak var assessmentTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cellIdentifier = "AssessmentDetailsTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AssessmentDetailsTableViewCell else {
            fatalError("The dequeued cell is not an instance of AssessmentDetailsTableViewCell.")
        }
        
        //print(indexPath.count)
        
        let animal   = animals[indexPath.row]
        
        cell.studentID.text = animal
        
        return cell
        
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
