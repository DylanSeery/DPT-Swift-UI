//
//  Dublin_Public_TransportApp.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 02/08/2022.
//

import SwiftUI

@main
struct Dublin_Public_TransportApp: App {
    @StateObject var busStopsService = BusFetchStops()
    @StateObject var luasStopService = LuasFetchStops()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(busStopsService)
                .environmentObject(luasStopService)
        }
    }
}
