//
//  LuasStopListView.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 03/08/2022.
//

import SwiftUI
import SwiftUIX

struct LuasStopListView: View {
    @EnvironmentObject var luasStopsService: LuasFetchStops
    @State var isEditing: Bool = false
    @State var searchText: String = ""
    
    var body: some View {
        VStack {
            SearchBar("Search...", text: $searchText, isEditing: $isEditing)
                        .showsCancelButton(isEditing)
                        .onCancel { print("Canceled!") }
                        .padding([.trailing, .leading])
            
            List {
                ForEach(Array(luasStopsService.luasStops), id: \.hashIdentifiable) { luasStops in
                    LuasStopRow(luasStop: luasStops)
                }.listRowBackground(Color.background)
            }
            .listStyle(.plain)
        }
        .navigationTitle("Luas Stops")
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

struct LuasStopListView_Previews: PreviewProvider {
    static let luasStopsService: LuasFetchStops = {
        let luasStopsService = LuasFetchStops()
        luasStopsService.luasStops = luasStopsListPreviewData
        return luasStopsService
    }()
    
    static var previews: some View {
        Group {
            LuasStopListView()
            LuasStopListView()
            .preferredColorScheme(.dark)
       }
       .environmentObject(luasStopsService)
    }

}
