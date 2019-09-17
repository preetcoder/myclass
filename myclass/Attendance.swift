//
//  Attendance.swift
//  myclass
//
//  Created by Harpreet Singh on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import Foundation

struct Attendance {
    
    private var id : Int
    private var date : Date
    private var status : Bool
    
    // initializers
    init(attendanceID : Int, attendanceDate : Date, attendanceStatus : Bool) {

        id = attendanceID
        date = attendanceDate
        status = attendanceStatus
        
    }
    
    
    
}
