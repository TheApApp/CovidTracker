  //
//  ContentView.swift
//  Covid-19-Tracker
//
//  Created by Michael Rowe2 on 5/28/20.
//  Copyright © 2020 Michael Rowe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var trackingListVM = TrackingListViewModel()
    
    init() {
        self.trackingListVM.getTrackingData()
    }
    
    
    
    var body: some View {
        NavigationView{
            
            List(self.trackingListVM.trackings, id: \.id) {
                tracking in
                
                HStack{
                    Text(tracking.state)
                    .padding()
                        .foregroundColor(Color.white)
                        .background(Color.purple)
                    .clipShape(Circle())
                    Spacer()
                    VStack{
                        HStack{
                            Text("🧪: \(tracking.total)")
                            Text("➕: \(tracking.positive)")
                        }
                        Spacer()
                        HStack{
                            Text("Dead 💀: \(tracking.death)")
                            Text("🏥: \(tracking.hospitalized)")
                        }
                        Spacer()
                        HStack{
                            Text("☠️: \(tracking.mortality, specifier: "%.2f")% ")
                            Text("👩‍⚕️: \(tracking.perPositive, specifier: "%.2f")% ")
                        }
                    }
                    Spacer()
                    
                }
                
            }
            .navigationBarTitle("Covid19 Tracking")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
