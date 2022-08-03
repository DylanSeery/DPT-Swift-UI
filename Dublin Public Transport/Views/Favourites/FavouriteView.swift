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
                VStack(alignment: .leading, spacing: 24) {
                    Text("Favourites")
                        .font(.title2)
                        .bold()
                }.frame(maxWidth: .infinity)
                
            }.background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(Color.gray)
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
