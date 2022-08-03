//
//  LuasHomeView.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 02/08/2022.
//

import SwiftUI

struct LuasHomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                
            }.background(Color.background)
            .navigationTitle("Luas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: SettingsView(),
                    label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color.gray)
                    })
                }
            }
        }.navigationViewStyle(.stack)
    }
}

struct LuasHomeView_Previews: PreviewProvider {
    static var previews: some View {
        LuasHomeView()
    }
}
