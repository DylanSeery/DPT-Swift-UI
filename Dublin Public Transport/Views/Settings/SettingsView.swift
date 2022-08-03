//
//  SettingsView.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 03/08/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Settings")
                    .font(.title2)
                    .bold()
            }.frame(maxWidth: .infinity)
        }.background(Color.background)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
