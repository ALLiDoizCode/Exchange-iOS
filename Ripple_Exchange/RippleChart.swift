//
//  RippleChart.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/24/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import Foundation
import SwiftDate

class RippleChart {
    
    var date:String!
    var rate:Double!
    var year:Int!
    var month:String!
    var day:Int!
    
    init(date:String,rate:Double) {
        self.date = date
        self.rate = rate
        
        let currentYear = self.date.date(format: .iso8601Auto)?.year
        let currentMonth = self.date.date(format: .iso8601Auto)?.shortMonthName
        let currentDay = self.date.date(format: .iso8601Auto)?.day
         
        self.year = currentYear
        self.month = currentMonth
        self.day = currentDay
        
    }
}
