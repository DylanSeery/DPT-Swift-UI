//
//  PreviewData.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 02/08/2022.
//

import Foundation
import SwiftUI

var busStopPreviewData = BusStop(StopNumber: 2, Description: "Parnell Square, Parnell Street", Longitude: "-6.263695", Latitude: "53.352241")

var busStopsListPreviewData =  [BusStop](repeating: busStopPreviewData, count: 5)
