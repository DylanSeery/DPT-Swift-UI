//
//  BusHomeView.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 02/08/2022.
//

import SwiftUI
import MapKit

struct BusHomeView: View {
    var usersLocation: CLLocation?
    
    var body: some View {
        NavigationView {
            VStack {
                if let location = usersLocation {
                    MapView(coordinates: location.coordinate, mode: TransportModes.bus).frame(maxWidth: .infinity, maxHeight: 280)
                }
                ScrollView(showsIndicators: false) {
                    BusStopRowList().background(Color.background)
                }
            }.background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Dublin Bus")
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: SettingsView(),
                    label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color.gray)
                    })
                }
            }
        }.navigationViewStyle(.stack).accentColor(Color.text)
    }
}

struct BusHomeView_Previews: PreviewProvider {
    static let busStopsService: BusFetchStops = {
        let busStopsService = BusFetchStops()
        busStopsService.busStops = busStopsListPreviewData
        return busStopsService
    }()
    
    static var previews: some View {
        Group {
            BusHomeView()
            BusHomeView()
            .preferredColorScheme(.dark)
       }
       .environmentObject(busStopsService)
    }
}
