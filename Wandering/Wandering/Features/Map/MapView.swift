//
//  MapView.swift
//  Wandering
//
//  Created by 이유정 on 6/26/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var spotManager = TouristSpotManager()

    var body: some View {
        NavigationStack {
            ZStack {
                if locationManager.isAuthorized {
                    Map
                }
            }
        }
    }
}

#Preview {
    MapView()
}
