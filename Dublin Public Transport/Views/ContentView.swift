//
//  ContentView.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 02/08/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager.shared
    @AppStorage("darkMode") private var darkMode = false

    var body: some View {
        Group {
            if locationManager.userLocation === nil {
                LocationView()
            } else if let userLocation = locationManager.userLocation {
                TabView {
                    BusHomeView(usersLocation: userLocation)
                        .tabItem {
                            Image(systemName: "bus.doubledecker")
                            Text("Bus").foregroundColor(Color.icon)
                        }

                    LuasHomeView(usersLocation: userLocation)
                        .tabItem {
                            Image(systemName: "tram")
                            Text("Luas")
                        }
                }
            }
        }.accentColor(Color.icon)
            .preferredColorScheme(darkMode ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let busStopsService: BusFetchStops = {
        let busStopsService = BusFetchStops()
        busStopsService.busStops = busStopsListPreviewData
        return busStopsService
    }()
    static let luasStopsService: LuasFetchStops = {
        let luasStopsService = LuasFetchStops()
        luasStopsService.luasStops = luasStopsListPreviewData
        return luasStopsService
    }()
    
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
            .preferredColorScheme(.dark)
       }
       .environmentObject(busStopsService)
       .environmentObject(luasStopsService)
    }
}
