//
//  InsetMapView.swift
//  SwiftUI_Africa
//
//  Created by Shadat Mufakhkhar Tonmoy on 24/7/24.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 5.89381, longitude: 6.397239), span: MKCoordinateSpan(latitudeDelta: 60, longitudeDelta: 60))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .frame(height: 256)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    InsetMapView()
}
