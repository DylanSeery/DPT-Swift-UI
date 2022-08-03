//
//  BusStopRowList.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 03/08/2022.
//

import SwiftUI

struct BusStopRowList: View {
    @EnvironmentObject var busStopsService: BusFetchStops

    var body: some View {
        VStack {
            HStack {
                // MARK: Header Title
                Text("Stops Near you")
                    .bold()

                Spacer()

                // MARK: Header Link
                NavigationLink {
                    BusStopListView()
                } label: {
                    HStack(spacing: 4) {
                        Text("See All Stops")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding([.top, .bottom])
            
            ForEach(Array(busStopsService.busStops.prefix(5).enumerated()), id: \.element) { index, busStop in
                BusStopRow(busStop: busStop)
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
    }
}

struct BusStopRowList_Previews: PreviewProvider {
    static let busStopsService: BusFetchStops = {
        let busStopsService = BusFetchStops()
        busStopsService.busStops = busStopsListPreviewData
        return busStopsService
    }()
    
    static var previews: some View {
        Group {
            BusStopRowList()
            BusStopRowList()
            .preferredColorScheme(.dark)
       }
       .environmentObject(busStopsService)
    }
}
