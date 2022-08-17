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
            
            mapLayer
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                header
                    .padding()
                
                Spacer()
                
                infoLayer
            }
        }
        .sheet(item: $lvm.sheetLocation) { location in
            LocationDetailView(location: location )
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    
    private var header: some View {
        VStack {
            
            Button {
                lvm.toggleLocationsList()
            } label: {
                Text(lvm.mapLocation.name + ", " + lvm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: lvm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: lvm.showLocationsList ? 180 : 0))
                    }
            }
            
            if lvm.showLocationsList {
                LocationsListView()
            }
            
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $lvm.mapRegion, annotationItems: lvm.locations, annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(lvm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        lvm.showNextLocation(location)
                    }
            }
        })
    }
    
    private var infoLayer: some View {
        ZStack {
            ForEach(lvm.locations) { location in
                if lvm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: .black.opacity(0.33), radius: 20)
                        .padding()
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                }
            }
        }
    }
}
