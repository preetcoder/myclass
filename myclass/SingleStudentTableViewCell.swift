//
//  SingleStudentTableViewCell.swift
//  myclass
//
//  Created by Harpreet Singh on 15/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class SingleStudentTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var studentImage: UIImageView!
    
    @IBOutlet weak var StudentName: UILabel!
    
    @IBOutlet weak var studewntAttendance: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //loadData()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(){
        StudentName.text = "hello"
    }

}
