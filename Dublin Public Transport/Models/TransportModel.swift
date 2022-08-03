//
//  TransportModel.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 02/08/2022.
//

import Foundation
import MapKit

struct BusStop: Hashable, Codable {
    let StopNumber: Int;
    let Description: String;
    let Longitude: String;
    let Latitude: String;
}

struct BusStopFav: Hashable, Codable {
    let stop: BusStop;
    let Favourite: Bool;
    let Date: Date;
}
