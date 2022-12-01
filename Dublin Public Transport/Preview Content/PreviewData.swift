//
//  PreviewData.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 02/08/2022.
//

import Foundation
import CoreLocation
import SwiftUI

var busStopPreviewData = BusStop(StopNumber: 2, Description: "Parnell Square, Parnell Street", Longitude: "-6.263695", Latitude: "53.352241")

var busStopsListPreviewData =  [BusStop](repeating: busStopPreviewData, count: 5)

var luasCoordinates = Coordinates(latitude: -6.261333, longitude: 53.339072)

var luasStopPreviewData = LuasStop(shortName: "BRO", displayName: "Broombridge", line: "Green", coordinates: luasCoordinates)

var luasStopsListPreviewData =  [LuasStop](repeating: luasStopPreviewData, count: 5)

var locationPreviewData = CLLocation(latitude: luasCoordinates.latitude, longitude: luasCoordinates.longitude)
