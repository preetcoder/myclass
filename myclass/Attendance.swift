//
//  Attendance.swift
//  myclass
//
//  Created by Harpreet Singh on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import Foundation

struct Attendance {
    
    private var id : Int?
    private var date : Date?
    private var status : Bool?
    
    init() {
    }
    
    // initializers
    init(attendanceID : Int, attendanceDate : Date, attendanceStatus : Bool) {
        self.init();
        id = attendanceID
        date = attendanceDate
        status = attendanceStatus
        
    }
    
    func getID() -> Int
    {
        return id!
    }
    
    func getDate() -> Date {
        return date!
    }
    
    func getStatus() -> Bool {
        return status!
    }
    
    mutating func updateStatus(Status : Bool)
    {
        self.status = Status
    }
    
}
