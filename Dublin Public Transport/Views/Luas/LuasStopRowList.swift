//
//  LuasStopRowList.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 03/08/2022.
//

import SwiftUI

struct LuasStopRowList: View {
    @EnvironmentObject var luasStopsService: LuasFetchStops

    var body: some View {
        VStack {
            HStack {
                // MARK: Header Title
                Text("Stops Near you")
                    .bold()

                Spacer()

                // MARK: Header Link
                NavigationLink {
                    LuasStopListView()
                } label: {
                    HStack(spacing: 4) {
                        Text("See All Stops")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding([.bottom])
            
            ForEach(Array(luasStopsService.luasStops.prefix(5).enumerated()), id: \.element) { index, luasStop in
                LuasStopRow(luasStop: luasStop)
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
    }
}

struct LuasStopRowList_Previews: PreviewProvider {
    static let luasStopsService: LuasFetchStops = {
        let luasStopsService = LuasFetchStops()
        luasStopsService.luasStops = luasStopsListPreviewData
        return luasStopsService
    }()
    
    static var previews: some View {
        Group {
            LuasStopRowList()
            LuasStopRowList()
            .preferredColorScheme(.dark)
       }
       .environmentObject(luasStopsService)
    }
}
