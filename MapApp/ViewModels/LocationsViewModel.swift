//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Max Kup on 16.08.2022.
//

import Foundation

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
