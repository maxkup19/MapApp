//
//  ContentView.swift
//  MapApp
//
//  Created by Max Kup on 16.08.2022.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var lvm: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $lvm.mapRegion)
                .ignoresSafeArea()
            
            
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
