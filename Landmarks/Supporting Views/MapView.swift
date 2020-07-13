//
//  MapView.swift
//  Landmarks
//
//  Created by Janessa Tran on 7/12/20.
//  Copyright © 2020 Janessa Tran. All rights reserved.
//

import SwiftUI
import MapKit


// To use UIView subclasses within SwiftUI, you wrap it in a SwiftUI view that conform to the UIViewRepresentable protocol
struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    // 1. add a make UIView(context:) method that creates an MKMapView
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    // 2. make an updateUIView(_: context:) method that configures the view and responds to any changes
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: landmarkData[0].locationCoordinate)
    }
}
