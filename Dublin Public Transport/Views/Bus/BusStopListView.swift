//
//  BusStopListView.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 03/08/2022.
//

import SwiftUI

struct BusStopListView: View {
    @EnvironmentObject var busStopsService: BusFetchStops
    
    var body: some View {
        VStack {
            // TransactionList.swift
            List {
                // MARK: Transaction Groups
                ForEach(Array(busStopsService.busStops.prefix(100)), id: \.StopNumber) { busStop in
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
                Image(systemName: "gearshape.fill")
                    .foregroundColor(Color.gray)
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
