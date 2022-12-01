//
//  MapView.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 29/11/2022.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @EnvironmentObject var busStopsService: BusFetchStops
    @EnvironmentObject var luasStopService: LuasFetchStops
    var coordinates: CLLocationCoordinate2D
    var mode: TransportModes
    
    func makeUIView(context: Context) -> MKMapView {
        let view = MKMapView(frame: .zero)
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
        DispatchQueue.main.async {
            view.delegate = context.coordinator
        }
        
        if (mode == TransportModes.bus) {
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let region = MKCoordinateRegion(center: coordinates, span: span)
            
            view.setRegion(region, animated: false)
            view.setUserTrackingMode(.none, animated: false)
            view.showsUserLocation = true
            loadBusMarkers(view)
        } else if (mode == TransportModes.luas) {
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let region = MKCoordinateRegion(center: coordinates, span: span)
    
            view.setRegion(region, animated: false)
            view.setUserTrackingMode(.none, animated: false)
            view.showsUserLocation = true
            loadLuasMarkers(view)
        }
    }
    
    func loadBusMarkers(_ view: MKMapView) {
        busStopsService.busStops.forEach { stop in
            let annotation = MKPointAnnotation()
            let centerCoordinate = CLLocationCoordinate2D(latitude: Double(stop.Latitude)!, longitude: Double(stop.Longitude)!)
            annotation.coordinate = centerCoordinate
            annotation.title = stop.Description
            annotation.subtitle = "Stop: \(stop.StopNumber)"
            view.addAnnotation(annotation)
        }
    }
    
    func loadLuasMarkers(_ view: MKMapView) {
        luasStopService.luasStops.forEach { stop in
            let annotation = MKPointAnnotation()
            let centerCoordinate = CLLocationCoordinate2D(latitude: stop.coordinates.latitude, longitude: stop.coordinates.longitude)
            annotation.coordinate = centerCoordinate
            annotation.title = stop.displayName
            annotation.subtitle = "\(stop.shortName): \(stop.line) line"
            view.addAnnotation(annotation)
        }
    }
    
    // MARK: Setting Coordinator
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
            if (annotation is MKUserLocation) {
                return nil
            }
            let btn = UIButton(type: .detailDisclosure)
            if (annotation.subtitle!!.contains("Stop")) {
                annotationView.markerTintColor = UIColor(.icon)
                annotationView.glyphImage = UIImage(systemName: "bus.fill")
                annotationView.glyphTintColor =  UIColor(.background)
                annotationView.canShowCallout = true
                annotationView.rightCalloutAccessoryView = btn
                
                return annotationView
            } else {
                if (annotation.subtitle!!.contains("Green")) {
                    annotationView.markerTintColor = UIColor(.green.opacity(0.85))
                } else {
                    annotationView.markerTintColor = UIColor(.red.opacity(0.85))
                }
                annotationView.glyphImage = UIImage(systemName: "tram.fill")
                annotationView.glyphTintColor =  UIColor(.background)
                annotationView.canShowCallout = true
                annotationView.rightCalloutAccessoryView = btn
                
                return annotationView
            }
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            print(view.annotation?.title)
        }
    }
}

