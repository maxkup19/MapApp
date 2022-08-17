//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Max Kup on 16.08.2022.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    //All loaded locations
    @Published var locations: [Location]
    
    //Current Location
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    //Current region
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationsList: Bool = false
    
    @Published var sheetLocation: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation {
            mapRegion = MKCoordinateRegion(center: location.coordinates,
                                           span: mapSpan)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            self.showLocationsList.toggle()
        }
    }
    
    func showNextLocation(_ location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func  nextLocation() {
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Couldnt find location in locations array")
            return
        }
        
        let nextIndex = (currentIndex + 1) % locations.count
        let nextLocation = locations[nextIndex]
        showNextLocation(nextLocation)
        
    }
}
