//
//  MapHeaderView.swift
//  MapApp
//
//  Created by Max Kup on 16.08.2022.
//

import SwiftUI

struct MapHeaderView: View {
    let name: String
    let cityName: String
    var body: some View {
        
    }
}

struct MapHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MapHeaderView(name: "Colosseum", cityName: "Rome")
            MapHeaderView(name: "Louvre", cityName: "Paris")
        }
        .previewLayout(.sizeThatFits)
    }
}
