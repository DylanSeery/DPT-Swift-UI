//
//  LuasHomeView.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 02/08/2022.
//

import SwiftUI
import MapKit

struct LuasHomeView: View {
    var usersLocation: CLLocation?
    
    var body: some View {
        NavigationView {
            VStack {
                if let location = usersLocation {
                    MapView(coordinates: location.coordinate, mode: TransportModes.luas).frame(maxWidth: .infinity, maxHeight: 280)
                }
                ScrollView(showsIndicators: false) {
                    LuasStopRowList().background(Color.background)
                }
            }.background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Luas")
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

struct LuasHomeView_Previews: PreviewProvider {
    static let luasStopsService: LuasFetchStops = {
        let luasStopsService = LuasFetchStops()
        luasStopsService.luasStops = luasStopsListPreviewData
        return luasStopsService
    }()
    
    static var previews: some View {
        Group {
            LuasHomeView()
            LuasHomeView()
            .preferredColorScheme(.dark)
       }
        .environmentObject(luasStopsService)
    }
}
