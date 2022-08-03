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
                VStack(alignment: .leading, spacing: 24) {
                    Text("Luas")
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

struct LuasHomeView_Previews: PreviewProvider {
    static var previews: some View {
        LuasHomeView()
    }
}
