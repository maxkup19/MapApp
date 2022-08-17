//
//  LocationsListView.swift
//  MapApp
//
//  Created by Max Kup on 16.08.2022.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var lvm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(lvm.locations) { location in
                Button {
                    lvm.showNextLocation(location)
                } label: {
                    LocationsRowView(location: location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
                
            }
        }
        .listStyle(.plain)
//        .scaledToFit()
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel())
            .previewLayout(.sizeThatFits)
    }
}


struct LocationsRowView: View {
    
    let location: Location
    
    var body: some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
