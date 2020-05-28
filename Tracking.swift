//
//  Tracking.swift
//  Covid-19-Tracker
//
//  Created by Michael Rowe2 on 5/28/20.
//  Copyright © 2020 Michael Rowe. All rights reserved.
//

import Foundation

struct Tracking: Decodable {
    
    let state: String
    let total: Int
    let positive: Int
    let death: Int
    let hospitalized: Int?
}
