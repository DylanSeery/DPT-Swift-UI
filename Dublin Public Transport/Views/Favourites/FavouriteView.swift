//
//  FavouriteView.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 03/08/2022.
//

import SwiftUI

struct FavouriteView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                
            }.background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Favourites")
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

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
