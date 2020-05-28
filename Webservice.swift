//
//  Webservice.swift
//  Covid-19-Tracker
//
//  Created by Michael Rowe2 on 5/28/20.
//  Copyright © 2020 Michael Rowe. All rights reserved.
//

import Foundation

class Webservice {
    
    func getCovidTrackingResult(completion: @escaping([Tracking]?) -> Void){
        
        guard let url = URL(string: "https://covidtracking.com/api/v1/states/current.json") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data, error == nil else {
                return completion(nil)
            }
            let trackingList = try? JSONDecoder().decode([Tracking].self, from: data)
            completion(trackingList)
            
        }.resume()
    }
    
}
