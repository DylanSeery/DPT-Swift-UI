//
//  BusHomeView.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 02/08/2022.
//

import SwiftUI
import MapKit

struct BusHomeView: View {
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.334_900,
                                           longitude: -122.009_020),
            latitudinalMeters: 750,
            longitudinalMeters: 750
        )
    
    var body: some View {
        NavigationView {
            ScrollView {
//                Map(coordinateRegion: $region).frame(width: 400, height: 300)
                
                BusStopRowList()
                
            }.background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Dublin Bus")
            .toolbar {
                ToolbarItem {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(Color.gray)
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
