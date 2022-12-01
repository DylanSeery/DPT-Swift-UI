//
//  SettingsView.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 03/08/2022.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("darkMode") private var darkMode = false

    var body: some View {
        ScrollView {
            VStack {
                Toggle(isOn: $darkMode) {
                    Text("Dark Mode")
                        .font(.title3)
                }
                .tint(Color.icon)
            }.frame(maxWidth: .infinity, alignment: .leading).padding()
        }.background(Color.background)
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        .accentColor(Color.text)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
        SettingsView().preferredColorScheme(.dark)
    }
}
