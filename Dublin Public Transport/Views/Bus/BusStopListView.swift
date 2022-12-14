//
//  BusStopListView.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 03/08/2022.
//

import SwiftUI
import SwiftUIX

struct BusStopListView: View {
    @EnvironmentObject var busStopsService: BusFetchStops
    @State var isEditing: Bool = false
    @State var searchText: String = ""
    
    var body: some View {
        VStack {
            SearchBar("Search...", text: $searchText, isEditing: $isEditing)
                        .showsCancelButton(isEditing)
                        .onCancel { print("Canceled!") }
            
            List {
                ForEach(Array(busStopsService.busStops), id: \.StopNumber) { busStop in
                    BusStopRow(busStop: busStop)
                }.listRowBackground(Color.background)
            }
            .listStyle(.plain)
        }
        .navigationTitle("Dublin Bus Stops")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
        .toolbar {
            ToolbarItem {
                NavigationLink(destination: SettingsView(),
                label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(Color.gray)
                })
            }
        }
    }
}

struct BusStopListView_Previews: PreviewProvider {
    static let busStopsService: BusFetchStops = {
        let busStopsService = BusFetchStops()
        busStopsService.busStops = busStopsListPreviewData
        return busStopsService
    }()
    
    static var previews: some View {
        Group {
            BusStopListView()
            BusStopListView()
            .preferredColorScheme(.dark)
       }
       .environmentObject(busStopsService)
    }

}
