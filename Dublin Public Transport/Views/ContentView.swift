//
//  ContentView.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 02/08/2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            BusHomeView()
                .tabItem {
                    Image(systemName: "bus.doubledecker")
                    Text("Bus").foregroundColor(Color.icon)
                }

            LuasHomeView()
                .tabItem {
                    Image(systemName: "tram")
                    Text("Luas")
                }
            
            FavouriteView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favourites")
                }
        }.accentColor(Color.icon)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let busStopsService: BusFetchStops = {
        let busStopsService = BusFetchStops()
        busStopsService.busStops = busStopsListPreviewData
        return busStopsService
    }()
    
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
            .preferredColorScheme(.dark)
       }
       .environmentObject(busStopsService)
    }
}
