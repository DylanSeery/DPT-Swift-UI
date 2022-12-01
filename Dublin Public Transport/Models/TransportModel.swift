//
//  TransportModel.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 02/08/2022.
//

import Foundation
import MapKit

enum TransportModes {
  case bus, luas
}

struct BusStop: Hashable, Codable {
    let StopNumber: Int;
    let Description: String;
    let Longitude: String;
    let Latitude: String;
}

struct LuasStop: Hashable, Codable {
    let shortName: String;
    let displayName: String;
    let line: String;
    let coordinates: Coordinates;
}

struct Coordinates: Hashable, Codable {
    let latitude: Double;
    let longitude: Double;
}

struct BusStopFav: Hashable, Codable {
    let stop: BusStop;
    let Favourite: Bool;
    let Date: Date;
}
