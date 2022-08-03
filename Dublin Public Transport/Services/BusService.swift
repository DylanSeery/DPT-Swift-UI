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
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getStops()
    }
    
    func getStops() {
        guard let url = URL(string: "http://localhost:8000/bus/stops") else {
            print("URL Error")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                
                return data
            }.decode(type: [BusStop].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    case .failure(let error):
                        print("Error fetching bus stops:", error.localizedDescription)
                    case .finished:
                        print("Finished Fetching bus stops")
                }
            } receiveValue: { [weak self] result in
                self?.busStops = result
                dump(self?.busStops)
            }
            .store(in: &cancellables)
    }
}
