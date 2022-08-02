//
//  Dublin_Public_TransportApp.swift
//  Dublin Public Transport WatchKit Extension
//
//  Created by Dylan Seery on 02/08/2022.
//

import SwiftUI

@main
struct Dublin_Public_TransportApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
