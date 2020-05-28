//
//  TrackingViewModel.swift
//  Covid-19-Tracker
//
//  Created by Michael Rowe2 on 5/28/20.
//  Copyright © 2020 Michael Rowe. All rights reserved.
//

import Foundation

class TrackingViewModel {
    
    var tracking: Tracking
    
    init(tracking:Tracking){
        self.tracking = tracking
    }
    
    let id: UUID = UUID()
    
    var state: String {
        return self.tracking.state.uppercased()
    }
    
    var total: Int {
        return self.tracking.total
    }
    
    var positive: Int {
        return self.tracking.positive
    }
    
    var death: Int {
        return self.tracking.death
    }

    var mortality: Float {
        let pmortality: Float
        if self.tracking.positive != 0 {
            pmortality = (Float(self.tracking.death) / Float(self.tracking.positive)) * 100
        } else {
            pmortality = 0
        }
        print("\(self.tracking.death), \(self.tracking.positive), \(pmortality)")
        return pmortality
    }
    
    var perPositive: Float {
        let pPerPositive: Float
        if self.tracking.total != 0 {
            pPerPositive = (Float(self.tracking.positive) / Float(self.tracking.total)) * 100
        } else {
            pPerPositive = 0
        }
        print("\(self.tracking.total), \(self.tracking.positive), \(pPerPositive)")
        return pPerPositive
    }
    
    var hospitalized: Int {
        return self.tracking.hospitalized ?? 0
    }
}
