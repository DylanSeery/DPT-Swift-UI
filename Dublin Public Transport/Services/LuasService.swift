//
//  LuasService.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 03/08/2022.
//

import Foundation
import SwiftUI
import Combine

final class LuasFetchStops: ObservableObject {
    @Published var luasStops: [LuasStop] = []
    
    init() {
        loadStopsFromJson()
    }
    
    func loadStopsFromJson() {
        let data: Data
        let filename: String = "LuasStops.json"

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
            self.luasStops = try decoder.decode([LuasStop].self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \([LuasStop].self):\n\(error)")
        }
    }
}
