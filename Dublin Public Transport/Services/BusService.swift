//
//  BusService.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 03/08/2022.
//

import Foundation
import SwiftUI
import Combine

final class BusFetchStops: ObservableObject {
    @Published var busStops: [BusStop] = []
    
    init() {
        loadStopsFromJson()
    }
    
    func loadStopsFromJson() {
        let data: Data
        let filename: String = "BusStops.json"

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            self.busStops = try decoder.decode([BusStop].self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \([BusStop].self):\n\(error)")
        }
    }
}
