//
//  TrackingListViewModel.swift
//  Covid-19-Tracker
//
//  Created by Michael Rowe2 on 5/28/20.
//  Copyright © 2020 Michael Rowe. All rights reserved.
//

import Foundation

class TrackingListViewModel: ObservableObject {
    
     @Published var trackings = [TrackingViewModel]()
    
    func getTrackingData() {
        Webservice().getCovidTrackingResult{ trackingList in
            if let trackingList = trackingList {
                DispatchQueue.main.async {
                    self.trackings = trackingList.map(TrackingViewModel.init)
                }
            }
        }
    }
}
