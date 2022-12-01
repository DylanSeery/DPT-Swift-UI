//
//  LocationManager.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 29/11/2022.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    static let shared = LocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = 25.0
        manager.startUpdatingLocation()
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined:
            print("DEBUG: Not not determind")
        case .restricted:
            print("DEBUG: Not restricted")
        case .denied:
            print("DEBUG: Not denied")
        case .authorizedAlways:
            print("DEBUG: Not Authorized always")
        case .authorizedWhenInUse:
            print("DEBUG: Not Authorized when in use")
        case .authorized:
            print("DEBUG: Not Authorized")
        @unknown default:
            break;
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location
    }
}
